require("nvimsetup.remap")
require("nvimsetup.packer")
require("nvimsetup.set")
require("autoclose").setup()
require("staline").setup()



-- GDB PROJECT START
function center_text(text, width)
    local pad = math.floor((width - #text) / 2)
    if pad < 0 then pad = 0 end
    return string.rep(" ", pad) .. text
end

function fit_text(text, width)
    local len = #text
    local res = {}
    local i = 1
    while i < len do
        table.insert(res, string.sub(text, i, i + width))
        i = i + width
    end

    return res;
end

function bottom_text(text, height)
    local empty = {}

    for _ = 1, height - 2 do
        table.insert(empty, "")
    end

    table.insert(empty, text)

    return empty
end

function clean(text)
    return text:gsub("[\27\155][][()#;?%d]*[A-PRZcf-ntqry=><~]", "")
end

function yes_no_popup(msg, callback)
    local buf = vim.api.nvim_create_buf(false, true)


    local width = #msg
    local height = 5
    local opts = {
        relative = "editor",
        width = width,
        height = height,
        col = (vim.o.columns - width) / 2,
        row = (vim.o.lines - height) / 2,
        style = "minimal",
        border = "rounded",
    }

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { center_text(clean(msg), width) })
    vim.api.nvim_buf_set_lines(buf, -1, -1, false, bottom_text(center_text("[y] Yes   [n] No", width), height))

    local win = vim.api.nvim_open_win(buf, true, opts)
    vim.api.nvim_set_current_win(win)

    vim.keymap.set("n", "y", function()
        vim.api.nvim_win_close(win, true)
        callback(true)
    end, { buffer = buf, nowait = true })

    vim.keymap.set("n", "n", function()
        vim.api.nvim_win_close(win, true)
        callback(false)
    end, { buffer = buf, nowait = true })
end

function gdb_start(fileName, ex)
    if vim.g.gdb_active then
        return
    end

    local buf = vim.api.nvim_create_buf(false, true)
    local view_buf = vim.api.nvim_create_buf(false, true)

    vim.cmd("belowright split")

    local win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(win, buf)


    -- vim.api.nvim_buf_set_text(buf, 0, 0, 0, 0, { "buf"})

    local jobID = vim.fn.jobstart("gdb-multiarch " .. fileName .. " -ex \"target extended-remote localhost:3333\"", {
        term = true,
        pty = true,
        on_stdout = function(_, data, _)
            for _, line in pairs(data) do
                print(line)
                if string.find(line, "load?") then
                    yes_no_popup(line, function(choice)
                        if choice then
                            vim.fn.chansend(vim.g.gdb_jobid, "y\n")
                        else
                            vim.fn.chansend(vim.g.gdb_jobid, "n\n")
                        end
                    end)
                    return
                end
                vim.api.nvim_buf_set_lines(view_buf, -1, -1, false, { line })
            end
        end,
        on_exit = function()
            gdb_stop()
        end
    })

    vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(win),
        callback = function()
            gdb_stop()
        end
    })

    vim.cmd("vsplit")
    vim.cmd("wincmd r")
    local win2 = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(win2, view_buf)

    vim.g.gdb_jobid = jobID
    vim.g.gdb_winid = win
    vim.g.gdb_win2id = win2
    vim.g.gdb_view_buf = view_buf
    vim.g.gdb_buf = buf
    vim.g.gdb_active = true

    vim.g.gdb_breakpoint = vim.fn.sign_define("Breakpoint", {
        text = '●',
        texthl = 'Error',
        numhl = 'Error',
    })

    link(win, win2)

    vim.api.nvim_buf_set_name(view_buf, "GDB-view")
    vim.api.nvim_buf_set_name(buf, "gdb")
end

function gdb_stop()
    if vim.g.gdb_jobid ~= nil then
        vim.fn.jobstop(vim.g.gdb_jobid)
        if (vim.g.gdb_winid ~= nil) then
            if (vim.api.nvim_win_is_valid(vim.g.gdb_winid)) then
                vim.api.nvim_win_close(vim.g.gdb_winid, true)
            end
        end
        vim.g.rdb_jobid = nil
        vim.g.gdb_winid = nil
        vim.g.gdb_active = false
    end
end

function link(w1, w2)
    local autoclose = function(to_close, other)
        vim.api.nvim_create_autocmd("WinClosed", {
            pattern = tostring(to_close),
            callback = function()
                if (vim.api.nvim_buf_is_loaded(vim.g.gdb_buf)) then
                    vim.api.nvim_buf_delete(vim.g.gdb_buf, { force = true })
                end
                if (vim.api.nvim_buf_is_loaded(vim.g.gdb_view_buf)) then
                    vim.api.nvim_buf_delete(vim.g.gdb_view_buf, { force = true })
                end
            end
        })
    end

    autoclose(w1, w2)
    autoclose(w2, w1)
end

function gdb_step()
    if vim.g.gdb_jobid ~= nil then
        local res = vim.fn.chansend(vim.g.gdb_jobid, "s\n")
        if res == 0 then
            gdb_stop()
        end
    end
end

function gdb_is_file_break_placed()
    local buf = vim.api.nvim_get_current_buf()
    if buf ~= vim.g.gdb_buf and buf ~= vim.g.gdb_view_buf then
        local line = vim.api.nvim_win_get_cursor(0)[1]

        local signs = vim.fn.sign_getplaced(buf, {
            group = "Breakpoint",
            lnum = line
        })
        if (#signs[1].signs > 0) then
            return true
        end
    end
    return false;
end

function gdb_file_break()
    local buf = vim.api.nvim_get_current_buf()
    if buf ~= vim.g.gdb_buf and buf ~= vim.g.gdb_view_buf then
        local line = vim.api.nvim_win_get_cursor(0)[1]
        if gdb_is_file_break_placed() then
            return
        end
        vim.fn.sign_place(0, "Breakpoint", "Breakpoint", "init.lua", { lnum = line })
        local res = vim.fn.chansend(vim.g.gdb_jobid, "b " .. vim.fn.expand("%") .. ":" .. line .. "\n")

        -- if res == 0 then
        -- gdb_stop()
        -- end
    end
end

function gdb_file_break_remove()
    local buf = vim.api.nvim_get_current_buf()
    if buf ~= vim.g.gdb_buf and buf ~= vim.g.gdb_view_buf then
        if not gdb_is_file_break_placed() then
            return
        end

        local signs = vim.fn.sign_getplaced(buf, {
            group = "Breakpoint",
            lnum = vim.api.nvim_win_get_cursor(0)[1]
        })

        vim.fn.sign_unplacelist(signs[1].signs)
    end
end



vim.api.nvim_create_user_command("GdbStart",
    function(opts)
        local fileName = opts.fargs[1] or ""
        local ex = opts.fargs[2] or ""
        gdb_start(fileName, ex)
    end,
    { nargs = "+" })

vim.api.nvim_create_user_command("GdbStop", gdb_stop, {})
vim.api.nvim_create_user_command("GdbStep", gdb_step, {})
vim.api.nvim_create_user_command("GdbBreak", gdb_file_break, {})
vim.api.nvim_create_user_command("GdbBreakRemove", gdb_file_break_remove, {})

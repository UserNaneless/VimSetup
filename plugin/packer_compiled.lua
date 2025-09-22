-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/naneless/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?.lua;/home/naneless/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?/init.lua;/home/naneless/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?.lua;/home/naneless/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/naneless/.cache/nvim/packer_hererocks/2.1.1741730670/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nw\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\ftoggler\1\0\1\ftoggler\0\1\0\2\tline\14<leader>c\nblock\14<leader>C\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["autoclose.nvim"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/autoclose.nvim",
    url = "https://github.com/m4xshen/autoclose.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["codeium.vim"] = {
    config = { "\27LJ\2\n-\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19codeium#Accept\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2\1\0D\0\2\0\29codeium#CycleCompletions\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2ÿÿD\0\2\0\29codeium#CycleCompletions\afn\bvim,\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\18codeium#Clear\afn\bvimƒ\2\1\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0003\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0003\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0003\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\texpr\2\vsilent\2\0\v<C-M-c\1\0\2\texpr\2\vsilent\2\0\f<C-M-q>\1\0\2\texpr\2\vsilent\2\0\f<C-M-e>\1\0\2\texpr\2\vsilent\2\0\f<C-M-y>\6i\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/codeium.vim",
    url = "https://github.com/Exafunction/codeium.vim"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\nJ\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\0\3\15timeout_ms\3ô\3\17lsp_fallback\2\nasync\1\vformat¡\5\1\0\6\0$\0)6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\b\0005\4\4\0005\5\3\0=\5\5\0045\5\6\0=\5\a\4=\4\t\0035\4\v\0005\5\n\0=\5\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\0045\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\0045\5\25\0=\5\26\0045\5\27\0=\5\28\4=\4\29\3B\1\2\0016\1\30\0009\1\31\0019\1 \0015\3!\0'\4\"\0003\5#\0B\1\4\0012\0\0€K\0\1\0\0\14<leader>f\1\3\0\0\6n\6v\bset\vkeymap\bvim\21formatters_by_ft\bzig\1\2\0\0\bzls\nastro\1\2\0\0\14prettierd\thtml\1\2\0\0\14prettierd\bcss\1\2\0\0\14prettierd\tscss\1\2\0\0\14prettierd\20typescriptreact\1\2\0\0\14prettierd\20javascriptreact\1\2\0\0\14prettierd\15typescript\1\2\0\0\14prettierd\15javascript\1\0\t\nastro\0\thtml\0\bcss\0\tscss\0\20typescriptreact\0\20javascriptreact\0\15typescript\0\15javascript\0\bzig\0\1\2\0\0\14prettierd\15formatters\1\0\2\15formatters\0\21formatters_by_ft\0\rprettier\1\0\2\rtabWidth\3\4\16singleQuote\1\14prettierd\1\0\2\rprettier\0\14prettierd\0\1\0\2\rtabWidth\3\4\16singleQuote\1\nsetup\fconform\frequire\0" },
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["global-note.nvim"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/global-note.nvim",
    url = "https://github.com/backdround/global-note.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/mason-org/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/mason-org/mason.nvim"
  },
  ["nordic.nvim"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/nordic.nvim",
    url = "https://github.com/AlexvZyl/nordic.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["staline.nvim"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/staline.nvim",
    url = "https://github.com/tamton-aquib/staline.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/vim-moonfly-colors",
    url = "https://github.com/bluz71/vim-moonfly-colors"
  },
  vimtex = {
    loaded = true,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["zig.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/naneless/.local/share/nvim/site/pack/packer/opt/zig.vim",
    url = "https://github.com/ziglang/zig.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nw\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\ftoggler\1\0\1\ftoggler\0\1\0\2\tline\14<leader>c\nblock\14<leader>C\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: codeium.vim
time([[Config for codeium.vim]], true)
try_loadstring("\27LJ\2\n-\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19codeium#Accept\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2\1\0D\0\2\0\29codeium#CycleCompletions\afn\bvim;\0\0\3\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\2ÿÿD\0\2\0\29codeium#CycleCompletions\afn\bvim,\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\18codeium#Clear\afn\bvimƒ\2\1\0\6\0\16\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0003\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0003\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0003\4\14\0005\5\15\0B\0\5\1K\0\1\0\1\0\2\texpr\2\vsilent\2\0\v<C-M-c\1\0\2\texpr\2\vsilent\2\0\f<C-M-q>\1\0\2\texpr\2\vsilent\2\0\f<C-M-e>\1\0\2\texpr\2\vsilent\2\0\f<C-M-y>\6i\bset\vkeymap\bvim\0", "config", "codeium.vim")
time([[Config for codeium.vim]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\nJ\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\0\3\15timeout_ms\3ô\3\17lsp_fallback\2\nasync\1\vformat¡\5\1\0\6\0$\0)6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\b\0005\4\4\0005\5\3\0=\5\5\0045\5\6\0=\5\a\4=\4\t\0035\4\v\0005\5\n\0=\5\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\0045\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\0045\5\25\0=\5\26\0045\5\27\0=\5\28\4=\4\29\3B\1\2\0016\1\30\0009\1\31\0019\1 \0015\3!\0'\4\"\0003\5#\0B\1\4\0012\0\0€K\0\1\0\0\14<leader>f\1\3\0\0\6n\6v\bset\vkeymap\bvim\21formatters_by_ft\bzig\1\2\0\0\bzls\nastro\1\2\0\0\14prettierd\thtml\1\2\0\0\14prettierd\bcss\1\2\0\0\14prettierd\tscss\1\2\0\0\14prettierd\20typescriptreact\1\2\0\0\14prettierd\20javascriptreact\1\2\0\0\14prettierd\15typescript\1\2\0\0\14prettierd\15javascript\1\0\t\nastro\0\thtml\0\bcss\0\tscss\0\20typescriptreact\0\20javascriptreact\0\15typescript\0\15javascript\0\bzig\0\1\2\0\0\14prettierd\15formatters\1\0\2\15formatters\0\21formatters_by_ft\0\rprettier\1\0\2\rtabWidth\3\4\16singleQuote\1\14prettierd\1\0\2\rprettier\0\14prettierd\0\1\0\2\rtabWidth\3\4\16singleQuote\1\nsetup\fconform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType zig ++once lua require("packer.load")({'zig.vim'}, { ft = "zig" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/naneless/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]], true)
vim.cmd [[source /home/naneless/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]]
time([[Sourcing ftdetect script at: /home/naneless/.local/share/nvim/site/pack/packer/opt/zig.vim/ftdetect/zig.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

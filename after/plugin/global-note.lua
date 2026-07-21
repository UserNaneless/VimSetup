local gnote = require("global-note")

gnote.setup({
    filename="global.md",
    directory="~/notes"
})

vim.keymap.set("n", "<leader>gn", gnote.toggle_note);

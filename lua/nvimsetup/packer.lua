vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }


    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use('nvim-treesitter/playground')

    use('bluz71/vim-moonfly-colors', { as = 'moonfly' })

    use('theprimeagen/harpoon')

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    use("m4xshen/autoclose.nvim")
    use("sakhnik/nvim-gdb")


    use({
        "stevearc/conform.nvim",
        config = function()
            local conform = require("conform")
            conform.setup({
                formatters = {
                    prettierd = {
                        tabWidth = 4,
                        singleQuote = false,
                    },
                    prettier = {
                        tabWidth = 4,
                        singleQuote = false
                    }
                },
                formatters_by_ft = {
                    javascript      = { "prettierd" },
                    typescript      = { "prettierd" },
                    javascriptreact = { "prettierd" },
                    typescriptreact = { "prettierd" },
                    scss            = { "prettierd" },
                    css             = { "prettierd" },
                    html            = { "prettierd" },
                    astro           = { "prettierd" },
                    zig             = { "zls" }
                },
            })

            vim.keymap.set({ "n", "v" }, "<leader>f", function()
                conform.format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500
                })
            end)
        end
    })

    use({ "ziglang/zig.vim", ft = "zig" })

    use({
        'numToStr/Comment.nvim',
        config = function()
            require("Comment").setup({
                toggler = {
                    line = "<leader>c",
                    block = "<leader>C"
                }
            })
        end
    })

    use({ "folke/tokyonight.nvim" })

    use({ "tamton-aquib/staline.nvim" })

    use({ "AlexvZyl/nordic.nvim" })

    use({ "wuelnerdotexe/vim-astro", ft = "astro" })

    use({ "lervag/vimtex" })

    use({
        "Exafunction/codeium.vim",
        config = function()
            vim.keymap.set('i', '<C-M-y>', function() return vim.fn['codeium#Accept']() end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<C-M-e>', function() return vim.fn['codeium#CycleCompletions'](1) end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<C-M-q>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<C-M-c', function() return vim.fn['codeium#Clear']() end,
                { expr = true, silent = true })
        end
    })

    use({ "backdround/global-note.nvim" })
end)

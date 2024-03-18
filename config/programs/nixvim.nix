{ pkgs, config, ... }:
let
    palette = config.colorScheme.palette;
in {
    programs.nixvim = {
        enable = true;
        vimAlias = true;
        viAlias = true;

        globals.mapleader = " ";

        options = {
            number = true;
            relativenumber = true;
            shiftwidth = 4;
        };

        plugins = {
            cmp.enable = true;
            copilot-lua.enable = true;
            lsp = {
                enable = true;
		servers.rust-analyzer = {
		    enable = true;
		    installCargo = true;
		    installRustc = true;
		};
            };
            telescope = {
                enable = true;
                keymaps = {
                };
            };
            treesitter = {
                enable = true;
            };
            undotree.enable = true;
        };
    };
}

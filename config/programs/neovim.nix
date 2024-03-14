{ config, pkgs, username, ... }:
{
programs.neovim = 
let 
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
      ${builtins.readFile ./nvim/set.lua}
      ${builtins.readFile ./nvim/remap.lua}
    '';

    plugins = with pkgs.vimPlugins; [
      {
        plugin = telescope-nvim;
        config = toLuaFile ./nvim/telescope.lua;
      }
      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-rust
          p.tree-sitter-bash
          p.tree-sitter-lua
        ]));
        config = toLuaFile ./nvim/treesitter.lua;
      }
      {
        plugin = undotree;
        config = toLuaFile ./nvim/undotree.lua;
      }
      {
        plugin = copilot-vim;
        config = toLuaFile ./nvim/copilot.lua;
      }
      {
        plugin = lsp-zero-nvim;
        config = toLuaFile ./nvim/lsp.lua;
      }
      nvim-lspconfig
      nvim-cmp
      mason-nvim
      mason-lspconfig-nvim
    ];
  };
}

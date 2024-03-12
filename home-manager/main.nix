{ config, pkgs, lib, ... }:
let
  alias = commandName: body: ''function ${commandName} () { 
    ${body} 
  }
  '';
  createScript = commandName: body: pkgs.writeScriptBin "${commandName}" ''
    #!${pkgs.stdenv.shell}
    ${body}
  '';
  configureHome = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "23.11";

    home.file.".config/gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-application-prefer-dark-theme=1
    '';
    home.file.".config/gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-application-prefer-dark-theme=1
    '';


    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */

    programs.emacs = {
      enable = true;
      package = pkgs.emacs;
      extraConfig = ''
        (setq standard-indent 2)
      '';
    };
    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      history = {
        size = 16 * 1024 * 1024;
        save = 16 * 1024 * 1024;
        share = true;
      };
      shellAliases = {
        update = "sudo nixos-rebuild switch --impure";
        pbcopy = "xclip -i -selection clipboard";
        pbbpaste = "xclip -o -selection clipboard";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "thefuck" "history" ];
      };
      initExtra = ''
        ${alias "cropToFullHd" "convert -crop 1920x1080+0+60 $1 $1.crop"}
      '';
    };
    programs.neovim = {
      enable = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [
        nvim-lspconfig
        nvim-cmp
        cmp-nvim-lsp

        # luaPackages.plenary.nvim

        editorconfig-nvim
        completion-nvim
        graphviz-vim
        /* https://github.com/m-kat/aws-vim */
        vimtex
        vim-svelte

        nerdtree
        ctrlp-vim

        nvim-cmp
        cmp-nvim-lsp
        cmp_luasnip
        luasnip

        plantuml-syntax
        plantuml-previewer-vim
        open-browser-vim

        tabular
        vim-markdown

        # obsidian-nvim

        fzf-lua

        nvim-dap
      ];
      extraConfig = ''
        ${builtins.readFile ./init.vim} 
      '';
    };
  };

in
{
  programs.zsh.enable = true;
  home-manager-all = configureHome;
  home-manager-root = { programs.zsh.oh-my-zsh.theme = "afowler"; };
  home-manager-commons = { programs.zsh.oh-my-zsh.theme = "robbyrussell"; };
}

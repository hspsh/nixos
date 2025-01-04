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
  decrypt = import ../utils/age-decrypt.nix pkgs ~/.ssh/id_ed25519;
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

    home.file.".ideavimrc".text = ''
      set nocompatible            " disable compatibility to old-time vi
      set showmatch               " show matching 
      set ignorecase              " case insensitive 
      set mouse=v                 " middle-click paste with 
      set hlsearch                " highlight search 
      set incsearch               " incremental search
      set tabstop=2               " number of columns occupied by a tab 
      set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
      set expandtab               " converts tabs to white space
      set shiftwidth=2            " width for autoindents
      set autoindent              " indent a new line the same amount as the line just typed
      set number                  " add line numbers
      set wildmode=longest,list   " get bash-like tab completions
      set cc=160                  " set an 80 column border for good coding style
      filetype plugin indent on   "allow auto-indenting depending on file type
      syntax on                   " syntax highlighting
      set mouse=a                 " enable mouse click
      set clipboard=unnamedplus   " using system clipboard
      filetype plugin on
      set cursorline              " highlight current cursorline
      set ttyfast                 " Speed up scrolling in Vim
    '';


    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
    programs.git = {
        enable = true;
        userEmail = "psuwala@ksidelta.com";
        userName = "psuwala";
        extraConfig = {
            core.editor = "nvim";
        };
    };

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
        # update = "sudo nixos-rebuild switch --impure";
        pbcopy = "xclip -i -selection clipboard";
        pbbpaste = "xclip -o -selection clipboard";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "thefuck" "history" "gradle" ];
      };
      initExtra = ''
        ${alias "cropToFullHd" "convert -crop 1920x1080+0+60 $1 $1.crop"}

        ${decrypt ./envs.sh}
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

        obsidian-nvim

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

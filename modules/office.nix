{ pkgs, ... }:
let
  alias = commandName: body: ''function ${commandName} () { 
    ${body} 
  }
  '';
in
{
  home-manager-commons.programs.zsh.initExtra = ''
    ${alias "entry" ''vim ~/temp/$(date +"%Y-%m-%d")-$1.md''}
  '';

  environment.systemPackages = with pkgs; [
    libreoffice

    hunspell
    hunspellDicts.pl-pl
  ];
}

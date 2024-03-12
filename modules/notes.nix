let
  alias = commandName: body: ''function ${commandName} () { 
    ${body} 
  }
  '';
in
{ pkgs, ... }: {
  home-manager-commons.programs.zsh.initExtra = ''
    ${alias "entry" ''vim ~/temp/$(date +"%Y-%m-%d")-$1.md''}
  '';
}

let
  alias = commandName: body: ''function ${commandName} () { 
    ${body} 
  }
  '';
in
{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    jira-cli-go
  ];
  home-manager-commons.programs.zsh.envExtra = ''
    export JIRA_API_TOKEN="${(import ./../.secrets.nix).JIRA_API_TOKEN}"
  '';
  home-manager-commons.programs.zsh.initExtra = ''
    ${alias "jira-create" ''jira issue create -pIVO -tTask -s"$1" --no-input''}
    ${alias "jira-comment" ''jira issue comment add $1 "$2" --no-input''}
    ${alias "jira-delete" ''jira issue delete $1''}
    ${alias "jira-list" ''jira issue list -pIVO''}
    ${alias "jira-subtask" ''jira issue create -pIVO -t"Subtask" --parent "$1" -s"$2" --no-input''}
    ${alias "jira-show" ''jira issue view $1 --comments 100''}
    ${alias "jira-done" ''jira issue move $1 done''}
  '';
}

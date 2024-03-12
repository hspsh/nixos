let
  alias = commandName: body: ''function ${commandName} () { 
    ${body} 
  }
  '';
in
{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    jira-cli-go
  ];
  home-manager-commons.programs.zsh.envExtra = ''
    export JIRA_API_TOKEN="${builtins.readFile /run/secrets/jira/token}"
  '';

  home-manager-commons.programs.zsh.initExtra = ''
    ${alias "jira-task" ''jira issue create -pIVO -tTask -s"$1" --no-input''}
    ${alias "jira-show" ''jira issue view $1 --comments 100''}
    ${alias "jira-tasks" ''jira issue list -pIVO -tTask''}
    ${alias "jira-subtask" ''jira issue create -pIVO -t"Subtask" --parent "$1" -s"$2" --no-input''}

    ${alias "jira-epic" ''jira epic create -pIVO -s"$1" --no-input''}
    ${alias "jira-epics" ''jira epic list -pIVO''}
    ${alias "jira-epic-add" ''jira epic add -pIVO $1 $2''}

    ${alias "jira-comment" ''jira issue comment add $1 "$2" --no-input''}
    ${alias "jira-delete" ''jira issue delete $1''}
    ${alias "jira-done" ''jira issue move $1 done''}
    
    ${alias "mindoo" ''vim "/home/psuwala/mindoo/Mindoo/public/The Root.md"''}
  '';
}

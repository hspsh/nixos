let
  hosts = "${builtins.fetchurl "https://someonewhocares.org/hosts/hosts"}";
in
{ ... }: {
    networking.extraHosts = ''
        ${builtins.readFile hosts}
        127.0.0.1 mongo-replica-set-0
        127.0.0.1 mongo-replica-set-1
        127.0.0.1 mongo-replica-set-2
    '';
}

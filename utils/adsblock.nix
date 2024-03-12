let
  hosts = "${builtins.fetchurl  {
    url = "https://someonewhocares.org/hosts/hosts";
    sha256 = "0kb54c3srrpn6avmgr9423fd4dc6xhjzwvcbjqcrc7clqp8yd5rd";
  }}";
in
{ ... }: {
    networking.extraHosts = ''
        ${builtins.readFile hosts}
        127.0.0.1 mongo-replica-set-0
        127.0.0.1 mongo-replica-set-1
        127.0.0.1 mongo-replica-set-2
    '';
}

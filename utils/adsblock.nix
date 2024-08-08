let
  hosts = "${builtins.fetchurl  {
    url = "https://someonewhocares.org/hosts/hosts";
    sha256 = "0f1vvlrlyv51wapsrzw4vqm53g41i0c037s0nng4f4l5kzd9i3ld";
  }}";
in
{ ... }: {
    networking.extraHosts = ''
        ${builtins.readFile hosts}
        127.0.0.1 mongo-replica-set-0
        127.0.0.1 mongo-replica-set-1
        127.0.0.1 mongo-replica-set-2
        # 192.168.88.14 docs.hsp.sh
    '';
}

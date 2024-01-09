let
  hosts = "${builtins.fetchurl "https://someonewhocares.org/hosts/hosts"}";
in
{ ... }: {
    networking.extraHosts = ''
        $hosts
    '';
}

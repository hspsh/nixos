pkgs: command:
let
  output = (pkgs.runCommand "command" { } ''
    mkdir -p $out
    ${command} > $out/stdout
  '');
in pkgs.lib.readFile "${output}/stdout"

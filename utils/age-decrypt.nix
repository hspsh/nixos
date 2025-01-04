pkgs: key: fileToDecrypt:
let
  runCmd = import ./run-command.nix pkgs;
in runCmd "age -i ${key} --decrypt ${fileToDecrypt}"

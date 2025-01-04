pkgs: key: fileToDecrypt:
let
  runCmd = import ./run-command.nix pkgs;
in runCmd "${pkgs.age}/bin/age -i ${key} --decrypt ${fileToDecrypt}"

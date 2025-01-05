{ pkgs, ... }: 
let
  decrypt = import ../utils/age-decrypt.nix pkgs /home/psuwala/.ssh/id_ed25519;
in
{
  environment.extraInit = decrypt ./envs.sh;
  environment.variables = {
    TEST = "testt";
  };
}

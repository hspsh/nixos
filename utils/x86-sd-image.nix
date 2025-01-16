{ modulesPath, ... }: {
  imports = [ (modulesPath + "/installer/sd-card/sd-image-x86_64.nix") ];
}

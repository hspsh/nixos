{ ... }: {
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.stateVersion = "23.11"; # Did you read the comment?

  # system.activationScripts.script.text = ''
  #  KUBECONFIG=/etc/rancher/k3s/k3s.yaml ${pkgs.fluxcd}/bin/flux install || true
  # '';
  # services.k3s = k3sConfig.services.k3s;
}

{ ... }: {
  virtualisation.docker.enable = true;
  users.users.psuwala.extraGroups = [ "docker" ];
  boot.kernel.sysctl."vm.max_map_count" = 1000000;
}

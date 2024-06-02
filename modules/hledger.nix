{ pkgs, agenix, ... }: {
  environment.systemPackages = with pkgs; [
    hledger
    (import (builtins.fetchGit {
      url = "https://github.com/nixos/nixpkgs/";
      ref = "refs/heads/nixos-unstable";
      rev = "f2537a505d45c31fe5d9c27ea9829b6f4c4e6ac5"; 
    }))
  ];
}

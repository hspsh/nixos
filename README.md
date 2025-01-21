# Before

Install nix: https://nixos.org/download/

# Interactions

## Create a Kiosk

```bash
URL=https://your.funky.url nix build --impure .\#nixosConfigurations.kiosk.config.system.build.isoImage
#OR
URL=https://your.funky.url nix build --impure github:hspsh/nixos#nixosConfigurations.kiosk.config.system.build.isoImage
#AND
dd if=result/iso/*.iso of=/dev/sda bs=32M status=progress
```


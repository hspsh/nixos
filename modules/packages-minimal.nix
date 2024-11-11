{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # cli utils
    xclip
    thefuck
    arandr
    autorandr
    wget
    smartmontools
    killall
    openssl
    dmidecode
    usbutils
    entr
  ];
}

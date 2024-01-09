{ pkgs, ... }:
{
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
        i3blocks #if you are planning on using i3blocks over i3status
        networkmanagerapplet
      ];
    };
    libinput = {
      enable = true;
      touchpad.tapping = true;
      touchpad.naturalScrolling = true;
      touchpad.scrollMethod = "twofinger";
      touchpad.disableWhileTyping = false;
      touchpad.clickMethod = "clickfinger";
    };
  };

  systemd.services."enable-brightness" = {
    script = ''
      chmod 777 /sys/class/backlight/amdgpu_bl0/brightness
    '';
    after = [ "sys-devices-pci0000:00-0000:00:08.1-0000:04:00.0-backlight-amdgpu_bl0.device" ];
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}

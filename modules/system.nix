{ pkgs, ... }: {
  ## LOCALES

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  services.xserver = {
    layout = "pl";
    xkbVariant = "";
  };

  console.keyMap = "pl2";

  ## MUSIC

  environment.systemPackages = with pkgs; [
    pavucontrol
    spotify
  ];

  #   sound.enable = true;
  #   hardware.pulseaudio.enable = false;
  #   security.rtkit.enable = true;
  #   services.pipewire = {
  #     enable = true;
  #     alsa.enable = true;
  #     alsa.support32Bit = true;
  #     pulse.enable = true;
  #   };

  ## FIREWALL

  networking.hostName = "pussy-destroyer"; # Define your hostname.
  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [ ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = false;

  ## Enable the GNOME Desktop Environment.
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
}

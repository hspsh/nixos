let
  exclude = [
    # Largest cache dirs
    ".cache"
    "*/cache2" # firefox
    "*/Cache"
    ".config/Slack/logs"
    ".config/Code/CachedData"
    ".container-diff"
    ".npm/_cacache"
    # Work related dirs
    "*/node_modules"
    "*/bower_components"
    "*/_build"
    "*/build"
    "*/.tox"
    "*/venv"
    "*/.venv"
    "*/Downloads"
    ".gradle"
  ];
in
{ ... }: {

  programs.ssh.extraConfig = ''
    Host artur
      ForwardAgent yes
      HostName artur.at.hsp.sh
      IdentityFile /home/psuwala/.ssh/id_ed25519
      StrictHostKeyChecking no
      User psuwala
    Host lucy
      HostName 192.168.88.94
      ProxyJump artur
      IdentityFile /home/psuwala/.ssh/id_ed25519
      StrictHostKeyChecking no
      User psuwala
  '';
  services.borgbackup.jobs.home-psuwala = {
    paths = "/home/psuwala";
    encryption.mode = "none";
    # environment.BORG_RSH = "ssh"; # -l psuwala -i /home/psuwala/.ssh/id_ed25519 -J psuwala@artur.at.hsp.sh";
    repo = "ssh://lucy/home/psuwala/backup";
    compression = "auto,zstd";
    startAt = "daily";
    inherit exclude;
  };
}

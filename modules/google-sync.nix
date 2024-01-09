{ pkgs, ... }: {
  systemd.services."gphotos-sync" = {
    script = ''
      PATH="$PATH:${pkgs.gphotos-sync}/bin" \
      gphotos-sync /home/psuwala/Google/photos --album "canvas" --omit-album-date
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "psuwala";
      Restart = "on-failure";
      RestartSec = "3600s";
    };
  };
  systemd.timers."gphotos-sync-timer" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitInactiveSec = "1h";
      Unit = "taskwarrior-google-sync.service";
    };
  };
}

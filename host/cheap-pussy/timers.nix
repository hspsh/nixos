{ pkgs, ... }: {
  systemd.timers."taskwarrior-google-sync-timer" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "60m";
      OnUnitActiveSec = "60m";
      Unit = "taskwarrior-sync.service";
    };
  };

  systemd.services."taskwarrior-sync" = {
    script = ''
      PATH="$PATH:${pkgs.taskwarrior}/bin" \
      ${pkgs.bash}/bin/bash /home/psuwala/Projects/syncall/run.sh
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "psuwala";
    };
  };
}

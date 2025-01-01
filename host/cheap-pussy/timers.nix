{ pkgs, ... }: {
  systemd.timers."hello-world" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "60m";
      OnUnitActiveSec = "60m";
      Unit = "taskwarrior-google-sync.service";
    };
  };

  systemd.services."taskwarrior-google-sync" = {
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

{ pkgs, ... }: {
  systemd.timers."hello-world" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "5m";
      Unit = "taskwarrior-google-sync.service";
    };
  };

  systemd.services."taskwarrior-google-sync" = {
    script = ''
      PATH="$PATH:${pkgs.taskwarrior}/bin" \
      ${pkgs.bash}/bin/bash /home/psuwala/Projects/taskwarrior-syncall/execute.sh
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "psuwala";
    };
  };
}

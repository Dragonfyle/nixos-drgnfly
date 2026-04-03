{ ... }:

{
  systemd.user.services.delete-old-nvim-sessions = {
    Unit.Description = "Delete old neovim sessions";
    Service = {
      Type = "oneshot";
      ExecStart = "%h/scripts/delete-old-nvim-sessions.sh";
    };
  };

  systemd.user.timers.delete-old-nvim-sessions = {
    Unit.Description = "Timer for deleting old neovim sessions";
    Timer = {
      OnCalendar = "monthly";
      Persistent = true;
    };
    Install.WantedBy = [ "timers.target" ];
  };

  systemd.user.services.delete-old-ss = {
    Unit.Description = "Delete old screenshots";
    Service = {
      Type = "oneshot";
      ExecStart = "fd . %h/screenshots -t f --changed-before 30d --exec rm -f {} +";
    };
  };

  systemd.user.timers.delete-old-ss = {
    Unit.Description = "Timer for deleting old screenshots";
    Timer = {
      OnCalendar = "monthly";
      Persistent = true;
    };
    Install.WantedBy = [ "timers.target" ];
  };
}

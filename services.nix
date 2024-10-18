{ pkgs, ... }:
{
  systemd.user.services.watchBacklight = {
    description = "synchronize screen brightness";
    wantedBy = [ "default.target" ];
    path = [ pkgs.inotify-tools ];
    serviceConfig = {
      ExecStart = "/path/to/duo watch-backlight";
      Restart = "always";
      RestartSec = 5;
    };
  };


  systemd.user.services.watchDisplays = {
    description = "set screens on keyboard event";
    wantedBy = [ "default.target" ];
    after = [ "graphical-session.target" ];
    path = [ pkgs.gnome-monitor-config pkgs.usbutils pkgs.inotify-tools ];
    serviceConfig = {
      ExecStart = "/path/to/duo watch-displays";
      Restart = "always";
      RestartSec = 5;
    };
  };

  systemd.user.services.watchRotation = {
    description = "rotate screens";
    wantedBy = [ "default.target" ];
    after = [ "graphical-session.target" ];
    path = [ pkgs.gnome-monitor-config pkgs.iio-sensor-proxy ];
    serviceConfig = {
      ExecStart = "/path/to/duo watch-rotation";
      Restart = "always";
      RestartSec = 5;
    };
  };
}

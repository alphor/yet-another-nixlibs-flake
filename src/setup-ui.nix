{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.pavucontrol
  ];
  
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  sound.enable = true;
  hardware.pulseaudio.enable = true;

}

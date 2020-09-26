{ ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;
    libinput.tapping = true;
    displayManager.lightdm.enable = true;
    windowManager.i3.enable = true;
  };

}

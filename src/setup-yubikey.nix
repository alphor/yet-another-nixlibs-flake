{ pkgs, ... }:

{
  hardware.u2f.enable = true;
  
  environment.systemPackages = [
    pkgs.yubikey-personalization
    pkgs.yubikey-manager
  ];
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gtk2";
  };

  services.pcscd.enable = true;
}

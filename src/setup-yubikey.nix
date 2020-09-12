{ pkgs, ... }:

{
  hardware.u2f.enable = true;
  
  environment.systemPackages = [
    pkgs.yubikey-personalization
  ];
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gtk2";
  };

  programs.ssh.startAgent = false;
  
  services.pcscd.enable = true;
}

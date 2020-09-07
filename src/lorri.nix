{ pkgs, ... }:

{
  services.lorri.enable = true;

  environment.systemPackages = [
    pkgs.direnv
  ];
}

# Wrapping things in a no arg lambda seems pointless, but it keeps
# things consistent with other configurable modules in this directory.
{}:

{ pkgs, ... }:

{
  services.lorri.enable = true;

  environment.systemPackages = [
    pkgs.direnv
  ];
}

{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.nixops
  ];
}

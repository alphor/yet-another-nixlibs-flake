{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; let

  in [
    direnv
    cargo
  ];
}

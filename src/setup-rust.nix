{ pkgs, ... }:

{
  environment.systemPackage = with pkgs; let

  in [
    direnv
    cargo
  ];
}

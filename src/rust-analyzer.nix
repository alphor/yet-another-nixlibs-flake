{ pkgs, ... }:

{
  environment.systemPackages = let
    unstable = import (pkgs.fetchFromGitHub {
    owner  = "NixOS";
    repo   = "nixpkgs-channels";
    # just the HEAD of nixpkgs on 9/12/2020
    rev    = "61525137fd1002f6f2a5eb0ea27d480713362cd5";
    sha256 = "1gzwz9jvfcf0is6zma7qlgszkngfb2aa4kam0nhs0qnwb4nqn7mg";
    }) {};
  in [
    unstable.rust-analyzer
  ];
}

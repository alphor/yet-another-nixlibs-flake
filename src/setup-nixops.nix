{ pkgs, ... }:

let
  unstable = import (pkgs.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    # a head revision that passed CI as of 09/26/2020
    rev = "58121fe1b085e201593f38e3b5eda0407dbd8e98";
    sha256 = "1j0q5lzycl4p5fah5vgaqahh55xvcg1c1lyc2r1s6gh9vg8q3q47";
  }) { };
in {
  environment.systemPackages = [
    unstable.nixops
  ];
}

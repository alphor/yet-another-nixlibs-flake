{ pkgs, ... }:

let
  # nixops rarely cuts releases: 1.7 was released on April 17th, 2019!
  # so fetch the latest head. It will probably be fine.
  nixopsFetch = (pkgs.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixops";
    rev = "6fc9ca59a93907aef9fbf74a4815c01282b535c5";
    sha256 = "0pwqxgfbdwzhqzpn91xxkvmdhqwhapcbjhhp6cfcf0vf409myzga";
  });
  nixops = (import nixopsFetch);
in {
  environment.systemPackages = [ nixops ];
}

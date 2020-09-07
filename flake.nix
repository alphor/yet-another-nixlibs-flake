{
  description = "nixos-config-modules";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
  };
  outputs = { self, nixpkgs }: {
    lib = {
      lorri = import ./src/modules/lorri.nix;
    };
  };
}

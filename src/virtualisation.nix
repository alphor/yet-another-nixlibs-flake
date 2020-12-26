{ pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  
  environment.systemPackages = [
    pkgs.qemu
  ];

}

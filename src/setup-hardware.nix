{ ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
  ];

  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"
      ];

      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  filesystems = {
    "/" = {
      device = "/dev/disk/by-label/root";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-label/swap"; }
  ];

  nix.maxJobs = lib.mkDefault 4;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}

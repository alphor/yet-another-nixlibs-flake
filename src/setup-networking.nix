{ hostName, networks, interfaces }:

{...}:

{
  networking = {
    inherit hostName interfaces;
    wireless = {
      enable = true;
      inherit networks;
    };

    # deprecated on a global basis, enable dhcp on a per interface basis
    useDHCP = false;
  };
}

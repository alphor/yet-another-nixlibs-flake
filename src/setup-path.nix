# A dumping ground for things I want on my path
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ag
    age
    autorandr
    backblaze-b2
    bind
    chromium
    direnv
    emacs
    firefox
    git
    gotools
    msgpack-tools
    openvpn
    perkeep
    pass
    pavucontrol
    signify
    sqlite
    stow
    syncthing
    vim
    wget
    xcape
    qemu
    xorg.xmodmap
    youtube-dl
  ];
}

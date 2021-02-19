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
    mpv
    nodejs_latest
    nodePackages.indium
    openssl
    openvpn
    perkeep
    pass
    pciutils
    pavucontrol
    signify
    sqlite
    stow
    syncthing
    vim
    wget
    xcape
    xorg.xmodmap
    yarn
    youtube-dl
  ];
}

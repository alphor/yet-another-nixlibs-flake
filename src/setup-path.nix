# A dumping ground for things I want on my path
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ag
    age
    autorandr
    backblaze-b2
    direnv
    emacs
    firefox
    git
    gotools
    perkeep
    pass
    pavucontrol
    sqlite
    stow
    syncthing
    vim
    wget
    xcape
    xorg.xmodmap
    youtube-dl
  ];
}

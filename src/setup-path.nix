# A dumping ground for things I want on my path
{ pkgs, ... }:

{
  environment.systemPackages = [
    firefox
    wget
    vim
    ag
    emacs
    git
    syncthing
    pass
    direnv
    stow
    xcape
    age
    xorg.xmodmap
  ];
}

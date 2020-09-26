# A dumping ground for things I want on my path
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ag
    age
    autorandr
    direnv
    emacs
    firefox
    git
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
  ];
}

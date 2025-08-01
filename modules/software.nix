{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # cli
    git
    curl
    wget
    tree
    gnumake
    tmux
    yazi
    htop
    fzf
    fd
    jq
    zip
    unzip
    ripgrep
    ffmpeg-full

    # langs
    typst
    go
    lua
    gcc
    nodejs
    python312
    python312Packages.pip
    nixd
    nixfmt-rfc-style

    # apps
    mpv
    vlc
    discord
    obs-studio
    mangohud
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
  };

  programs.firefox.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    gamescopeSession.enable = true;
  };
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
}

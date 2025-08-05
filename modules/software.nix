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
    starship
    websocat

    # Development
    typst
    tinymist
    typstyle
    go
    gopls
    lua
    lua-language-server
    stylua
    nixd
    nixfmt-rfc-style
    gcc
    nodejs
    python312
    python312Packages.pip

    # apps
    mpv
    vlc
    discord
    obs-studio
    qbittorrent
    mangohud
  ];

  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;

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

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
    imagemagick

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
    youtube-music
    discord
    gfn-electron
    osu-lazer-bin
    qalculate-gtk
    obs-studio
    qbittorrent
    mangohud
  ];

  fonts.packages = with pkgs; [
    # Math
    ibm-plex
    lmodern
    libertinus

    # UI/System
    roboto
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono
  ];

  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;

  programs.ssh.startAgent = true;

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

  services.flatpak.enable = true;
  services.flatpak.packages = [
    "app.opencomic.OpenComic"
  ];
}

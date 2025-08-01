{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # cli
    git
    curl
    wget
    tmux

    # apps
    mangohud
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
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

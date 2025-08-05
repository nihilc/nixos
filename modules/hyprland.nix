{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    # Programs
    wezterm # terminal
    wofi # launcher

    # Appearance
    waybar # status bar
    swww # wallpaper

    # System
    wl-clipboard # cliboard
    cliphist # clipboard history manager
    dunst # notification manager
    libnotify # notification lib
    brightnessctl # control brightness
    playerctl # control media
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];
}

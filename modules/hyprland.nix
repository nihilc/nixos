{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    # Programs
    wezterm # terminal
    rofi-wayland # launcher
    rofimoji

    # Appearance
    waybar # status bar
    swww # wallpaper

    # System
    wl-clipboard # cliboard
    cliphist # clipboard history manager
    swaynotificationcenter # notification manager
    libnotify # notification lib
    brightnessctl # brightness
    gammastep # brightness / night mode
    playerctl # media control
    pavucontrol # audio control
    networkmanagerapplet # network control
    hyprshot # Screenshots
    hyprpicker # color picker
    hypridle # idle control
    hyprlock # block screen
  ];

  fonts.packages = with pkgs; [
    roboto
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];
}

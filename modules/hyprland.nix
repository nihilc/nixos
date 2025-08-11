{ pkgs, quickshell, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    # Programs
    wezterm # terminal
    wofi # launcher

    # Appearance
    swww # wallpaper
    quickshell.packages.${pkgs.system}.default
    kdePackages.qtdeclarative

    # System
    wl-clipboard # cliboard
    cliphist # clipboard history manager
    swaynotificationcenter # notification manager
    libnotify # notification lib
    brightnessctl # brightness
    gammastep # brightness / night mode
    playerctl # media control
    pulsemixer # audio control
    networkmanagerapplet # network control
    hyprshot # Screenshots
    hyprpicker # color picker
    hypridle # idle control
    hyprlock # block screen
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}

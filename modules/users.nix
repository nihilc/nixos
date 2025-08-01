{ config, pkgs, ... }:

{
  # Define a user account
  users.users.nihilc = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Christian Cardenas";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
  environment.sessionVariables = {
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_CACHE_HOME = "$HOME/.cache";

    GTK2_RC_FILES = "$XDG_CONFIG_HOME/gtk-2.0/gtkrc";
    RUSTUP_HOME = "$XDG_DATA_HOME/rustup";
    CARGO_HOME = "$XDG_DATA_HOME/cargo";
    GOPATH = "$XDG_DATA_HOME/go";
  };
}

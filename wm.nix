{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [swaylock-effects swayidle rofi-wayland waybar gammastep];
  };

  environment.sessionVariables = {
    "GDK_BACKEND" = "wayland";
    "QT_QPA_PLATFORM" = "wayland";
    "CLUTTER_BACKEND" = "wayland";
    "MOZ_ENABLE_WAYLAND" = "1";
    "NIXOS_OZONE_WL" = "1";
  };
}

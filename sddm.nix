{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = pkgs.fetchFromGitHub {
      owner = "EricKotato";
      repo = "sddm-slice";
      rev = "d412b338bcf08e48a3bb20d4c8a93f5b441c9587";
      hash = "sha256-ybvSEH8H8EezcaGIQ5/AakaSDjMD1TWUUaZx0tw6upU=";
    };
  };
}

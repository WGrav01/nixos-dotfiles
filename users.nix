{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  users.users = {
    wgrav = {
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager" "audio" "vboxusers"];
    };
  };
}

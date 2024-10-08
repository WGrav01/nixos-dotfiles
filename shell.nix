{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

    shellAliases = {
      nixbuild = "sudo nixos-rebuild switch";
      nixcfg = "sudo nvim /etc/nixos/configuration.nix";
      cat = "bat --theme=base16";
      ls = "eza --icons=always --color=always -a";
      ll = "eza --icons=always --color=always -a";
      sway = "sway --unsupported-gpu";
    };

    ohMyZsh = {
      enable = true;
      plugins = ["git" "sudo" "copyfile"];
    };
  };
}

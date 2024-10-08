{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  boot = {
    # Prerequisite for Grub
    loader.efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };

    # Enable Grub and themes
    loader.grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      configurationLimit = 10;
      theme = pkgs.stdenv.mkDerivation {
        pname = "Minegrub";
        version = "v3.0.0";
        src = pkgs.fetchFromGitHub {
          owner = "Lxtharia";
          repo = "minegrub-theme";
          rev = "69e492e73c5f24f8be563c576a89f828b67240ec";
          hash = "sha256-oa2Ifjv3WvlL3KqmSpvkZsPeCi5QEHtAQV/w86aSqwg=";
        };
        installPhase = "cp -r minegrub $out";
      };
    };

    # Enable Plymouth for pretty boot up screen
    plymouth = {
      enable = true;
      theme = "connect";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = ["connect"];
        })
      ];
    };

    # Other settings
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernel.sysctl = {
      "kernel.sysrq" = 1;
      "vm.swappiness" = 10;
    };
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
  };
}

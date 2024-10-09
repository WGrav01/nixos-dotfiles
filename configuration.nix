# This is your system's configuration file.
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    ./hardware-configuration.nix
    ./zephyrus.nix
    ./boot.nix
    ./nix-settings.nix
    ./shell.nix
    ./users.nix
    ./neovim.nix
    ./wm.nix
    ./misc.nix
    ./packages.nix
    # ./nvim.nix
    # ./sddm.nix
  ];

  networking.networkmanager.enable = true;

  time = {
    timeZone = "America/New_York";
    hardwareClockInLocalTime = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_MESSAGES = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };

  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.printing.enable = true;
  # Required to detect printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  networking.enableIPv6 = false;
  boot.kernelParams = ["ipv6.disable=1"];
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [42852];
    allowedUDPPorts = [51820 42852];
  };


  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # services.logind.extraConfig = {
  # don’t shutdown when power button is short-pressed
  # HandlePowerKey.ignore = true;
  # };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    font-awesome
    hackgen-nf-font
    dejavu_fonts
    aileron
    liberation_ttf
    nerdfonts
  ];

  fonts.fontconfig.enable = true;

  services.xserver.enable = false;

  security.pam.loginLimits = [
    {
      domain = "@users";
      item = "rtprio";
      type = "-";
      value = 1;
    }
  ];

  networking.hostName = "zephyrus-g14";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}

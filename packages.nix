{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (let
      base = pkgs.appimageTools.defaultFhsEnvArgs;
    in
      pkgs.buildFHSUserEnv (base
        // {
          name = "fhs";
          targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [pkgs.pkg-config];
          profile = "export FHS=1";
          runScript = "fish";
          extraOutputsToInstall = ["dev"];
        }))

    yadm
    neovim
    busybox
    nitch
    cargo
    localsend
    grim
    thefuck
    spicetify-cli
    slurp
    libsForQt5.qt5.qtgraphicaleffects
    luarocks
    libiconv
    spotify
    easyeffects
    autotiling
    bottles
    wireguard-tools
    gamescope
    nwg-displays
    pywal
    pavucontrol
    vulkan-validation-layers
    bat
    webkitgtk
    prismlauncher
    eza
    wl-clipboard
    cmake
    mangohud
    brightnessctl
    qbittorrent
    zoom-us
    tmux
    gnome3.adwaita-icon-theme
    winetricks
    htop
    steam
    libnotify
    alsa-utils
    arduino-ide
    mako
    fzf
    weechat
    libnatpmp
    cava
    git
    nurl
    vulkan-tools
    vulkan-loader
    vulkan-headers
    config.boot.kernelPackages.turbostat
    config.boot.kernelPackages.cpupower
    cpupower-gui
    pkgs.cudatoolkit
    ryzenadj
    gamemode
    ripgrep
    pciutils
    librewolf
    lua5_1
    lazygit
    fastfetch
    alacritty
    vesktop
    xdg-desktop-portal
    gnupg
    pkg-config
  ];
}

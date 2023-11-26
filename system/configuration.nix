# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nicks"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

#Enable the Gnome Desktop Environment.
#services.xserver.displayManager.gdm.enable = true;
#services.xserver.desktopManager.gnome.enable = true;


  # Enable the XFCE Desktop Environment.
 # services.xserver.displayManager.lightdm.enable = true;
 # services.xserver.desktopManager.xfce.enable = true;

  # Enable the KDE Plasma Desktop Environment.
 services.xserver.displayManager.sddm.enable = true;
 services.xserver.desktopManager.plasma5.enable = true;


  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fred = {
    isNormalUser = true;
#    home = "/home/fred";
    description = "fred";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
#    openssh.authorizedKeys.keys = [ "SSHKEY" ];    
    packages = with pkgs; [
      firefox
      vim-full
      terraform      
    #  thunderbird
    ];
  };

    # users.users.my-user = {
    #   isNormalUser = true;
    #   description = "My User";
    #   extraGroups = [ "networkmanager" "wheel" ];
    #   shell = pkgs.zsh;
    #   openssh.authorizedKeys.keys = [ "SSHKEY" ];
    #   packages = with pkgs; [
    #     vim-full
    #     terraform
    #     ...
    #   ];
    # };


  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = false;
  services.xserver.displayManager.autoLogin.user = "fred";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
#  ntfs3g
#  thunderbird
# appimage-run
# nur.repos.wolfangaukang.vdhcoapp
# woeusb
#for dumb logitech g213 kb
#qterminal
#unrar
appimage-run
arc-theme
arc-icon-theme
plata-theme
ark
brave
celluloid
cups
cups-pdf-to-pdf
curl
distrobox
element-desktop
etcher
g203-led
git
git-crypt
gnupg
gnome.file-roller
gnome.gnome-tweaks
gnome.gnome-disk-utility
gnome-multi-writer
 gnome-photos
gnomeExtensions.appindicator
gnomeExtensions.dash-to-panel
gnomeExtensions.openweather
gnomeExtensions.sound-output-device-chooser
gnomeExtensions.arcmenu
gnomeExtensions.clipboard-indicator
gnomeExtensions.gtk4-desktop-icons-ng-ding
gnomeExtensions.focus-changer
gnomeExtensions.switch-focus-type
gnomeExtensions.highlight-focus
gnomeExtensions.noannoyance-2
gparted
hidapi
hplip
hyper
jq
libsForQt5.ark
libsForQt5.kdeconnect-kde
libsForQt5.kdesu
libsForQt5.kpmcore
libsForQt5.yakuake
lxqt.qterminal
ne
obs-studio
obsidian
onlyoffice-bin
p7zip
partition-manager
#pcloud pcloud on 23.05 not working use nix-env -f channel:nixos-22.11 -iA pcloud instead
protonvpn-cli
protonvpn-gui
qbittorrent
#qownnotes
rar
#simplenote no longer maintained see pcloud if you need it
syncthing
syncthing-tray
tailscale
#tdesktop
telegram-desktop
textadept
#vim-full
vscodium
wireguard-tools
woeusb-ng
xfce.xfce4-notifyd
xfce.xfce4-power-manager
xfce.xfce4-pulseaudio-plugin
xfce.xfce4-screensaver
xfce.xfce4-screenshooter
xfce.xfce4-whiskermenu-plugin
zoom-us
zsh
oh-my-zsh
##testing 
#vscode-with-extensions
neofetch
kitty
kitty-themes
pantheon-tweaks
vlc
obs-studio-plugins.wlrobs
obs-studio-plugins.obs-vaapi
obs-studio-plugins.obs-pipewire-audio-capture
obs-studio-plugins.advanced-scene-switcher
obs-studio-plugins.obs-backgroundremoval
obs-studio-plugins.obs-vintage-filter
htop
rclone
rclone-browser
chromium-bsu
openarena
uget
gpodder
qbittorrent
ytmdesktop
dosbox
audacious
cider
openshot-qt
joplin-desktop
#calibre
filezilla
ripdrag
shortwave
libreoffice-fresh
tldr
virt-manager
ulauncher
dwt1-shell-color-scripts
evolutionWithPlugins
python311
fortune
figlet
cmatrix
duf
bat
#exa #ls replacement no longer maintained
#fusePackages.fuse_2
git
(vscode-with-extensions.override {
  vscodeExtensions = with vscode-extensions; [
    bbenoist.nix
  ];
})
github-desktop



  ];

################################################
################### J O H N ' S  C H A N G E S #############
################################################
nixpkgs.config.permittedInsecurePackages = [
    "electron-24.8.6"
		"electron-12.2.3"
    "electron-19.1.9"
#openssl is for github-desktop
    "openssl-1.1.1w"
    ];

system.autoUpgrade.enable = true;
system.autoUpgrade.allowReboot = true;
services.tailscale.enable = true;
services.printing.drivers = [ pkgs.hplip ];

services.avahi = {
  enable = true;
  nssmdns = true;
  openFirewall = true;
};

nix.gc.automatic = true;
nix.gc.dates = "03:15";

virtualisation.podman.enable = true;

environment.gnome.excludePackages = (with pkgs; [
  gnome-tour
]) ++ (with pkgs.gnome; [
  cheese # webcam tool
  gnome-music
  gnome-terminal
  gedit # text editor
  epiphany # web browser
  geary # email reader
  evince # document viewer
  gnome-characters
  totem # video player
  tali # poker game
  iagno # go game
  hitori # sudoku game
  atomix # puzzle game
]);

services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

    programs = {
      zsh = {
        enable = true;
        shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };
#        histSize = 10000;
#        histFile = "${config.xdg.dataHome}/zsh/history";
        ohMyZsh = {
          enable = true;
          theme = "robbyrussell";
          plugins = [
            "sudo"
            "terraform"
            "systemadmin"
            "vi-mode"
          ];
        };
      };
    };

#};
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  #networking.firewall.allowedTCPPorts = [ 22 ];
  #networking.firewall.allowedUDPPorts = [ 22 ];
  # Or disable the firewall altogether.
  #networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "unstable"; # Did you read the comment?

}

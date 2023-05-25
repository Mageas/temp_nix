{ pkgs, config, lib, ... }:
{
  imports = [
    ../home.nix
    ./hardware-configuration.nix
  ];
  
  services.xserver.enable = true; # CUSTOMIZED
  services.xserver.layout = "us"; # CUSTOMIZED
  services.xserver.libinput.enable = true; # CUSTOMIZED
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = false;
  services.xserver.desktopManager.gnome.enable = true;

  ## Modules
  # modules = {
  #   desktop = {
  #     bspwm.enable = true;
  #     apps = {
  #       rofi.enable = true;
  #    };
  #     browsers = {
  #       default = "brave";
  #       brave.enable = true;
  #    };
  #    term = {
  #       default = "xterm";
  #    };
  #  };
  #  editors = {
  #     default = "nvim";
  #     vim.enable = true;
  #   };
  # };


  ## Local config
  programs.ssh.startAgent = true;
  services.openssh.startWhenNeeded = true;

  networking.networkmanager.enable = true;
 }

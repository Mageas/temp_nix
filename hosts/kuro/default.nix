{ pkgs, config, lib, ... }:
{
  imports = [
    ../home.nix
    ./hardware-configuration.nix
  ];

  ## Modules
  modules = {
    desktop = {
      bspwm.enable = true;
      apps = {
        rofi.enable = true;
     };
      browsers = {
        default = "brave";
        brave.enable = true;
     };
     term = {
        default = "xst";
        st.enable = true;
      };
   };
   editors = {
      default = "nvim";
      vim.enable = true;
    };
  #  theme.active = "alucard";
  };


  ## Local config
  programs.ssh.startAgent = true;
  services.openssh.startWhenNeeded = true;

  networking.networkmanager.enable = true;
 }

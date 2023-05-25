{ config, lib, ... }:

with builtins;
with lib;
{
  time.timeZone = mkDefault "Europe/Paris";
  i18n.defaultLocale = mkDefault "en_US.UTF-8";
  
  # For redshift, mainly
  location = (if config.time.timeZone == "Europe/Paris" then {
    latitude = 48.8667;
    longitude = 2.3333;
  } else {});
}

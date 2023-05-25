{ config, lib, ... }:

with builtins;
with lib;
{
  time.timeZone = mkDefault "Europe/Paris";
  i18n.defaultLocale = mkDefault "en_US.UTF-8";
}

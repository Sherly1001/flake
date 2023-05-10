{ pkgs, ... }:
let
  files = builtins.attrNames (builtins.readDir ./.);
  scripts = builtins.filter (pkgs.lib.strings.hasSuffix ".sh") files;
  mkLink = file: {
    name = ".local/bin/${file}";
    value = { source = ./. + "/${file}"; };
  };
in
{
  home.file = builtins.listToAttrs (map mkLink scripts);
}

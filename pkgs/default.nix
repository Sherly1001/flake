rec {
  overlay = final: prev:
    let
      dirContents = builtins.readDir ./.;
      genPkg = name: {
        inherit name;
        value = final.callPackage (./. + "/${name}") { };
      };
      names = builtins.attrNames dirContents;
    in
    builtins.listToAttrs (map genPkg names);
}

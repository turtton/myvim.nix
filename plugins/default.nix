{ pkgs }:
let
  sources = pkgs.callPackage ../_sources/generated.nix { };
in
let
  normalizePname =
    pname:
    builtins.replaceStrings
      [
        "-"
        "."
      ]
      [
        "_"
        "_"
      ]
      (pkgs.lib.toLower pname);

  pkgListToAttr =
    pkgList:
    pkgs.lib.foldl'
      (
        acc: pkg:
        let
          pname = pkg.pname;
        in
        acc // { "${normalizePname pname}" = pkg; }
      )
      { }
      pkgList;

  plugins = (pkgListToAttr (import ./vim-plugins.nix { inherit pkgs sources; })) // {
    skk_dict = if pkgs.hostPlatform.isLinux then "${pkgs.libskk}/share/skk/SKK-JISYO.L" else "${pkgs.macskk}/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/SKK-JISYO.L";
  };
in
plugins

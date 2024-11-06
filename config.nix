{ plugins
, pkgs
,
}:
let
  lib = pkgs.lib;
  stdenv = pkgs.stdenv;
  vimPlugins = pkgs.vimPlugins;
  envVars = plugins // {
    treesitter_parsers =
      lib.pipe
        (vimPlugins.nvim-treesitter.withPlugins (
          p: with p; [
            astro
            bash
            c
            comment
            cpp
            css
            dockerfile
            go
            gomod
            graphql
            haskell
            html
            javascript
            jsdoc
            json
            jsonc
            lua
            make
            markdown
            markdown_inline # lspsaga.nvim require this
            nix
            prisma
            python
            rust
            scss
            sql
            toml
            tsx
            typescript
            vim
            yaml
            yuck
            zig
          ]
        )).dependencies
        [
          (builtins.map builtins.toString)
          (builtins.concatStringsSep ",")
        ];
  };
in
stdenv.mkDerivation (
  envVars
    // {
    pname = "turtton-nvim-config";
    version = "latest";
    src = ./nvim;

    installPhase = ''
      mkdir -p $out
      for file in $(find . -type f); do
        substituteAllInPlace "$file"
      done
      cp -r ./ $out
    '';
  }
)

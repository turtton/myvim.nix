{
  description = "Flake utils demo";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      treefmt-nix,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        formatter = treefmt-nix.lib.mkWrapper pkgs {
          projectRootFile = "flake.nix";
          programs = {
            nixfmt.enable = true;
            taplo.enable = true;
            stylua.enable = true;
          };
          settings.global.excludes = [
            "_sources/*"
          ];
        };
        packages =
          let
            plugins = import ./plugins { inherit pkgs; };
            tools = import ./tools.nix { inherit pkgs; };
            nvimConfig = import ./config.nix { inherit pkgs plugins; };
            mkNeovimWrapper = import ./wrapper.nix pkgs;
          in
          {
            default = mkNeovimWrapper tools;
            config = nvimConfig;
          };
        lib =
          let
            mkNeovimWrapper = import ./wrapper.nix pkgs;
          in
          {
            # mkNeovimWrapper :: [extraPackages] -> derivation
            inherit mkNeovimWrapper;
          };
        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs; [
              nvfetcher
            ];
          };
        };
      }
    );
}

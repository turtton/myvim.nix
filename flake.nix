{
  description = "Flake utils demo";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; }; in
      {
        formatter = pkgs.nixpkgs-fmt;
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
          let mkNeovimWrapper = import ./wrapper.nix pkgs;
          in {
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

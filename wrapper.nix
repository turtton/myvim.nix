pkgs: extraPackages:
let
  plugins = import ./plugins { inherit pkgs; };
  nvimConfig = pkgs.callPackage ./config.nix { inherit plugins; };
in
pkgs.writeShellApplication {
  name = "nvim";
  meta = {
    description = "My Neovim configuration";
  };
  text = ''
    		PATH=$PATH:${pkgs.lib.makeBinPath extraPackages}
      	MY_CONFIG_PATH=${nvimConfig} ${pkgs.neovim-unwrapped}/bin/nvim -u ${nvimConfig}/init.vim "$@"
    	'';
}

{ pkgs }: with pkgs; [
  lazygit
  # Required by telescope
  ripgrep
	# Required by denops
	deno

  # Language servers
  ## Lua
  lua-language-server
  stylua
  ## nix
  nixd
  ## TOML
  taplo
  ## Shell
  shellcheck
  shfmt
  nodePackages.bash-language-server
  # Docker
  nodePackages.dockerfile-language-server-nodejs
]

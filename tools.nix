{ pkgs }:
with pkgs;
[
  lazygit
  # Required by telescope
  ripgrep
  # Required by denops
  deno

  # Time management
  wakatime-cli

  # Language servers
  ## Lua
  lua-language-server
  stylua
  ## nix
  nixd
  ## TOML
  taplo
  ## yaml
  yaml-language-server
  ## Shell
  shellcheck
  shfmt
  nodePackages.bash-language-server
  # Docker
  nodePackages.dockerfile-language-server-nodejs
  # Haskell
  haskell-language-server
  haskellPackages.fourmolu
]

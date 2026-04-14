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

  # Required by opencode.nvim
  lsof

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
  ## JSON/HTML/CSS
  vscode-langservers-extracted
  ## Markdown
  markdown-oxide
  ## Typo
  typos-lsp
  ## Shell
  shellcheck
  shfmt
  nodePackages.bash-language-server
  # Docker
  dockerfile-language-server
]

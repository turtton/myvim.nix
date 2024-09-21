{ pkgs, sources }:
let
  vimdoc-ja = pkgs.vimUtils.buildVimPlugin {
    inherit (sources.vimdoc-ja) pname version src;
    dontBuild = true;
  };

  hlchunk-nvim = pkgs.vimUtils.buildVimPlugin {
    inherit (sources.hlchunk-nvim) pname version src;
    dontBuild = true;
  };

  skkeleton = pkgs.vimUtils.buildVimPlugin {
    inherit (sources.skkeleton) pname version src;
    dependencies = [ pkgs.vimPlugins.denops-vim pkgs.deno ];
    dontBuild = true;
  };

  cmp-skkeleton = pkgs.vimUtils.buildVimPlugin {
    inherit (sources.cmp-skkeleton) pname version src;
    dependencies = [ skkeleton pkgs.vimPlugins.nvim-cmp ];
    dontBuild = true;
  };
in
[
  vimdoc-ja
  hlchunk-nvim
  skkeleton
  cmp-skkeleton
]
++ (with pkgs.vimPlugins; [
  # Colorscheme
  catppuccin-nvim

  # Syntax Highlighting
  nvim-treesitter

	better-escape-nvim

  # Coding
  comment-nvim
  nvim-hlslens
  nvim-autopairs

  # Completion
  nvim-cmp
  cmp-nvim-lsp
  cmp-buffer
  cmp-cmdline
  cmp-path
  cmp_luasnip
  copilot-cmp
  luasnip

  # Copilot
  copilot-lua
	CopilotChat-nvim

  # Git
  gitsigns-nvim
  lazygit-nvim

  # LSP
  nvim-lspconfig
  lspsaga-nvim
  lspkind-nvim
  rust-tools-nvim
  crates-nvim
  typst-vim
  neodev-nvim
  trouble-nvim
  SchemaStore-nvim
  tiny-inline-diagnostic-nvim
  # Formatter
  conform-nvim

  # Start Page
  alpha-nvim
  # Status Line
  heirline-nvim
  # Fizzy Finder
  telescope-nvim
  telescope-file-browser-nvim
  # File viewer
  neo-tree-nvim
  # Notifier
  noice-nvim

  # Utility
  nvim-scrollbar
  toggleterm-nvim
  which-key-nvim

  # Libraries
  plenary-nvim
  promise-async
  nui-nvim
  nvim-web-devicons
	denops-vim
])

{ pkgs, sources }:
let
  vimdoc-ja = pkgs.vimUtils.buildVimPlugin {
    inherit (sources.vimdoc-ja) pname version src;
    dontBuild = true;
  };

  skkeleton = pkgs.vimUtils.buildVimPlugin {
    inherit (sources.skkeleton) pname version src;
    dependencies = [
      pkgs.vimPlugins.denops-vim
      pkgs.deno
    ];
    dontBuild = true;
  };

  cmp-skkeleton = pkgs.vimUtils.buildVimPlugin {
    inherit (sources.cmp-skkeleton) pname version src;
    dependencies = [
      skkeleton
      pkgs.vimPlugins.nvim-cmp
    ];
    dontBuild = true;
  };

  gitmoji-nvim = pkgs.vimUtils.buildVimPlugin {
    inherit (sources.gitmoji-nvim) pname version src;
    dontBuild = true;
  };
in
[
  vimdoc-ja
  skkeleton
  cmp-skkeleton
]
++ (with pkgs.vimPlugins; [
  # Plugin manager
  lazy-nvim

  # Colorscheme
  catppuccin-nvim

  # Syntax Highlighting
  nvim-treesitter
  hmts-nvim

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

  # Claude Code
  claudecode-nvim

  # Git
  gitsigns-nvim
  lazygit-nvim
  gitmoji-nvim

  # LSP
  otter-nvim
  nvim-lspconfig
  lspsaga-nvim
  lspkind-nvim
  rustaceanvim
  crates-nvim
  typst-vim
  neodev-nvim
  trouble-nvim
  SchemaStore-nvim
  tiny-inline-diagnostic-nvim
  # Formatter
  conform-nvim

  # Tex
  vimtex

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
  vim-wakatime
  direnv-vim
  smart-splits-nvim
  mini-bufremove
  mini-indentscope
  sort-nvim
  hlchunk-nvim

  # Libraries
  plenary-nvim
  promise-async
  nui-nvim
  nvim-web-devicons
  denops-vim
  snacks-nvim
])

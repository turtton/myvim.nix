let g:NVIM_CONFIG_DIR= $MY_CONFIG_PATH
exec 'source' . g:NVIM_CONFIG_DIR . '/settings.vim'
exec 'source' . g:NVIM_CONFIG_DIR . '/nvim-settings.vim'
exec 'source' . g:NVIM_CONFIG_DIR . '/keybindings.vim'
exec 'source' . g:NVIM_CONFIG_DIR . '/lua/init.lua'

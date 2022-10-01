# vimconfig
My standardized vim configurations

## Implementation
1. Clone the project or just download .vimrc file
2. Copy .vimrc to ~/.vimrc
3. For nvim, create a simlink with ```ln -s ~/.vimrc ~/.config/nvim/init.vim```

## Install vim-plug plugin manager for vim/neovim
```
"sh -c 'curl -fLo ""${XDG_DATA_HOME:-$HOME/.local/share}""/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
```

## Nvim Commands
- open nvim: ```nvim```
- install the plugins listed in the config file: ```:PlugInstall```
- update the plugins: ```:UpdateRemotePlugins```
- exit the update: ```:q!```
- exit nvim: ```:q!```
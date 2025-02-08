# Vim Configuration

My current vim config, up to date as of 12/24/2020.

To be used with [neovim](https://github.com/neovim/neovim), running on WSL 2

## Setup

1. Clone repository

2. Create the following symbolic links (for Vim):

```ln -s [REPO]/.vimrc ~/.vimrc```

```ln -s [REPO]/.vim ~/vim```

3. In-order to get it to work with _neovim_, edit `~/.config/nvim/init.vim` to contain:

```
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc
```

This will effectively make you have one vimrc. In-order to keep regular _vim_ functional, you might need to add checks into your _.vimrc_


4. Update your python paths. Edit the third line in ```[REPO]/.vimrc``` to point to your respective python path. 


5. Open neovim, run ex-command: ```:PlugInstall```


## Clipboard Sharing
WSL 2 changes how clipboard works. Albeit not directly related to the VIM config, without clipboard sharing, Neovim is effectively unusable for development under windows. To get clipboard sharing to work, you'll need an X-server such as [VcXrv](https://sourceforge.net/projects/vcxsrv/). I suggest you follow the steps outlined in [this stackoverflow post](https://stackoverflow.com/questions/61110603/how-to-set-up-working-x11-forwarding-on-wsl2).

## Python Environment
[Here's](https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/) a decent blog post on setting up Python dev environment in neovim.

## Troubleshooting

* Problem diagnosis --> Run ```:CheckHealth```

* Common problem: 

> ERROR: has("python3") was not succesful

To fix: run ```pip3 install neovim``` in the same python enviornment you set in step 4.


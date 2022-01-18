# `~/.config/nvim`

Lua based config for nvim.

## Installation
Clone this repository to `~/.config/nvim`. Make sure to backup any existing nvim config dir.

```
mv ~/.config/nvim ~/.config/nvim.old  # move existing nvim config dir
git clone https://github.com/arindas/nvim-config.git ~/.config/nvim
```

Alternatively, you can clone this repository to some other path and keep a symlink. e.g.:
```
git clone https://github.com/arindas/nvim-config.git $HOME/source/nvim-config
ln -s ~/.config/nvim $HOME/source/nvim-config
```


## Check nvim health
Open nvim and use the following command:
```
:checkhealth
```

## Dependencies
Python and node support for nvim. (node is optional)
- nvim python support
  ```
  pip install pynvim
  ```

- neovim node support
  ```
  npm -i g neovim
  ```

## Reference
- [https://github.com/LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch)

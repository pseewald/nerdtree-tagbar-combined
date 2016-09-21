#Tagbar and NERDTree in one vertical split window#

This is a hack to open Tagbar and NERDTree in the same split window.

```
-----------------------------
| N   |                     |
| E   |                     |
| R T |                     |
| D r |                     |
|   e |                     |
|   e |                     |
|-----|     main buffer     |
|  T  |                     |
|  a  |                     |
|  g  |                     |
|  b  |                     |
|  a  |                     |
|  r  |                     |
-----------------------------
```

##Dependencies:

* [NERDTree](https://github.com/scrooloose/nerdtree)
* [Tagbar](https://github.com/majutsushi/tagbar)


##Usage:

Put something like
```vim
nmap <F7> :ToggleNERDTreeAndTagbar<CR>
```
in your vimrc, use `<F7>` to toggle NERDTree and Tagbar.
Use `ctrl-w w` to move cursor between buffer, nerdtree and tagbar.


##Issues:

Currently known issues:
* fails if you navigate from tagbar to NERDTree and then open a file in a vertical split. *Solution*: only use `ctrl-w w` for navigation.


##Acknowledgements

This is a fork of [ToggleNERDTreeAndTagbar](https://github.com/wlemuel/ToggleNERDTreeAndTagbar).

[![Lint](https://github.com/obaland/vfiler-action-yanktree/actions/workflows/lint.yml/badge.svg)](https://github.com/obaland/vfiler.vim/actions/workflows/lint.yml)

# vfiler-action-yanktree

This project is an extension plugin for `vfiler.vim` that provides the functionality to copy the filesystem tree structure to the clipboard. This plugin uses the `tree` command internally, so the `tree` command is necessary.

## Prerequisites

- Linux or macOS
- `tree` command installed

## Installation

Use your favorite plugin manager to install `vfiler-action-yanktree`. For example, if you are using [vim-plug](https://github.com/junegunn/vim-plug), follow the steps below.

Using [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'your-github-username/vfiler-action-yanktree'
```

Using [dein.vim](https://github.com/Shougo/dein.vim)
```vim
call dein#add('obaland/vfiler.vim')
```

Using [packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use {
  'obaland/vfiler.vim',
}
```

## Configuration

After installation, to configure this plugin as an action in `vfiler.vim`, map the action to your preferred key as shown below.

```lua
local action = require('vfiler/actions/yanktree')

require('vfiler/config').setup({
  -- Please map to your preferred key.
  mappings = {
    ['<M-y>'] = action.yank_tree,
  }
})
```

## License

This project is released under the [MIT License](LICENSE).

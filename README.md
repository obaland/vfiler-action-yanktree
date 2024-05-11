[![Lint](https://github.com/obaland/vfiler-action-yanktree/actions/workflows/lint.yml/badge.svg)](https://github.com/obaland/vfiler.vim/actions/workflows/lint.yml)

# vfiler-action-yanktree

This project is an extension plugin for `vfiler.vim` that provides the functionality to copy the filesystem tree structure to the clipboard. This plugin uses the `tree` command internally, so the `tree` command is necessary.

## Prerequisites

- Linux or macOS
- `tree` command installed

## Installation

Use your favorite plugin manager to install `vfiler-action-yanktree`. For example, if you are using [vim-plug](https://github.com/junegunn/vim-plug), follow the steps below.

```vim
Plug 'your-github-username/vfiler-action-yanktree'
```

## Configuration

After installation, to configure this plugin as an action in `vfiler.vim`, map the action to your preferred key as shown below.

```vim
let g:vfiler_config = {
\ 'mappings': {
\   'your-preferred-key': 'YankTree',
\ }
\}
```

## Usage

Press the configured key to fetch the current directory structure using the `tree` command and copy it to the clipboard. This allows you to easily paste it into other applications.

## License

This project is released under the [MIT License](LICENSE).

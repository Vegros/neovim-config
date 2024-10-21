# Neovim Configuration

This document outlines the configuration setup for Neovim using Vim-Plug as the plugin manager. It includes plugins for file management, code completion, themes, and additional functionality to enhance your coding experience.

## Installation Steps

1. **Install Plugins**:
   Open Neovim and run the command:

```vim
   :PlugInstall
```


### Download NodeJS:
	https://nodejs.org/en/download/package-manager


### Additional Extensions 

To enhance code completion for Python and TypeScript, you can install the following extensions: 

- **coc-pyright**: A Language Server for Python. 
- **coc-tsserver**: A Language Server for TypeScript and JavaScript. 
#### Installation 

1. Open Neovim: ```bash nvim
2. type the command `:CocInstall coc-pyright coc-tsserver`


### Download Fira Code:

- Visit the [Fira Code releases page](https://github.com/tonsky/FiraCode/releases).

- Download the latest version.


### Install the Font:

- Extract and install the font on your system.

- Set Fira Code as the font in your terminal emulator settings.

  

## New Commands

  

Here are the new commands added to your Neovim configuration:

  

- **`Ctrl + t`**: Opens a new terminal window.

- **`Ctrl + n`**: Toggles the file directory (NvimTree).

- **`gcc`**: Toggles comments on selected code.

- **`gc`**: Toggles comments on the current line.

- **`<leader>ff`**: Opens the Telescope file finder.

- **`<leader>fg`**: Executes a live grep search.

- **`<leader>fs`**: Searches for the string under the cursor.

- **`:`**: Opens a floating command input.


## Additional Commands For more detailed commands, check out the [Commands Documentation](commands.md)

# Neovim Configuration

This document outlines the configuration setup for Neovim using lua and LazyVim as the plugin manager. It includes plugins for file management, code completion, themes, and additional functionality to enhance your coding experience.

## Installation Steps

### Install ctags
This is needed for tagbar plugin for better code navigation

#### For macos 
```bash 
   brew install ctags
```
#### For arch 
```bash 
   pacman -S ctags
```
#### For ubuntu 
```bash 
   sudo apt install ctags
```
#### For windows 
Download ctags [here](https://github.com/universal-ctags/ctags-win32/releases)

### Esure you have gcc installed 
This is needed for the syntax highliting plugin

#### For windows 
Download gcc [here](https://sourceforge.net/projects/mingw/)

#### Check for gcc in your system 
```bash
   gcc --version
```

### Install ripgrep

To enhance your search capabilities in Neovim, you can install ***ripgrep*** Below are the installation instructions for different operating systems:
#### For macOS

You can install ripgrep using Homebrew. Run the following command in your terminal:

  

```bash
   brew install ripgrep
```

  
#### For Windows

```bash 
   winget install BurntSushi.ripgrep.GNU
```


#### For Linux

You can install ripgrep using the package manager for your distribution. Here are some examples:

  
- ***Ubuntu/Debian***:

```bash
   sudo apt install ripgrep
```

  

- ***Fedora***:

```bash
   sudo dnf install ripgrep
```

  

- ***Arch Linux***:

```bash
   sudo pacman -S ripgrep
```


#### Verify Installation  

```bash
   rg --version
```

### Download NodeJS:

- Visit the [node.js installation page](https://nodejs.org/en/download/package-manager)

### Install/Update/Verify Plugins
   Open Neovim and run the command:

```vim
   :Lazy
```

### Configure LSP,Formatter,Linter
   Open Neovim and run the command:

```vim
   :Mason
```

### Additional Extensions 

To enhance syntax highliting for Python or any programming language, you can install the following: 
 
#### Installation 

1. Open Neovim: `nvim`
2. type the command `:TSInstall all`
3. Verify Installation with `:TSInstallInfo`



### Download Fira Code:

- Visit the [Fira Code releases page](https://github.com/tonsky/FiraCode/releases).

- Download the latest version.


### Install the Font:

- Extract and install the font on your system.

- Set Fira Code as the font in your terminal emulator settings.

  

## New Commands

  

Here are the new commands added to your Neovim configuration:

  

- **`Ctrl + t`**: Opens a new terminal window.

- **`Ctrl + m`**: Opens a floating terminal window.

- **`Ctrl + n`**: Toggles the file directory (NvimTree).

- **`a`**: Creates a new file (NvimTree).

- **`r`**: rename file (NvimTree).

- **`d`**: deletes file (NvimTree).

- **`gcc`**: Toggles comments on selected code.

- **`gc`**: Toggles comments on the current line.

- **`<leader>ff`**: Opens the Telescope file finder.

- **`<leader>fg`**: Executes a live grep search.


To use the feature below please uncomment the line of code below!

```lua 
   vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true, silent = true })

```  

- **`:`**: Opens a floating command input. 


#### Additional Commands For more detailed commands, check out the [Commands Documentation](commands.md)

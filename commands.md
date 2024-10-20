# Vim Command List

## Insert Mode
- `i`      => Enter insert mode
- `a`      => Insert character after the cursor
- `o`      => Open a new line below the current line
- `Shift + i`  => Enter insert mode at the start of the line
- `Shift + a`  => Enter insert mode at the end of the line
- `Shift + o`  => Open a new line above the current line

## Saving Mode
- `w`      => Write (save) to the file
- `q`      => Quit the file
- `!`      => Override changes
- `q!`     => Quit the file without saving changes
- `wq`     => Save and quit
- `u`      => Undo last change
- `Ctrl + r` => Redo last undone change

## Visual Mode
- `d`      => Delete selected text
- `y`      => Yank (copy) selected text
- `p`      => Paste text after the cursor
- `dd`     => Delete the whole line
- `5dd`    => Delete the next 5 lines
- `yy`     => Copy the whole line
- `P`      => Paste text before the cursor
- `cc`     => Change (replace) the entire line
- `D`      => Delete from the cursor to the end of the line
- `C`      => Change from the cursor to the end of the line
- `r`      => Replace the character under the cursor
- `w`      => Jump to the next word
- `b`      => Jump backwards to the previous word
- `dw`     => Delete a word
- `diw`    => Delete the inner word
- `ciw`    => Change the inner word
- `0`      => Move to the start of the line
- `$`      => Move to the end of the line
- `d0`     => Delete from the beginning of the line to the cursor
- `d$`     => Delete from the cursor to the end of the line
- `ci"`    => Change text inside the nearest quotes or specified character
- `%`      => Move to the next matching character (e.g., `{` to `}`)
- `t*`     => Jump before the next `*` position
- `f*`     => Jump to the next `*` position
- `T`      => Same as `t`, but backwards
- `F`      => Same as `f`, but backwards
- `gg`     => Go to the start of the file
- `G`      => Go to the end of the file
- `123G`   => Go to line number 123
- `>>`     => Indent the line to the right
- `<<`     => Indent the line to the left
- `Shift + V` => Enter visual line mode
- `Ctrl + v` => Enter visual block mode (select columns)
- ` == ` Re-indent the current line according to the file type's indentation rules
- `gg=G`   => Indent from the start of the file to the end
- `zz`     => Center the line in the middle of the screen
- `.`      => Repeat the last command executed

## Search
- `/hello` => Search for the word "hello"
- `n`      => Jump to the next found word
- `N`      => Jump backwards to the previously found word
- `#`      => Jump backwards to the selected word
- `*`      => Jump to the next selected word
- `:%s/character/symbol/g` => Search and replace "character" with "symbol" in the entire file
- `:s/character/symbol/g` => Search and replace "character" with "symbol" in the current line or selection

## Commands
- `qa`     => Record a macro named 'a'
- `@a`     => Execute the macro named 'a'
- `:reg`   => View the file's registers
- `:set number` => Display line numbers
- `n + ↑`  => Go up `n` number of lines
- `n + ↓`  => Go down `n` number of lines
- `:set relativenumber` => Enable relative line numbering
- `:set mouse=a` => Enable mouse support
- `:set tabstop=4` => Set the width of a tab character to 4 spaces
- `:set shiftwidth=4` => Set the width for automatic indentation to 4 spaces
- `:colorscheme {colorscheme}` => Choose a color scheme (press Tab to browse options)

## Navigation
- Arrow keys => Move cursor in the respective direction
- `h`      => Move left
- `j`      => Move down
- `k`      => Move up
- `l`      => Move right


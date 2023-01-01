# Ubuntu help

## You can remove a directory by writing:
   - rm -fr <filename>
   - rm -r <** alternativesfilename>

## Uninstall programs by running:
   + sudo apt remove - <program>

## use different shell
   - "type command" chsh
   - "specify shell" /usr/bin/("shell e.g. zsh")

## access wsl "Ubuntu" through windows
   - type "\\wsl$\" into Fileexplorer addressbar

## Shortcuts
   - <C-l> -> clear
   - <C-c> -> abort current task
   - <C-z> -> suspend current task
   - <C-p> -> select previous command
   - <C-n> -> selext next command
   - <C-w> -> delete a word backward
   - <C-u> -> delete backwards from cursor
   - up and down arrow keys, select previous commands (pretty obsolete)
   - tab -> autocomplete filename
   - tab tab -> show file list

## Alternatives
| Keymaps     | Shortcuts   |
|-------------|-------------|
| M-w         | delete line |
| M-backspace | delete word |
| C-u         | delete line |

## Appearance 
   - settings -> Appearance -> Dock -> Autohide Dock
   - settings -> display -> nightlight
   - settings -> background -> new Wallpaper 

## Basic Commands
   - rm -r and rmdir -> both rm directories 
   - ls -> list
   - mv -> rename or move 
   - cp -> copy 
   - mkdir -> create directory  
   - find
   - man -> open manual (flag(keywords): -k)
   - cat -> shows content of file
   - sort -> sorts content of file
   - ./a.out | sort > Outfile (output is sorted and put into Outfile)

## Navigation commands
   - grep to find files

## Path
   - Rückverweise: ".."
   - Selbstverweise: "."
   - export path in your terminal so that binaries can be executed

## Debugging
   - gcc -I./"<inputdirectoy>" "<bugged_file>" > error.log 2>&1


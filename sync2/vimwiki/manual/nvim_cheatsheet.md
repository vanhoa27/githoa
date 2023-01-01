# NVIM_CHEATSHEET

## Outline
- [Important Notes](#important-notes)  
- [Basics](#Basics)  
- [Undo Redo](#Undo/Redo)  
- [Motions](#Motions)
- [YANK PASTE DELETE CHANGE](#YANK/PASTE/DELETE/CHANGE)
- [Replace](#Replace)
- [Useful](#Useful)

### Important Notes

- <C-i> and <tab> are the same
- <C-h> and <backspace> are the same

---

### BASICS

- i -> enter insert mode before cursor
- a -> enter insert mode behind cursor

- I -> enter insert mode at the start of the line
- A -> enter insert mode at the end of the line

- o -> enter insert mode below cursor (on a new line)
- O -> enter insert mode above cursor (on a new line)

- esc -> enter normal mode
- v -> enter visual mode
- V -> enter visual line mode
- o -> jumps between selected end in visual mode

---

### UNDO/REDO

- u -> undo change
- /<C-r> -> redo change

---

### MOTIONS

- hjkl -> move left,up,down,right

- w -> go to beginning of next word
- b -> go to back of next word
- e -> go to end of word

- W -> go to beginning of next word (seperated by whitespace)
- B -> go to back of next word (seperated by whitespace)
- E -> go to end of word (seperated by whitespace)

- gg -> go to beginning of file
- G -> go to end of file
- <number>gg -> go the specified line

- 0 -> go to beginning of line
- \_ -> go to beginning of line (no whitespace)
- $ -> go to end of line

- H -> go to top of screen
- M -> go to middle of screen
- L -> go to end of screen
- zz -> center current line on screen

### YANK/PASTE/DELETE/CHANGE

- yy -> yank a line
- yw -> yank a word
- "+y -> yank to system clipboard

- p -> paste
- "+p -> paste from system clipboard

- dd -> delete a line
- dw -> delete a word
- D -> delete starting from cursor to end

- cc -> change a line
- cw -> change a word
- C -> change starting from cursor to end
- cl -> change one character & enter insert mode
- same as s

---

### INSERTION-MODE SHORTCUTS

- <C-w> -> delete word backwards
- <C-u> -> delete upto cursor backwards
- <C-j> -> start a new line

- <C-a> -> paste from "." register
- <C-r> -> paste from specified register
- <C-n> -> select next complete
- <C-p> -> select previous complete

- <C-x> <C-l> -> complete a line
- <C-x> <C-f> -> complete from file
- <C-x> <C-o> -> omincomplete

---

### REPLACE

- r<char> -> replace one char
- x -> delete one char (keymap "x" to "\_x" to avoid pasting into clipboard)
- s -> delete one char and go into insert mode
- S -> delete contents of one line and go into insert mode (same as cc)

- :%s/<text>/<replacement -> replace <text>
- :%s/<text>/<replacement/g -> replace <text> globally
- :%s/<text>/<replacement/gc -> replace <text> globally and ask for confirmation

---

### USEFUL

- viw -> select whole word (no matter cursor position)
- diw -> delete whole word (no matter cursor position)
- ciw -> change a whole word (no matter cursor position)
- yiw -> yank a whole word (no matter cursor position)

- vi( -> select all inside brackets (va includes the brackets)
- di( -> delete all inside brackets (da includes the brackets)
- ci( -> change all inside brackets (ya includes the brackets)
- yi( -> yank all inside brackets (ya includes the brackets)

---

### INCREMENT/DECREMENT/CAPITALISE/DECAPITALISE

- <C-a> -> increment
- <C-x> -> decrement
- g<C-a> -> increment in order
- g<C-x> -> decrement in order

- guiw -> decapitalise word
- gUiw -> capitalise word
- guap -> decapitalise all words in paragraph

---

### REPEATING

- ; -> repeats last motion
- , -> repeats last motion in reverse
- . -> repeats last change

---

### SCROLL SHORTCUTS

- <C-e> -> scroll down one line
- <C-y> -> scroll up one line

- <C-d> -> scroll down half a screen
- <C-u> -> scroll up half a screen

- <C-f> -> scroll down a whole screen
- <C-b> -> scroll up a whole screen

---

### FOLDS

- zf -> create fold
- zd -> delete fold
- zR -> open all folds
- zM -> close all folds

- zo -> open fold
- zc -> close fold

- :mkview -> save foldview
- :loadview -> make folds visable

---

### SAVE/QUIT

- ZZ -> quit and save (if modified)
- ZQ -> quit and discard changes
- <C-z> -> suspend current session (fg in Terminal to reopen)

---

### INDENTATION

- <C-i> -> indent current line (insert mode)
- <C-d> -> deindent current line (insert mode)

- < ap -> indent all text in the paragraph to the left
- /> ap -> indent all text in the paragraph to the right
- = ap -> autoindent paragraph

---

### JUMPS

- <C-o> -> jump back
- <C-i> -> jump forward
- ma -> set mark on a ; 'a -> jump back to mark a

---

### COMMANDS

- :w <CR> :!gcc % && ./a.out <CR> (save CompileandRun current code)
- :w <CR> :!gcc % -o %< && ./%< <CR> (save CompileandRun current code)
- echo "some Text" >> <some_file>
- visual-mode, select text, :sw, <some_file>, <CR> -> save selected text in <some_file>
- :r <some_file> -> paste the contents of this file

---

### HIGHLIGHTS

- :noh -> clear hilighting
- - -> highlight variable under cursor and all other and jumps to the next in the list

---

### VISUAL_LINE_MODE

- <c-v> to enter visual line mode
- changes on all lines take effect as soon as esc is entered
- <c-v> I -> insert at all line beginning
- <c-v> A -> append to all lines

- <,>norm I "<some_text>" -> insert at beginning
- <,>norm A "<some_text>" -> append at end

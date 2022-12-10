# [[VIMSETS]]

## Very useful sets for Markdown and Latex in Vim/Nvim

- vim.opt.conceallevel = 0 -> "nothing will be concealed"
- vim.opt.conceallevel = 1 -> "conceals special characters but not the space they take up"
- vim.opt.conceallevel = 2 -> "conceals special characters and the space they take up"

_boldening_ _italics_ etc are concealed, but not if you hover over them with your cursor.
This helps you immensely because you can see immediate effects without hindering your
ability to modify the code. Less things going taking up space on the screen, the better
you can uphold your overview over everything. This is extremely useful.

## Vimtex and snippets

To effectively write Latex in Vim you should download this plugin and preferably a snippet
manager to define your own snippets and write Latex faster. This will speed up your writing
ability tremendously and turn Latex and Vim into an extremely fast note taking duo

## Vim and Neovim, default keymaps

- gf -> open file command
- map gf :edit <cedit><cr> (opens the files even if is doesn't exist)

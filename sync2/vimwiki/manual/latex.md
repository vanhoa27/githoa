# How to get started with Latex

## Basic Syntax

- $ $ (Math_mode)
- $$ $$ (Math_mode but more display space)
- $ \left( \right) $ (makes brackets bigger)

- \section{Introduction} creates a numbered section
- \section{Introduction} creates unnumbered section

## Tidy up your writing

`latex
\beg{enumerate}  
 \item Hello
 \item World
\end{enumerate}`

- will format your writing
- _itemize_ will display dots
- _enumerate_ will display numbers

## Include graphics

`latex
\usepackage{graphicx}

\includegraphics[scale=0.5]{<image_name>}

- you could also use width instead of scale, but [] is optional

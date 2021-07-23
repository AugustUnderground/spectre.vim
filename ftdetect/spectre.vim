" Vim syntax file
" Language:     Spectre circuit simulator input netlist
" Maintainer:   Yannick Uhlmann (https://github.com/augustunderground)
" Last Change:  23-07-2021
" Comments:     Spectre is an advanced circuit simulator from Cadence Design
"               Systems that simulates analog and digital circuits at the
"               differential equation level.
"
" This is based on spectre.vim by Ahmed Nabil which is based on spice.vim by
" Noam Halevy

" detection for spectre netlist
au BufRead,BufNewFile *.scs set filetype=spectre

highlight clear ALEErrorSign
highlight clear ALEWarningSign

if $TERM=~'linux'
    syntax enable
    set t_Co=16
    colorscheme gotham
else
    syntax enable
    set t_Co=256
    set background=light
    colorscheme cobalt2
    highlight SpecialKey ctermbg=none cterm=none ctermfg=DarkGray
    highlight NonText ctermbg=none cterm=none ctermfg=DarkGray
    highlight ColorColumn ctermbg=235 guibg=#FFC600
endif

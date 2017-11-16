if $TERM=~'linux'
    " console
    syntax enable
    set t_Co=16
    colorscheme gotham
else
    syntax enable
    set t_Co=256
    set background=light
    colorscheme cobalt2

    " set t_Co=256
    " set background=light
    " colorscheme PaperColor
    " let g:PaperColor_Theme_Options = {
    "   \   'theme': {
    "   \     'default': {
    "   \       'transparent_background': 1
    "   \     }
    "   \   }
    "   \ }

    " " terminal emulator
    "
    " " syntax enable
    "
    " set t_Co=256
    " set background=dark
    " let base16colorspace=256
    " " colorscheme base16-phd
    " " colorscheme base16-eighties
    " colorscheme evening
    " " colorscheme base16-3024
    "
    " " set background=dark
    " " let g:solarized_termcolors=256
    " " let g:solarized_visiblility="low"
    " " colorscheme solarized
    "
    " " overrides
    highlight SpecialKey ctermbg=none cterm=none ctermfg=DarkGray
    highlight NonText ctermbg=none cterm=none ctermfg=DarkGray
    highlight ColorColumn ctermbg=235 guibg=#FFC600
    " " syntax reset

endif

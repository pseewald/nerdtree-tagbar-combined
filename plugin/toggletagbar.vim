function! s:ToggleNERDTreeAndTagbar()
    if exists('g:tagbar_left')
        let s:tagbar_left_user = g:tagbar_left
    else
        let s:tagbar_left_user = 0
    endif

    if exists('g:tagbar_vertical')
        let s:tagbar_vertical_user = g:tagbar_vertical
    else
        let s:tagbar_vertical_user = 0
    endif

    " settings required for split window nerdtree / tagbar
    let g:NERDTreeWinSize = max([g:tagbar_width, g:NERDTreeWinSize])
    let g:tagbar_left = 0
    let g:tagbar_vertical = winheight(0)/2

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let s:nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let s:nerdtree_open = 0
    endif
    let s:tagbar_open = bufwinnr('__Tagbar__') != -1

    " toggle tagbar & NERDTree
    if s:nerdtree_open && s:tagbar_open
        NERDTreeClose
        TagbarClose
    else
        if s:nerdtree_open
            NERDTreeClose
        elseif s:tagbar_open
            TagbarClose
        endif

        " remember buffer (actually, this is a hack, not sure if there is a
        " good way to do this)
        let b:NERDTreeAndTagbar_come_back_to_me = 1

        " open tagbar as split of nerdtree window
        NERDTree | TagbarOpen

        " go back to initial buffer
        while !exists('b:NERDTreeAndTagbar_come_back_to_me')
            wincmd w
        endwhile
        unlet b:NERDTreeAndTagbar_come_back_to_me
    endif

    " reset default / user configuration of tagbar
    let g:tagbar_left = s:tagbar_left_user
    let g:tagbar_vertical = s:tagbar_vertical_user
endfunction

command! -nargs=0 ToggleNERDTreeAndTagbar :call s:ToggleNERDTreeAndTagbar()

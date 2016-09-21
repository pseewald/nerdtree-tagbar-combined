function! s:ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1
    if exists('g:tagbar_left')
        let g:tagbar_user=g:tagbar_left
    else
        let g:tagbar_user=0
    endif
    let g:tagbar_left=1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose
    else
        if nerdtree_open
            NERDTreeClose
        elseif tagbar_open
            TagbarClose
        endif
        TagbarOpen
        NERDTree
    endif

    let g:tagbar_left=g:tagbar_user

endfunction
command! -nargs=0 ToggleNERDTreeAndTagbar :call s:ToggleNERDTreeAndTagbar()

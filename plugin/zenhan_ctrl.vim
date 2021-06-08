scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

if exists('g:zenhan_ctrl')
    finish
endif
let g:zenhan_ctrl = 1

if has('win32') || has('win32unix')
    let s:zenhan = 'zenhan++'

    augroup zenhan_ctrl
        autocmd!
        autocmd BufWinEnter * let b:ime_status = 0
        autocmd InsertEnter * if b:ime_status == 1 | let b:ime_status = system(s:zenhan . ' 1') | endif
        autocmd InsertLeave * let b:ime_status = system(s:zenhan . ' 0')
    augroup END
endif

let &cpo = s:save_cpo
unlet s:save_cpo

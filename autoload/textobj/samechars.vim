" ===============================================================
" textobj-samechars - Text objects for continuous characters
" Version: 0.0.1
" Author: tkhren
"
" License: So-called MIT/X license {{{
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
"
" The above copyright notice and this permission notice shall be included
" in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
" OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
" IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
" CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
" TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
" SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
" ===============================================================

"================================================================
" Select-x-function
"================================================================

function! s:select()
    let cur_pos = getpos('.')

    let cc = getline('.')[cur_pos[2] - 1]
    let pattern = escape(cc, '.^$[\') . '\+'

    let [lnum, cnum] = searchpos(pattern, 'ecW')
    if lnum == 0 || cur_pos[1] != lnum
        call setpos('.', cur_pos)
        return 0
    endif
    let end_pos = [0, lnum, cnum, 0]
    
    let [lnum, cnum] = searchpos(pattern, 'bcW')
    if lnum == 0 || cur_pos[1] != lnum
        call setpos('.', cur_pos)
        return 0
    endif
    let start_pos = [0, lnum, cnum, 0]
    
    if cur_pos[2] < start_pos[2] || cur_pos[2] > end_pos[2]
        call setpos('.', cur_pos)
        return 0
    endif

    return ['v', start_pos, end_pos]
endfunction

function! textobj#samechars#select_a()
    return s:select()
endfunction

function! textobj#samechars#select_i()
    return s:select()
endfunction


" vim: ft=vim fenc=utf-8 ff=unix foldmethod=marker:

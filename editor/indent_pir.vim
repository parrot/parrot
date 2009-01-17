" Description:  PIR indenter
" Author:   Andrew Rodland <arodland@entermail.net>
" Maintainer: Jimmy Zhuo <zhuomingliang@yahoo.com.cn>
" Last Change: 2009 Jan 16

" As usual, we want to be alone
if exists("b:did_indent")
    finish
endif
let b:did_indent=1

setlocal indentexpr=PIRIndent()
setlocal indentkeys=o,O,*<Return>,<bs>,:,=.end,0#

fun! InPOD(lnum)
    return synIDattr(synID(a:lnum, 1, 1), "name") =~? '^myPod$\|^pod[A-Z]'
endfun

fun! PIRIndent()
    let thisline = getline(v:lnum)

    let POD_START = '^=[a-z]'

    if thisline =~? POD_START
        return 0
    endif


    if InPOD(v:lnum)
        return -1
    endif

    let COMMENT = '^#'
    if thisline =~? COMMENT
        return 0
    endif

    let lnum=v:lnum
    while lnum > 0
        let lnum = prevnonblank(lnum-1)
        let prevline = getline(lnum)

        if prevline !~? COMMENT
            if !InPOD(lnum)
                break
            endif
        endif
    endwhile

    if lnum < 1
        return 0
    endif

    let ind = indent(lnum)

    let SUB = '^\s*\.pcc_sub\s\+\|^\s*\.sub\s\+\|^\s*\.macro\s\+'
    let RETURNBLOCK = '\s*\.begin_return\s*$'
    let END = '^\s*\.end\s*$\|^\s*\.end_return\s*\|^\s*\.endm$'
    let LABEL = '^\s*\k\+:'

    if prevline =~? SUB
        let ind = ind + &sw
    endif

    if prevline =~? RETURNBLOCK
        let ind = ind + &sw
    endif

    if prevline =~? LABEL
        let ind = ind + 2
    endif

    if thisline =~? END
        let ind = ind - &sw
    endif

    if thisline =~? LABEL
        let ind = ind - 2
    endif

    return ind

endfun



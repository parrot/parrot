; $Id$

; Generate driver and PAST for Eclectus

; Emit PIR that loads libs
(define (emit-init)
  (emit 
"

# EclectusBoolean is defined here
.loadlib 'eclectus_group'

.namespace

.sub '__onload' :init
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    load_bytecode 'PCT.pbc'
.end
" ) )

; emit PIR that prints the value returned by scheme_entry()
(define (emit-driver)
  (emit 
"
.sub drive :main

    .local pmc val_x
    ( val_x ) = scheme_entry()
    # _dumper( val_x, 'val_x' )

    .local pmc var_last
    var_last = new 'PAST::Var'
    var_last.init( 'name' => 'last', 'scope' => 'package', 'lvalue' => 1 )
               
    .local pmc op_bind
    op_bind = new 'PAST::Op'
    op_bind.init( var_last, val_x, 'pasttype' => 'bind' )
           
    .local pmc op_say
    op_say = new 'PAST::Op'
    op_say.init( op_bind, 'name' => 'say', 'pasttype' => 'call' )

    .local pmc stmts
    stmts = new 'PAST::Stmts'
    stmts.'init'( op_say, 'name'=>'stmts' )

    # compile to PIR and display
    .local pmc astcompiler
    astcompiler = new [ 'PCT::HLLCompiler' ]
    astcompiler.'removestage'('parse')
    astcompiler.'removestage'('past')

    astcompiler.'eval'(stmts)

.end
" ))

; emit the PIR library
(define (emit-builtins)
  (emit
"
.sub 'say'
    .param pmc args :slurpy
    if null args goto end
    .local pmc iter
    iter = new 'Iterator', args
  loop:
    unless iter goto end
    $P0 = shift iter
    print $P0
    goto loop
  end:
    say ''
    .return ()
.end
"))

; forms represented by a scalar PMC
(define (immediate? x)
  (or (fixnum? x) (boolean? x)))

(define (immediate-rep x)
  (cond
     [(fixnum? x) (format
"
    val_x = new 'PAST::Val'
    val_x.init( 'value' => ~a, 'returns' => 'Integer' )
" x )]
     [else 
"
    val_x = new 'PAST::Val'
    val_x.init( 'value' => 1, 'returns' => 'EclectusBoolean' )
"]))

; the actual compiler
( define (compile-program x)
  (emit-init)
  (emit-driver)
  (emit-builtins)

  (emit 
"
.sub scheme_entry
    .local pmc val_x
")
  (if (immediate? x)
    (emit (immediate-rep x))) 

   (emit
"
    .return ( val_x )
.end
"))

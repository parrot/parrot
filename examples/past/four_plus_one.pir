# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A PIR module which sets up a PAST data structure to represent a sub
and, then, execute it.

=cut

# Set up a PAST data structure that represents a sub and run it.

# code for (assuming package scoped variables)
# { say( 4 + 1 ); }

# a dump of the PAST looks like this:

=for example

"stmts" => PMC ['PAST';'Stmts']  {
    <source> => "4 + 1\n"
    <pos> => 0
    [0] => PMC ['PAST';'Op']  {
        <name> => "say"
        <pasttype> => "call"
        [0] => PMC ['PAST';'Op']  {
            <pasttype> => "bind"
            [0] => PMC ['PAST';'Var']  {
                <name> => "last"
                <scope> => "package"
                <lvalue> => 1
            }
            [1] => PMC ['PAST';'Op']  {
                <name> => "infix:+"
                <pasttype> => undef
                <pirop> => "add"
                <lvalue> => undef
                <source> => "+"
                <pos> => 2
                [0] => PMC ['PAST';'Val']  {
                    <value> => "4"
                    <returns> => "Integer"
                    <source> => "4"
                    <pos> => 0
                }
                [1] => PMC ['PAST';'Val']  {
                    <value> => "1"
                    <returns> => "Integer"
                    <source> => "1"
                    <pos> => 4
                }
            }
        }
    }
}

=cut

.namespace []

.sub '__onload' :init
    load_bytecode "dumper.pbc"
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    load_bytecode 'PCT.pbc'
.end

.sub main :main

    .local pmc val_4
    val_4 = new ['PAST';'Val']
    val_4.'init'( 'value' => '4', 'returns' => 'Integer' )

    .local pmc val_1
    val_1 = new ['PAST';'Val']
    val_1.'init'( 'value' => '1', 'returns' => 'Integer' )

    .local pmc op_add
    op_add = new ['PAST';'Op']
    op_add.'init'( val_4, val_1, 'name' => 'infix:+', 'pirop' => 'add' )

    .local pmc var_last
    var_last = new ['PAST';'Var']
    var_last.'init'( 'name' => 'last', 'scope' => 'package', 'lvalue' => 1 )

    .local pmc op_bind
    op_bind = new ['PAST';'Op']
    op_bind.'init'( var_last, op_add, 'pasttype' => 'bind' )

    .local pmc op_say
    op_say = new ['PAST';'Op']
    op_say.'init'( op_bind, 'name' => 'say', 'pasttype' => 'call' )

    .local pmc stmts
    stmts = new ['PAST';'Stmts']
    stmts.'init'( op_say, 'name'=>'stmts' )

    # compile to PIR and display
    .local pmc astcompiler
    astcompiler = new [ 'PCT';'HLLCompiler' ]
    astcompiler.'removestage'('parse')
    astcompiler.'removestage'('past')

    astcompiler.'eval'(stmts)

   # _dumper( stmts, 'stmts' )
   # _dumper( astcompiler, 'astcompiler' )

   # .local pmc ost
   # ost = astcompiler.'post'(stmts)
   # _dumper( ost, 'ost' )

   # .local pmc pir
   # pir = astcompiler.'pir'(ost)
   # _dumper( pir, 'pir' )
   # say pir

.end


.sub 'say'
    .param pmc args :slurpy
    if null args goto end
    .local pmc it
    it = iter args
  loop:
    unless it goto end
    $P0 = shift it
    print $P0
    goto loop
  end:
    print "\n"
    .return ()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

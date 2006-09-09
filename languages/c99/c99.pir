=head1 NAME

c99 -- A parser for c99 

=head1 SYNOPSIS

  $ ./parrot languages/c99/c99.pir code.c

=head1 DESCRIPTION

  c99 is a PGE parser running on Parrot.

=cut

.HLL 'c99', 'c99_group'
.include 'errors.pasm'
.include 'library/dumper.pir'

.sub _main :main
    .param pmc args
    
    errorson .PARROT_ERRORS_PARAM_COUNT_FLAG
    
    load_bytecode 'PGE.pbc'
    load_bytecode 'dumper.pbc'
    load_bytecode 'PGE/Dumper.pbc'
    load_bytecode 'PGE/Text.pbc'
    load_bytecode 'Getopt/Obj.pbc'
    
    print "Hello World from c99\n"
.end

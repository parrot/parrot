#! perl
# Copyright (C) 2001-2006, Parrot Foundation.

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 2;
use Parrot::Test::PGE;

=head1 NAME

t/library/pge_examples.t

=head1 SYNOPSIS

    % prove t/compilers/pge/pge_examples.t

=head1 DESCRIPTION

Parrot Grammar Engine tests of examples

=cut

# 1
pir_output_is( <<'CODE', <<'OUT', "This made Parrot m4 fail" );

.sub 'test' :main
  load_bytecode "PGE.pbc"

  .local pmc p6rule
  p6rule = compreg "PGE::Perl6Regex"

  .local pmc rulesub_a, rulesub_b
  rulesub_a  = p6rule( "a" )
  rulesub_b  = p6rule( "^(<[b]>)" )

  .local string input_string
  input_string    = "_____________________________________________________________________"

  rulesub_b( input_string )

  print "ok1\n"
  # end

  rulesub_a( input_string )
  print "ok2\n"

.end

CODE
ok1
ok2
OUT

# 2
pir_output_is( <<'CODE', <<'OUT', "parse FASTA" );

# Grok fasta files, which usually contain DNA, RNA or protein sequences.
# http://en.wikipedia.org/wiki/FASTA_format

.sub "example" :main
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Perl6Grammar.pbc'

    .local string fasta_grammar
    fasta_grammar = <<'END_FASTA_GRAMMAR'
grammar Bio::Fasta;

regex databank    { <Bio::Fasta::entry>+ }
regex entry       { <Bio::Fasta::desc_line> \n <Bio::Fasta::sequence> }
regex desc_line   { <Bio::Fasta::start_entry> <Bio::Fasta::id> \s+ <Bio::Fasta::desc> }
regex start_entry { \> }
regex id          { (\S+) }
regex desc        { (\N*) }
regex sequence    { (<-[>]>*) }

END_FASTA_GRAMMAR

    .local string fasta
    fasta = <<'END_FASTA'
>gi|5524211|gb|AAD44166.1| cytochrome b [Elephas maximus maximus]
LCLYTHIGRNIYYGSYLYSETWNTGIMLLLITMATAFMGYVLPWGQMSFWGATVITNLFSAIPYIGTNLV
EWIWGGFSVDKATLNRFFAFHFILPFTMVALAGVHLTFLHETGSNNPLGLTSDSDKIPFHPYYTIKDFLG
LLILILLLLLLALLSPDMLGDPDNHMPADPLNTPLHIKPEWYFLFAYAILRSVPNKLGGVLALFLSIVIL
GLMPFLHTSKHRSMMLRPLSQALFWTLTMDLLTLTWIGSQPVEYPYTIIGQMASILYFSIILAFLPIAGX
IENY
>poly_a teasing the parser with DNA
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
END_FASTA

    .local pmc p6grammar
    p6grammar = compreg "PGE::Perl6Grammar"
    .local pmc code
    ( code ) = p6grammar.'compile'(fasta_grammar, 'target'=>'PIR')
    $P0 = compreg 'PIR'
    $P1 = $P0(code)
    $P1 = $P1.'first_sub_in_const_table'()
    $P1()
    # print code

    .local pmc fasta_rule
    fasta_rule = get_global ['Bio';'Fasta'], "databank"
    .local pmc match
    ( match ) = fasta_rule( fasta )

    # TODO: Extract named or positional captures
    print match

.end

CODE
>gi|5524211|gb|AAD44166.1| cytochrome b [Elephas maximus maximus]
LCLYTHIGRNIYYGSYLYSETWNTGIMLLLITMATAFMGYVLPWGQMSFWGATVITNLFSAIPYIGTNLV
EWIWGGFSVDKATLNRFFAFHFILPFTMVALAGVHLTFLHETGSNNPLGLTSDSDKIPFHPYYTIKDFLG
LLILILLLLLLALLSPDMLGDPDNHMPADPLNTPLHIKPEWYFLFAYAILRSVPNKLGGVLALFLSIVIL
GLMPFLHTSKHRSMMLRPLSQALFWTLTMDLLTLTWIGSQPVEYPYTIIGQMASILYFSIILAFLPIAGX
IENY
>poly_a teasing the parser with DNA
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

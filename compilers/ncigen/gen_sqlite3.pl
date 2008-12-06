#!/home/tewk/srcs/parrot/perl6

# $Id$
# Copyright (C) 2008, The Perl Foundation.

use v6;
use NCIGENP6;

my $fn = @*ARGS[0];

print gen_preamble("SQLite3", "sqlite3");

my %rename_table = (
    'open'          => 'open_raw',
    'prepare_v2'    => 'prepare_raw',
);

for (parse_ast($fn).kv) -> $k,$v {
    #dump_node($v);
    if ($v.WHAT eq "FuncDecl") {
        my @result = pir($v);
        my $suffix_name = @result[0];
        my $suffix_name .= subst( /sqlite3_/, '' );

        my $pirname = %rename_table{$suffix_name} || $suffix_name;
        
        say format_func_decl($pirname, |@result);
    }
}

say gen_postamble();

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:


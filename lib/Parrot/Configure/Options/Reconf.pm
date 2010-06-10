# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$

package Parrot::Configure::Options::Reconf;

use strict;
use warnings;
use base qw( Exporter );
our @EXPORT_OK = qw(
    @valid_options
    $script
    %options_components
);

our @valid_options = qw{
    ask
    debugging
    help
    lex
    maintainer
    step
    target
    verbose
    yacc
};

our $script = q{tools/dev/reconfigure.pl};

my %short_circuits = ( help => \&print_help, );

our %options_components = (
    'valid_options'  => \@valid_options,
    'script'         => $script,
    'short_circuits' => \%short_circuits,
    'conditionals'   => \&conditional_assignments,
);

sub conditional_assignments {
    my $argsref = shift;
    $argsref->{debugging} = 1
        unless ( ( exists $argsref->{debugging} ) && !$argsref->{debugging} );
    $argsref->{maintainer} = 1
        if defined $argsref->{lex}
            or defined $argsref->{yacc};
    return $argsref;
}

sub print_help {
    print <<"EOT";
$script

General Options:

   --help               Show this text
   --verbose            Output extra information
   --step=(gen::makefiles)
                        Execute a single configure step
   --target=(Makefile)  Regenerate a specific makefile

   --ask                Have Configure ask for commonly-changed info

Compile Options:

   --debugging=0        Disable debugging, default = 1
   --lex=(lexer)        Use the given lexical analyzer generator
   --yacc=(parser)      Use the given parser generator
EOT
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

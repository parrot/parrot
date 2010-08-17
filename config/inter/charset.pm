# Copyright (C) 2001-2003, Parrot Foundation.
# $Id$

=head1 NAME

config/inter/charset.pm - charset files

=head1 DESCRIPTION

Asks the user to select which charset files to include.

=cut

package inter::charset;

use strict;
use warnings;

use File::Basename qw/basename/;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':inter';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Which charset files should be compiled in};
    $data{result}      = q{};
    return \%data;
}

my @charsets_defaults =
    defined( $ENV{TEST_CHARSET} )
    ? $ENV{TEST_CHARSET}
    : sort map { basename($_) } glob "./src/string/charset/*.c";

sub runstep {
    my ( $self, $conf ) = @_;

    my @charset = @charsets_defaults;

    my $charset_list = join ( ' ', grep { defined $_ } @charset );

    if ( $conf->options->get('ask') ) {
        print <<"END";


The following charsets are available:
  @charset
END
        $charset_list = prompt(
            'Which charsets would you like?',
            $charset_list
        );
    }

    # names of class files for src/pmc/Makefile
    ( my $TEMP_charset_o = $charset_list ) =~ s/\.c/\$(O)/g;

    my $TEMP_charset_build = <<"E_NOTE";

# the following part of the Makefile was built by 'config/inter/charset.pm'

E_NOTE

    foreach my $charset ( split( /\s+/, $charset_list ) ) {
        $charset =~ s/\.c$//;
        $TEMP_charset_build .= <<END
src/string/charset/$charset\$(O): src/string/charset/$charset.h src/string/charset/ascii.h src/string/charset/$charset.c src/string/charset/tables.h \$(NONGEN_HEADERS)


END
    }

    # build list of libraries for link line in Makefile
    $TEMP_charset_o =~ s{^| }{ src/string/charset/}g;

    $conf->data->set(
        charset            => $charset_list,
        TEMP_charset_o     => $TEMP_charset_o,
        TEMP_charset_build => $TEMP_charset_build,
    );

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

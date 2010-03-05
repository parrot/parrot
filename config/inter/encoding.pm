# Copyright (C) 2001-2003, Parrot Foundation.
# $Id$

=head1 NAME

config/inter/encoding.pm - encoding files

=head1 DESCRIPTION

Asks the user to select which encoding files to include.

=cut

package inter::encoding;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use File::Basename qw/basename/;

use Parrot::Configure::Utils ':inter';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Which encoding files should be compiled in};
    $data{result}      = q{};
    return \%data;
}

my @encodings_defaults =
    defined( $ENV{TEST_ENCODING} )
    ? $ENV{TEST_ENCODING}
    : sort map { basename($_) } glob "./src/string/encoding/*.c";

sub runstep {
    my ( $self, $conf ) = @_;

    my @encodings = @encodings_defaults;

    my $encoding_list = join( ' ', grep { defined $_ } @encodings );

    if ( $conf->options->get('ask') ) {
        print <<"END";


The following encodings are available:
  @encodings
END
        $encoding_list = prompt(
            'Which encodings would you like?',
            $encoding_list
        );
    }

    # names of class files for src/pmc/Makefile
    ( my $TEMP_encoding_o = $encoding_list ) =~ s/\.c/\$(O)/g;

    my $TEMP_encoding_build = <<"E_NOTE";

# the following part of the Makefile was built by 'config/inter/encoding.pm'

E_NOTE

    foreach my $encoding ( split( /\s+/, $encoding_list ) ) {
        $encoding =~ s/\.c$//;
        $TEMP_encoding_build .= <<END
src/string/encoding/$encoding\$(O): src/string/encoding/$encoding.h src/string/encoding/$encoding.c src/string/unicode.h \$(NONGEN_HEADERS)


END
    }

    # build list of libraries for link line in Makefile
    $TEMP_encoding_o =~ s{^| }{ src/string/encoding/}g;

    $conf->data->set(
        encoding            => $encoding_list,
        TEMP_encoding_o     => $TEMP_encoding_o,
        TEMP_encoding_build => $TEMP_encoding_build,
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

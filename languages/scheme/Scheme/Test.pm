# $Id$

package Scheme::Test;

use strict;
use vars qw(@EXPORT @ISA);
use lib '../lib';
use Parrot::Config;

require Exporter;
require Parrot::Test;

@EXPORT = ( qw(output_is output_like output_isnt), @Test::More::EXPORT );
@ISA = qw(Exporter Test::More);

sub import {
    my( $class, $plan, @args ) = @_;

    Test::More->import( $plan, @args );

    __PACKAGE__->_export_to_level( 2, __PACKAGE__ );
}

my $count;

foreach my $i ( qw(is isnt like) ) {
    no strict 'refs';

    *{"Scheme::Test::output_$i"} = sub ($$;$) {
        my( $assembly, $output, $desc ) = @_;

        ++$count;
        my( $scheme_f, $as_f, $by_f, $out_f ) = map { # JMG
            my $t = $0; $t =~ s/\.t$/$count\.$_/; $t
        } ( qw(scheme pasm pbc out) ); # JMG

        # STDERR is written into same output file
        open SCHEME, "> $scheme_f" or die "Unable to open '$scheme_f'"; # JMG
        binmode SCHEME; # JMG
        print SCHEME $assembly; # JMG
        close SCHEME; # JMG

        Parrot::Test::run_command( 
            "$PConfig{perl} languages/scheme/schemec languages/$scheme_f",
            CD => '..', # $self->{relpath}, 
            STDOUT => $as_f, STDERR => $as_f,
        );
        Parrot::Test::run_command( 
            "./parrot languages/$as_f",
            CD => '..', # $self->{relpath}, 
            STDOUT => $out_f, STDERR => $out_f, 
        );
        my $prog_output = Parrot::Test::slurp_file( "$out_f" );

        @_ = ( $prog_output, $output, $desc );
        #goto &{"Test::More::$i"};
        my $ok = &{"Test::More::$i"}( @_ );
        # if( $ok ) { foreach my $i ( $scheme_f, $as_f, $by_f, $out_f ) { unlink $i } } # JMG
    }
}

1;

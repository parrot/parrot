# $Id$

package Scheme::Test;

use strict;
use vars qw(@EXPORT @ISA);

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

foreach my $meth ( qw(is isnt like) ) {
    no strict 'refs';

    *{"Scheme::Test::output_$meth"} = sub ($$;$) {
        my( $lang_code, $output, $desc ) = @_;

        ++$count;
        my( $lang_f, $pasm_f, $by_f, $out_f ) = map { # JMG
            my $t = $0; $t =~ s/\.t$/_$count\.$_/; $t
        } ( qw(scheme pasm pbc out) ); # JMG

        # STDERR is written into same output file
        open LANG, ">", "$lang_f" or die "Unable to open '$lang_f'"; # JMG
        binmode LANG; # JMG
        print LANG $lang_code; # JMG
        close LANG; # JMG

        Parrot::Test::run_command( 
            "$PConfig{perl} languages/scheme/schemec languages/$lang_f",
            CD => '..', # $self->{relpath}, 
            STDOUT => $pasm_f, STDERR => $pasm_f,
        );
        Parrot::Test::run_command( 
            "./parrot languages/$pasm_f",
            CD => '..', # $self->{relpath}, 
            STDOUT => $out_f, STDERR => $out_f, 
        );
        my $prog_output = Parrot::Test::slurp_file( "$out_f" );

        @_ = ( $prog_output, $output, $desc );
        #goto &{"Test::More::$meth"};
        my $ok = &{"Test::More::$meth"}( @_ );
        # if( $ok ) { foreach my $meth ( $lang_f, $pasm_f, $by_f, $out_f ) { unlink $meth } } # JMG
    }
}

1;

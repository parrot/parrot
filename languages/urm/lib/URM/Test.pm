# $Id$

package URM::Test;

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

    *{"URM::Test::output_$meth"} = sub {
        my( $lang_code, $output, $desc, @other ) = @_;

        ++$count;
        my( $lang_f, $pasm_f, $by_f, $out_f ) = map { # JMG
            my $t = $0; $t =~ s/\.t$/_$count\.$_/; $t
        } ( qw(urm pasm pbc out) ); # JMG

        # STDERR is written into same output file
        open LANG, "> $lang_f" or die "Unable to open '$lang_f'"; # JMG
        binmode LANG; # JMG
        print LANG $lang_code; # JMG
        close LANG; # JMG

        Parrot::Test::run_command( 
            "$PConfig{perl} languages/urm/urmc -s languages/$lang_f",
            CD => '..', # $self->{relpath}, 
            STDOUT => $pasm_f, STDERR => $pasm_f,
        );
        Parrot::Test::run_command( 
            "./parrot languages/$pasm_f @other",
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

my $urmc = "$PConfig{perl} $FindBin::RealBin$PConfig{slash}..$PConfig{slash}urmc";
my $compile = "-c -s";
my $run = "-s";

sub compile_test {
    my $file = shift;

    my $ret = system ("$urmc $compile $FindBin::RealBin$PConfig{slash}$file");
    if ($ret) {
	print STDERR "TEST FAILED: $file ($ret)\n";
	return;
	}
    print "OK: $file\n";
}

sub run_test {
    my ($file, $expect) = @_;
    my $ret = `$urmc $run $FindBin::RealBin$PConfig{slash}$file`;
    if (!$ret) {
	print STDERR "TEST FAILED: $file didn't return a value, Parrot crashed?\n";
	return;
    }
    if ($ret != $expect) {
	print STDERR "TEST FAILED: $file (got $ret expected $expect)\n";
	return;
    }
    print "OK: $file\n";
}

# Copyright: 2001-2006 The Perl Foundation.  All Rights Reserved.
# $Id: auto.pm 2 2006-05-24 14:46:19Z svm $

=head1 NAME

config/auto/cpu/sun4/auto.pm

=head1 DESCRIPTION

Test

=cut

package auto::cpu::sun4::auto;

use strict;
use warnings;

use Parrot::Configure::Step qw(cc_gen cc_build cc_run cc_clean);

sub build_asm {
    my ($self, $conf) = @_;
    my $file = 'src/atomic/sparc_v9.s';
    my $successp;

    # borrowed from cc_build
    my ($cc, $ccflags, $ldout, $o, $link, $linkflags, $cc_exe_out, $exe, $libs) = 
	$conf->data->get(qw(cc ccflags ld_out o link linkflags cc_exe_out exe libs));
    
    
    $successp = Parrot::Configure::Step::_run_command(
	    "$cc -c $ccflags -I./include -o sparcasm$o $file", 'test.cco', 'test.cco', 
		    $conf->options->get('verbose'));
		    
    return $successp;
}

sub cleanup {
    my ($self, $conf) = @_;
    unlink "sparcasm" . $conf->data->get('o');
}

sub runstep
{
    my ($self, $conf) = @_;

    my $verbose = $conf->options->get('verbose');

    build_asm($self, $conf);

    my @files = qw( test_atomic.in );
    for my $f (@files) {
        print " $f " if $verbose;
        my ( $suffix ) = $f =~ /test_(\w+)/;
        $f = "config/auto/cpu/sun4/$f";
        cc_gen($f);
        eval {cc_build("-DPARROT_CONFIG_TEST", "sparcasm" . $conf->data->get('o'))};
        if ($@) {
            print " $@ " if $verbose;
        } else {
            if (cc_run() =~ /ok/) {
                $conf->data->set(
                    "sparc_has_$suffix" => '1',
                    "HAS_SPARC_$suffix" => '1',
                );
                print " (\U$suffix) " if ($verbose);
                $conf->data->add(' ', TEMP_atomic_o => 'src/atomic/sparc_v9.o');
            }
        }
        cc_clean();
    }

    cleanup($self, $conf);
}

1;

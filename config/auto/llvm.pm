# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/llvm - Check whether the Low Level Virtual Machine is present

=head1 DESCRIPTION

Determines whether the Low Level Virtual Machine (LLVM) is installed and
functional on the system.  It is OK when it
doesn't exist.

=cut

package auto::llvm;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Is LLVM installed};
    $data{result}      = q{};
    $data{llvm_components} = [
        [ 'llvm-gcc'    => 'llvm-gcc' ],
        [ 'lli'         => 'Low Level Virtual Machine' ],
        [ 'llc'         => 'Low Level Virtual Machine' ],
    ];
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $verbose = $conf->options->get( 'verbose' );

    my $llvm_lacking = 0;
    foreach my $prog ( @{ $self->{llvm_components} } ) {
        my $output = capture_output( $prog->[0], '--version' );
        my $exp = $prog->[1];
        unless ( defined($output) and $output =~ m/$exp/s ) {
            $llvm_lacking++;
            print "Could not get expected '--version' output for $prog->[0]\n"
                if $verbose;
        }
        else {
            print $output, "\n" if $verbose;
        }
    }
    my $output = q{};
    $output = capture_output( 'llvm-gcc', '--version' );
    if (! $output) {
        $llvm_lacking++;
    }
    else {
        my @line = split /\n+/, $output;
        if ( $line[0] =~ m/\b(\d+)\.(\d+)\.(\d+)\b/ ) {
            my @version = ($1, $2, $3);
            if ($version[0] < 4) {
                print "llvm-gcc must be at least major version 4\n"
                    if $verbose;
                $llvm_lacking++;
            }
        }
        else {
            print "Unable to extract llvm-gcc major, minor and patch versions\n"
                if $verbose;
            $llvm_lacking++;
        }
    }
            
    if ( $llvm_lacking ) {
        $self->_handle_result( $conf, 0 );
    }
    else {

        # Here we will take a simple C file, compile it into an LLVM bitcode
        # file, execute it as bitcode, then compile it to native assembly
        # using the LLC code generator, then assemble the native assembly
        # language file into a program and execute it.  Cf.:
        # http://llvm.org/releases/2.5/docs/GettingStarted.html#overview

        my $stem = q|hello|;
        my $cfile = qq|$stem.c|;
        my $fullcfile = qq|config/auto/llvm/$cfile|;
        my $bcfile = qq|$stem.bc|;
        my $sfile = qq|$stem.s|;
        my $nativefile = qq|$stem.native|;
        eval {
            system(qq{llvm-gcc -O3 -emit-llvm $fullcfile -c -o $bcfile});
        };
        if ($@) {
            print "Unable to compile C file into LLVM bitcode file\n"
                if $verbose;
            $self->_handle_result( $conf, 0 );
        }
        else {
            my $output;
            eval {
                $output = capture_output( 'lli', $bcfile );
            };
            if ( $@ or $output !~ /hello world/ ) {
                print "Unable to into LLVM bitcode file with 'lli'\n"
                    if $verbose;
                $self->_handle_result( $conf, 0 );
            }
            else {
                eval {
                    system(qq{llc $bcfile -o $sfile});
                };
                if ( $@ or (! -e $sfile) ) {
                    print "Unable to compile program to native assembly using 'llc'\n"
                        if $verbose;
                    $self->_handle_result( $conf, 0 );
                }
                else {
                    eval {
                        system(qq{cc $sfile -o $nativefile});
                    };
                    if ( $@ or (! -e $nativefile) ) {
                        print "Unable to assemble native assembly into program\n"
                            if $verbose;
                        $self->_handle_result( $conf, 0 );
                    }
                    else {
                        eval {
                            $output = capture_output(qq{./$nativefile});
                        };
                        if ( $@ or ( $output !~ q/hello world/) ) {
                            print "Unable to execute native assembly program successfuly\n"
                                if $verbose;
                            $self->_handle_result( $conf, 0 );
                        }
                        else {
                            $self->_handle_result( $conf, 1 );
                        }
                    }
                }
            }
        }
        foreach my $f ( $bcfile, $sfile, $nativefile ) {
          unlink $f if ( -e $f );
        }
    }

    return 1;
}

sub _handle_result {
    my ($self, $conf, $result) = @_;
    if ( $result ) {
        $self->set_result('yes');
        $conf->data->set( has_llvm => 1 );
    }
    else {
        $self->set_result('no');
        $conf->data->set( has_llvm => '' );
    }
    return 1;
}
1;

=head1 AUTHOR

James E Keenan

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:


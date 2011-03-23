# Copyright (C) 2009, Parrot Foundation.

=head1 NAME

config/auto/llvm - Check whether the Low Level Virtual Machine is present

=head1 DESCRIPTION

Determines whether the Low Level Virtual Machine (LLVM) is installed and
functional on the system.  It is OK when it doesn't exist.

=cut

package auto::llvm;
use strict;
use warnings;
use base qw(Parrot::Configure::Step);
use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Is minimum version of LLVM installed};
    $data{result}      = q{};
    $data{'llvm-gcc'} = {
        head => 'llvm-gcc',
        min_version => 4,
    };
    $data{llvm_components} = {
        'lli'         => {
            head => 'Low Level Virtual Machine',
            min_version => '2.7',
        },
        'llc'         => {
            head => 'Low Level Virtual Machine',
            min_version => '2.7',
        },
    };
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $verbose = $conf->options->get( 'verbose' );

    # We will run various tests which, if they show that we don't have what we
    # need for LLVM, will return 0.  If the return value is 0, we will
    # set_result to 'no', set 'has_llvm' to '', then return from runstep()
    # with a value of 1.  If a given step does not rule out LLVM, we will
    # proceed to the next step.
    my $rv = '';

    # First, we make sure we have at least major version 4 of 'llvm-gcc'
    $rv = $self->_examine_llvm_gcc_version( $conf, $verbose );
    if (! $rv) {
        $conf->cc_clean();
        return 1;
    }

    # Next, we see whether we can run each of two LLVM component executables:
    # 'lli' and 'llc'.  Even if we can run them, we will need at least version
    # 2.7 of LLVM.

    foreach my $prog ( keys %{ $self->{llvm_components} } ) {
        $rv = $self->_examine_llvm_component_version( $conf, $verbose, $prog );
        if (! $rv) {
            $conf->cc_clean();
            return 1;
        }
    }

    # Having gotten this far,  we will take a simple C file, compile it into
    # an LLVM bitcode file, execute it as bitcode, then compile it to native
    # assembly using the LLC code generator, then assemble the native assembly
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
        $rv = $self->_handle_failure_to_compile_into_bitcode(
            $conf,
            $verbose,
        );
        if (! $rv) {
            $conf->cc_clean();
            return 1;
        }
    }
    else {
        my $output;
        eval {
            $output = capture_output( 'lli', $bcfile );
        };
        if ( $@ or $output !~ /hello world/ ) {
            $rv = $self->_handle_failure_to_execute_bitcode( $conf, $verbose );
            if (! $rv) {
                $conf->cc_clean();
                return 1;
            }
        }
        else {
            eval {
                system(qq{llc $bcfile -o $sfile});
            };
            if ( $@ or (! -e $sfile) ) {
                $rv = $self->_handle_failure_to_compile_to_assembly(
                    $conf,
                    $verbose,
                );
                if (! $rv) {
                    $conf->cc_clean();
                    return 1;
                }
            }
            else {
                eval {
                    my $cc = $conf->data->get('cc');
                    system(qq{$cc $sfile -o $nativefile});
                };
                if ( $@ or (! -e $nativefile) ) {
                    $rv = $self->_handle_failure_to_assemble_assembly(
                        $conf,
                        $verbose,
                    );
                    if (! $rv) {
                        $conf->cc_clean();
                        return 1;
                    }
                }
                else {
                    eval {
                        $output = capture_output(qq{./$nativefile});
                    };
                    $self->_handle_native_assembly_output(
                        $conf, $output, $verbose
                    );
                }
           }
        }
    }

    my $count_unlinked = _cleanup_llvm_files(
        $bcfile, $sfile, $nativefile
    );
    $conf->cc_clean();
    return 1;
}

sub _examine_llvm_gcc_version {
    my ($self, $conf, $verbose ) = @_;
    my $output = capture_output(
        $self->{'llvm-gcc'}->{head},
        '--version',
    );
    if (! $output) {
        $self->_handle_result( $conf, 0 );
        return 0;
    }
    else {
        my @line = split /\n+/, $output;
        my @version;
        if ( $line[0] =~ m/\b(\d+)\.(\d+)\.(\d+)\b/ ) {
            @version = ($1, $2, $3);
            if ($version[0] < $self->{'llvm-gcc'}->{min_version}) {
                print "'llvm-gcc' must be at least major version $self->{llvm_components}->{'llvm-gcc'}->{min_version}\n"
                    if $verbose;
                $self->_handle_result( $conf, 0 );
                return 0;
            }
        }
        else {
            print "Unable to extract llvm-gcc major, minor and patch versions\n"
                if $verbose;
            $self->_handle_result( $conf, 0 );
            return 0;
        }
        if ($verbose) {
            print "Found 'llvm-gcc' version ";
            print join('.' => @version), "\n";
        }
    }
    return 1;
}

sub _examine_llvm_component_version {
    my $self = shift;
    my ( $conf, $verbose, $prog ) = @_;
    my $output = capture_output( $prog, '--version' );
    if (! $output) {
        $self->_handle_result( $conf, 0 );
        return 0;
    }
    else {
        my $version;
        if ( $output =~ m/llvm\sversion\s(\d+\.\d+)/s ) {
            $version = $1;
            if ($version < $self->{llvm_components}->{$prog}->{min_version}) {
                if ($verbose) {
                    my $msg = "LLVM component '$prog' must be at least version ";
                    $msg .= "$self->{llvm_components}->{$prog}->{min_version};";
                    $msg .= " found version $version\n";
                    print $msg;
                }
                $self->_handle_result( $conf, 0 );
                return 0;
            }
            else {
                if ($verbose) {
                    print "Found '$prog' version $version\n";
                }
            }
        }
        else {
            print "Unable to extract version for LLVM component '$prog'\n"
                if $verbose;
            $self->_handle_result( $conf, 0 );
            return 0;
        }
    }
    return 1;
}

sub _handle_failure_to_compile_into_bitcode {
    my ($self, $conf, $verbose ) = @_;
    print "Unable to compile C file into LLVM bitcode file\n"
        if $verbose;
    $self->_handle_result( $conf, 0 );
    return 0;
}

sub _handle_failure_to_execute_bitcode {
    my ($self, $conf, $verbose ) = @_;
    print "Unable to run LLVM bitcode file with 'lli'\n"
        if $verbose;
    $self->_handle_result( $conf, 0 );
}

sub _handle_failure_to_compile_to_assembly {
    my ($self, $conf, $verbose ) = @_;
    print "Unable to compile program to native assembly using 'llc'\n"
        if $verbose;
    $self->_handle_result( $conf, 0 );
}

sub _handle_failure_to_assemble_assembly {
    my ($self, $conf, $verbose ) = @_;
    print "Unable to assemble native assembly into program\n"
         if $verbose;
    $self->_handle_result( $conf, 0 );
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

sub _handle_native_assembly_output {
    my ($self, $conf, $output, $verbose) = @_;
    if ( $@ or ( $output !~ /hello world/ ) ) {
        print "Unable to execute native assembly program successfully\n"
            if $verbose;
        $self->_handle_result( $conf, 0 );
    }
    else {
        $self->_handle_result( $conf, 1 );
    }
}

sub _cleanup_llvm_files {
   my @llvm_files = @_;
   my $count_unlinked = 0;
   foreach my $f ( @llvm_files ) {
      if ( defined($f) and ( -e $f ) ) {
          unlink $f;
          $count_unlinked++;
      }
   }
   return $count_unlinked;
};

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


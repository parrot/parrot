# Copyright (C) 2009-2011, Parrot Foundation.

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
    $data{description}      = q{Is minimum version of LLVM installed};
    $data{result}           = q{};
    $data{lli_min_version}  = 2.7;
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $verbose = $conf->options->get( 'verbose' );
    my $llvm_config = $conf->options->get( 'llvm-config' ) || 'llvm-config';

    # We will run various probes for LLVM.  If the probes are unsuccessful, we
    # will set_result to 'no', set 'has_llvm' to '', then return from
    # runstep() with a value of 1.  If a given probe does not rule out LLVM,
    # we will proceed onward.

    my $llvm_bindir = capture_output( "$llvm_config --bindir" ) || '';
    chomp $llvm_bindir;
    if (! $llvm_bindir ) {
        print "Unable to find directory for 'llvm-config' executable\n"
            if $verbose;
        $self->_handle_result( $conf, 0 );
        return 1;
    }
    my @output;
    chomp(@output = `"$llvm_bindir/lli" --version`);
    my $rv = $self->version_check($conf, \@output, $verbose);
    return 1 unless $rv;

    #  Find cc flags 
    my $ccflags = `$llvm_config --cflags`;
    chomp $ccflags;
    # do not include optimizatin level
    $ccflags =~ s/-O[^ ]*//; 
    $conf->data->add( ' ', ccflags => $ccflags );
    
    # Find lib 
    my $ldd = `ldd "$llvm_bindir/lli"`;
    if ($ldd =~ /(libLLVM[^ ]+)(.*)/m){
        my $lib  = $1;
        my $path = (split(' ',$2))[1];
        $conf->data->set( llvm_shared => $path );
        if ($lib =~ /lib(LLVM.*)\.(so|dll)/){
            $conf->data->set( llvm_ldflags  => "-l$1" );
        }
    }

    $self->_handle_result($conf, 1);
    return 1;

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
    $rv = '';
    if ($@) {
        $rv = $self->_handle_failure_to_compile_into_bitcode(
            $conf,
            $verbose,
        );
        if (! $rv) {
            uconf->cc_clean();
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

sub version_check {
    my ($self, $conf, $outputref, $verbose) = @_;
    my $version;
    if ( $outputref->[1] =~ m/llvm\sversion\s(\d+\.\d+)/s ) {
        $version = $1;
        if ($version < $self->{lli_min_version}) {
            if ($verbose) {
                my $msg = "LLVM component 'lli' must be at least version ";
                $msg .= "$self->{lli_min_version}; found version $version\n";
                print $msg;
            }
            $self->_handle_result( $conf, 0 );
            return;
        }
        else {
            if ($verbose) {
                print "Found 'lli' version $version\n";
            }
            return 1;
        }
    }
    else {
        print "Unable to extract version for LLVM component 'lli'\n"
            if $verbose;
        $self->_handle_result( $conf, 0 );
        return;
    }
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


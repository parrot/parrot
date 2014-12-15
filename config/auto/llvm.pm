# Copyright (C) 2009-2014, Parrot Foundation.

=head1 NAME

config/auto/llvm - Check whether the Low Level Virtual Machine is present

=head1 DESCRIPTION

Determines whether the Low Level Virtual Machine (LLVM) is installed and
functional on the system.  It is okay when it is not present.  When a
sufficiently up-to-date version of LLVM is present, you will need to
specify C<--with-llvm> as an option to C<perl Configure.pl> in order to tell
Parrot to link to LLVM, I<i.e.,> building without LLVM is Parrot's default
setting.

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
    if ( !$conf->options->get('with-llvm') ) {
        $self->_handle_result( $conf, 0 );
        $self->set_result('skipped');
        print "--with-llvm not requested.\n" if $verbose;
        return 1;
    }

    # We will run various probes for LLVM.  If the probes are unsuccessful, we
    # will set_result to 'no', set 'has_llvm' to '', then return from
    # runstep() with a value of 1.  If a given probe does not rule out LLVM,
    # we will proceed onward.

    my $llvm_config = $conf->options->get( 'llvm-config' );
    my $llvm_bindir;
    if ( $llvm_config and -e "$llvm_config" ) {
        $llvm_bindir = capture_output( $llvm_config, "--bindir" ) || '';
        chomp $llvm_bindir;
    }
    else {
        for my $ver ('',qw(-3.2 -3.1 -3.0 -2.9 -2.8 -2.7)) {
            my $bin = 'llvm-config'.$ver;
            $llvm_bindir = capture_output( $bin, "--bindir" ) || '';
            chomp $llvm_bindir;
            if ( $llvm_bindir ) {
                $llvm_config = $bin;
                last;
            }
        }
    }
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
    my $version = $rv;

    # Find flags
    my ($cflags, $cxxflags, $ldflags, $libs);
    if ($ldflags = $self->_llvm_config($llvm_config, '--ldflags')) {
        $conf->data->set( llvm_ldflags  => $ldflags );
        $conf->debug( "llvm_ldflags  => $ldflags\n" );
    }
    if ($libs = $self->_llvm_config($llvm_config, '--libs')) {
        $conf->data->set( llvm_libs  => $libs );
        $conf->debug( "llvm_libs  => $libs\n" );
    }
    if ($cflags = $self->_llvm_config($llvm_config, '--cflags')) {
        $conf->data->set( llvm_cflags  => $cflags );
        $conf->debug( "llvm_cflags  => $cflags\n" );
    }
    if ($cxxflags = $self->_llvm_config($llvm_config, '--cxxflags')) {
        $conf->data->set( llvm_cxxflags  => $cxxflags );
        $conf->debug( "llvm_cxxflags  => $cxxflags\n" );
    }

    # $self->_handle_result($conf, $version);
    # return 1;

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
    unlink $bcfile;
    for my $cc ($conf->data->get('cc'),
                "$llvm_bindir/clang", "$llvm_bindir/llvm-gcc",
                qw(llvm-gcc clang))
    {
        # Note: gcc and g++ with -c just skips over -emit-llvm and produce native code
        # without -c: ld: warning: cannot find entry symbol 'mit-llvm'
        my $err;
        (undef,undef,$err) = capture_output( qq{$cc $cflags -emit-llvm -O3 $fullcfile -c -o $bcfile} );
        if (!$err and -e $bcfile and $self->_check_bcfile($bcfile)) {
            $conf->data->set( llvm_gcc  => $cc );
            $conf->debug( "llvm_gcc  => $cc" );
            last;
        }
    }
    if (! $conf->data->get( 'llvm_gcc' )) {
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
            $output = capture_output( "$llvm_bindir/lli", $bcfile );
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
                system(qq{"$llvm_bindir/llc" $bcfile -o $sfile});
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
                        $conf, $output, $verbose, $version
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

sub _check_bcfile {
    my ($self, $bcfile) = @_;
    open my $fh, '<', $bcfile or return;
    my $read = read $fh, my $bytes, 2;
    my $result = ($read == 2 and $bytes eq 'BC') ? 1 : '';
    close $fh;
    return $result;
}

sub _llvm_config {
    my ($self, $llvm_config, $arg) = @_;
    my $result = `"$llvm_config" $arg`;
    chomp $result;
    return $result;
}

sub version_check {
    my ($self, $conf, $outputref, $verbose) = @_;
    my $version;
    if ( $outputref->[1] =~ m/llvm\sversion\s(\d+\.\d+)/is ) {
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
            print "Found 'lli' version $version\n" if $verbose;
            return $version;
        }
    }
    else {
        print "Unable to extract version for LLVM component 'lli'\n"
            if $verbose;
        $self->_handle_result( $conf, 0 );
        return 0;
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
        if ($result == 1) {
            $self->set_result( "yes" );
        }
        else {
            $self->set_result( "yes, ".$result );
        }
        $conf->data->set( has_llvm => 1 );
    }
    else {
        $self->set_result('no');
        $conf->data->set( has_llvm => '' );
    }
    return 1;
}

sub _handle_native_assembly_output {
    my ($self, $conf, $output, $verbose, $rv) = @_;
    if ( $@ or ( $output !~ /hello world/ ) ) {
        print "Unable to execute native assembly program successfully\n"
            if $verbose;
        $self->_handle_result( $conf, 0 );
    }
    else {
        $self->_handle_result( $conf, $rv );
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

James E Keenan, Reini Urban

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:


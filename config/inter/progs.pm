# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/inter/progs.pm - C Compiler and Linker

=head1 DESCRIPTION

Asks the user which compiler, linker, shared library builder, C libraries,
lexical analyzer generator and parser generator to use. Also whether debugging
should be enabled.

=cut

package inter::progs;

use strict;
use warnings;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':inter', ':auto';

$description = 'Determining what C compiler and linker to use';

@args = qw(ask cc cxx link ld ccflags ccwarn linkflags ldflags libs debugging
    lex yacc maintainer);

our $verbose;

sub runstep {
    my ( $self, $conf ) = @_;

    $verbose = $conf->options->get( 'verbose' );
    print $/ if $verbose;

    my ( $cc, $cxx, $link, $ld, $ccflags, $ccwarn, $linkflags, $ldflags, $libs, $lex, $yacc );

    my $ask = $conf->options->get('ask');
    if ($ask) {
        print <<'END';


    Okay, I'm going to start by asking you a couple questions about your
    compiler and linker.  Default values are in square brackets; you can
    hit ENTER to accept them.  If you don't understand a question, the
    default will usually work--they've been intuited from your Perl 5
    configuration.

END
    }

    # Set each variable individually so that hints files can use them as
    # triggers to help pick the correct defaults for later answers.

    $cc = integrate( $conf->data->get('cc'), $conf->options->get('cc') );
    $cc = prompt( "What C compiler do you want to use?", $cc )
        if $ask;
    $conf->data->set( cc => $cc );

    $link = integrate( $conf->data->get('link'), $conf->options->get('link') );
    $link = prompt( "How about your linker?", $link ) if $ask;
    $conf->data->set( link => $link );

    $ld = integrate( $conf->data->get('ld'), $conf->options->get('ld') );
    $ld = prompt( "What program do you want to use to build shared libraries?", $ld ) if $ask;
    $conf->data->set( ld => $ld );

    $ccflags = $conf->data->get('ccflags');

    # Remove some perl5-isms.
    $ccflags =~ s/-D((PERL|HAVE)_\w+\s*|USE_PERLIO)//g;
    $ccflags =~ s/-fno-strict-aliasing//g;
    $ccflags =~ s/-fnative-struct//g;
    $ccflags = prompt( "What flags should your C compiler receive?", $ccflags )
        if $ask;
    $conf->data->set( ccflags => $ccflags );

    $verbose and print " ccflags: $ccflags\n";

    $linkflags = $conf->data->get('linkflags');
    $linkflags =~ s/-libpath:\S+//g;    # RT#43174 No idea why.
    $linkflags = integrate( $linkflags, $conf->options->get('linkflags') );
    $linkflags = prompt( "And your linker?", $linkflags ) if $ask;
    $conf->data->set( linkflags => $linkflags );

    $ldflags = $conf->data->get('ldflags');
    $ldflags =~ s/-libpath:\S+//g;      # RT#43174 No idea why.
    $ldflags = integrate( $ldflags, $conf->options->get('ldflags') );
    $ldflags = prompt( "And your $ld for building shared libraries?", $ldflags )
        if $ask;
    $conf->data->set( ldflags => $ldflags );

    $libs = $conf->data->get('libs');
    $libs = join ' ', grep { $^O =~ /VMS|MSWin/ || !/^-l(c|gdbm(_compat)?|dbm|ndbm|db)$/ }
        split( ' ', $libs );
    $libs = integrate( $libs, $conf->options->get('libs') );
    $libs = prompt( "What libraries should your C compiler use?", $libs ) if $ask;
    $conf->data->set( libs => $libs );

    $cxx = integrate( $conf->data->get('cxx'), $conf->options->get('cxx') );
    $cxx = prompt( "What C++ compiler do you want to use?", $cxx ) if $ask;
    $conf->data->set( cxx => $cxx );

    my $debug = 'n';
    $debug = 'y' if $conf->options->get('debugging');
    $debug = prompt( "Do you want a debugging build of Parrot?", $debug )
        if $ask;
    unless ($debug =~ /^[yn]$/i) {
        return;
    }

    if ( $debug =~ /n/i ) {
        $conf->data->set(
            cc_debug   => '',
            link_debug => '',
            ld_debug   => ''
        );
    }

    # This one isn't prompted for above.  I don't know why.
    $ccwarn = integrate( $conf->data->get('ccwarn'), $conf->options->get('ccwarn') );
    $conf->data->set( ccwarn => $ccwarn );

    test_compiler( $cc );

    return $self;
}

sub test_compiler
{
    my $cc = shift;

    open( my $out_fh, '>', 'test.c' ) or die "Unable to open 'test.c': $@\n";
    print {$out_fh} <<END_C;
int main() {
    return 0;
}
END_C
    close $out_fh;

    unless ( eval { cc_build(); 1 } ) {
        warn "Compilation failed with '$cc'\n";
        exit 1;
    }

    unless ( eval { cc_run(); 1 } ) {
        warn $@ if $@;
        exit 1;
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

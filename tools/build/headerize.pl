#! perl
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;

=head1 NAME

tools/build/headerizer.pl - Generates the function header parts of .h
files from .c files

=head1 SYNOPSIS

Update the headers in F<include/parrot> with the function declarations in
the F<*.pmc> or F<*.c> files that correspond to the F<*.o> files passed
on the command line.

    % perl tools/build/headerizer.pl OBJFILES

=head1 DESCRIPTION

=head1 TODO

* Tell if there are funcs without docs

* Generate docs from funcs

* Test the POD of the stuff we're parsing.

* Somehow handle static functions in the source file

=head1 NOTES

* the .c files MUST have a /* HEADER: foo/bar.h */ directive in them

* Support for multiple .c files pointing at the same .h file

* Does NOT remove all blocks in the .h file, so if a .c file
disappears, it's block is "orphaned" and will remain there.

=head1 COMMAND-LINE OPTIONS

=over 4

=item C<--verbose>

Verbose status along the way.

=back

=head1 COMMAND-LINE ARGUMENTS

=over 4

=item C<OBJFILES>

One or more object file names.

=back

=cut

use Getopt::Long;
use lib qw( lib );
use Parrot::Config;

my %opt;

main();

=head1 FUNCTIONS

=cut

sub open_file {
    my $direction = shift;
    my $filename  = shift;

    my %actions = (
        '<'  => 'Reading',
        '>'  => 'Writing',
        '>>' => 'Appending',
    );

    my $action = $actions{$direction} or die "Invalid direction '$direction'";
    print "$action $filename\n" if $opt{verbose};
    open my $fh, $direction, $filename or die "$action $filename: $!\n";
    return $fh;
}

sub extract_functions {
    my $text = shift;

    # Strip blocks of comments
    $text =~ s[^/\*.*?\*/][]mxsg;

    # Strip # compiler directives (Thanks, Audrey!)
    $text =~ s[^#(\\\n|.)*][]mg;

    # Strip code blocks
    $text =~ s[^{.+?^}][]msg;

    # Split on paragraphs
    my @funcs = split /\n{2,}/, $text;

    # If it doesn't start in the left column, it's not a func
    @funcs = grep /^\S/, @funcs;

    # Typedefs, enums and externs are no good
    @funcs = grep !/^(typedef|enum|extern)/, @funcs;

    # Structs are OK if they're not alone on the line
    @funcs = grep { !/^struct.+;\n/ } @funcs;

    # Variables are of no use to us
    @funcs = grep !/=/, @funcs;

    # Get rid of any blocks at the end
    s/\s*{.*//s for @funcs;

    # Toast anything non-whitespace
    @funcs = grep /\S/, @funcs;

    # If it's got a semicolon, it's not a function header
    @funcs = grep !/;/, @funcs;

    chomp @funcs;

    return @funcs;
}

sub function_components {
    my $proto = shift;

    my @lines = split( /\n/, $proto );
    chomp @lines;
    my $parrot_api;
    if ( $lines[0] eq 'PARROT_API' ) {
        $parrot_api = 1;
        shift @lines;
    }

    my $returntype = shift @lines;
    my $parms      = join( " ", @lines );

    $parms =~ s/\s+/ /g;
    $parms =~ s{([^(]+)\s*\((.+)\)\s*(/\*\s*(.*?)\s*\*/)?;?}{$2} or die qq{Couldn't handle "$proto"};
    my $funcname = $1;
    $parms = $2;
    my $funcflags = $4;

    my @parms = split( /\s*,\s*/, $parms );
    for (@parms) {
        /\S+\s+\S+/ || ( $_ eq '...' ) || ( $_ eq 'void' ) || /theINTERP/
            or die "Bad parms in $proto";
    }

    my $static;
    $returntype =~ s/^((static)\s+)?//i;
    $static = $2 || '';

    die "Impossible to have both static and PARROT_API" if $parrot_api && $static;

    return [ $parrot_api, $static, $returntype, $funcname, $funcflags, @parms ];
}

sub attrs_from_args {
    my @args = @_;

    my @attrs = ();

    my $n = 0;
    for my $arg ( @args ) {
        ++$n;
        if ( $arg =~ m{/\*\s*NN\s*\*/} ) {
            push( @attrs, "__attribute__nonnull__($n)" );
        }
    }

    return @attrs;
}

sub attrs_from_funcflags {
    my $funcflags = shift;

    return if not $funcflags;
    return if $funcflags =~ /XXX/;

    my @attrs = ();
    my @opts = split( /\s*,\s*/, $funcflags );

    # For details about these attributes, see
    # http://gcc.gnu.org/onlinedocs/gcc-4.2.0/gcc/Function-Attributes.html
    for my $opt ( @opts ) {
        if ( $opt eq 'WARN_UNUSED' ) {
            push( @attrs, '__attribute__warn_unused_result__' );
        }
        elsif ( $opt eq 'NORETURN' ) {
            push( @attrs, '__attribute__noreturn__' );
        }
        elsif ( $opt eq 'CONST' ) {
            push( @attrs, '__attribute__const__' );
        }
        elsif ( $opt eq 'PURE' ) {
            push( @attrs, '__attribute__pure__' );
        }
        elsif ( $opt eq 'MALLOC' ) {
            push( @attrs, '__attribute__malloc__' );
        }
        else {
            die qq{Unknown function flag "$funcflags" -> "$opt"\n};
        }
    }

    return @attrs;
}

sub make_function_decls {
    my @funcs = @_;

    my @decls;
    foreach my $func ( @funcs ) {
        my ($parrot_api, $static, $ret_type, $funcname, $funcflags, @args) = @{$func};
        next if $static;

        my $multiline = 0;

        my $decl = sprintf( "%s %s(", $ret_type, $funcname );
        $decl = "PARROT_API $decl" if $parrot_api;

        my @attrs = attrs_from_args( @args );
        push( @attrs, attrs_from_funcflags( $funcflags ) );

        my $argline = join( ", ", @args );
        if ( length($decl.$argline) <= 75 ) {
            $decl = "$decl $argline )";
        }
        else {
            if ( $args[0] =~ /^Interp\b/ ) {
                $decl .= " " . (shift @args);
                $decl .= "," if @args;
            }
            $argline = join( ",", map { "\n\t$_" } @args );
            $decl = "$decl$argline )";
            $multiline = 1;
        }

        my $attrs = join( "", map { "\n\t\t$_" } @attrs );
        if ( $attrs ) {
            $decl .= $attrs;
            $multiline = 1;
        }
        $decl .= $multiline ? ";\n" : ";";
        $decl =~ s/\t/    /g;
        push( @decls, $decl );
    }

    return @decls;
}

sub main {
    GetOptions( 'verbose' => \$opt{verbose}, ) or exit(1);

    my $nfuncs = 0;
    my @ofiles = @ARGV;
    my %files;

    # Walk the object files and find corresponding source (either .c or .pmc)
    for my $ofile (@ofiles) {
        next if $ofile =~ m/^\Qsrc$PConfig{slash}ops\E/;

        my $cfile = $ofile;
        $cfile =~ s/\Q$PConfig{o}\E$/.c/;

        my $pmcfile = $ofile;
        $pmcfile =~ s/\Q$PConfig{o}\E$/.pmc/;

        my $sourcefile = -f $pmcfile ? $pmcfile : $cfile;

        my $fh = open_file( '<', $cfile );
        my $source = do { local $/; <$fh> };
        close $fh;

        print "=== $cfile ===\n";

        die "can't find HEADER directive in '$cfile'"
            unless $source =~ m#/\*\s+HEADER:\s+([^*]+?)\s+\*/#s;
        my $hfile = $1;
        die "'$hfile' not found (referenced from '$cfile')" unless -f $hfile;

        my @funcs = extract_functions($source);

        for my $func (@funcs) {
            push( @{ $files{$hfile}->{$cfile} }, function_components($func) );
            ++$nfuncs;
        }
    }    # for @cfiles
    my $nfiles = scalar keys %files;
    print "$nfuncs funcs in $nfiles files\n";

    for my $hfile ( sort keys %files ) {
        my $cfiles = $files{$hfile};

        open my $FILE, '<', $hfile or die "couldn't read '$hfile': $!";
        my $header = do { local $/ = undef; <$FILE> };    # slurp
        close $FILE;

        for my $cfile ( sort keys %{$cfiles} ) {
            my $funcs = $cfiles->{$cfile};
            my @funcs = sort api_first_then_alpha @{$funcs};

            my @function_decls = make_function_decls( @funcs );

            my $function_decls = join( "\n", @function_decls );
            my $STARTMARKER   = qr#/\* HEADERIZER BEGIN: $cfile \*/\n#;
            my $ENDMARKER     = qr#/\* HEADERIZER END: $cfile \*/\n?#;
            $header =~ s#($STARTMARKER)(?:.*?)($ENDMARKER)#$1\n$function_decls\n$2#s
                or die "Need begin/end HEADERIZER markers for $cfile in $hfile\n";
        }    # for %cfiles

        open $FILE, '>', $hfile or die "couldn't write '$hfile': $!";
        print $FILE $header;
        close $FILE;
        print "Wrote '$hfile'\n";
    }    # for %files

    return;
}

sub api_first_then_alpha {
    return
        ( ($b->[0]||0) <=> ($a->[0]||0) )
            ||
        ( lc $a->[3] cmp lc $b->[3] )
    ;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

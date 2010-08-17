#! perl
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

tools/build/headerizer.pl - Generates the function header parts of .h
files from .c files

=head1 SYNOPSIS

    % perl tools/build/headerizer.pl OBJFILES

=head1 DESCRIPTION

Update the headers in F<include/parrot> with the function declarations in
the F<*.pmc> or F<*.c> files that correspond to the F<*.o> files passed
on the command line.

=head1 TODO

* Generate docs from funcs

* Somehow handle static functions in the source file

=head1 NOTES

* the .c files MUST have a /* HEADERIZER HFILE: foo/bar.h */ directive in them

* Support for multiple .c files pointing at the same .h file

* Does NOT remove all blocks in the .h file, so if a .c file
disappears, its block is "orphaned" and will remain there.

=head1 COMMAND-LINE OPTIONS

=over 4

=item C<--macro=X>

Print a list of all functions that have macro X.  For example, --macro=PARROT_EXPORT.

=back

=head1 COMMAND-LINE ARGUMENTS

=over 4

=item C<OBJFILES>

One or more object file names.

=back

=cut

use strict;
use warnings;

use Getopt::Long;
use lib qw( lib );
use Parrot::Config;
use Parrot::Headerizer;

my $headerizer = Parrot::Headerizer->new;

main();

=head1 FUNCTIONS

=head2 extract_function_declaration_and_update_source( $cfile_name )

Extract all the function declarations from the C file specified by
I<$cfile_name>, and update the comment blocks within.

=cut

sub extract_function_declarations_and_update_source {
    my $cfile_name = shift;

    open( my $fhin, '<', $cfile_name ) or die "Can't open $cfile_name: $!";
    my $text = join( '', <$fhin> );
    close $fhin;

    my @func_declarations = $headerizer->extract_function_declarations( $text );
    for my $decl ( @func_declarations ) {
        my $specs = $headerizer->function_components_from_declaration( $cfile_name, $decl );
        my $name = $specs->{name};

        my $heading = $headerizer->generate_documentation_signature($decl);

        $text =~ s/=item C<[^>]*\b$name\b[^>]*>\n+/$heading\n\n/sm or do {
            warn "$cfile_name: $name has no POD\n" unless $name =~ /^yy/; # lexer funcs don't have to have POD
        }
    }
    open( my $fhout, '>', $cfile_name ) or die "Can't create $cfile_name: $!";
    print {$fhout} $text;
    close $fhout;

    return @func_declarations;
}


sub attrs_from_args {
    my $func = shift;
    my @args = @_;

    my @attrs = ();
    my @mods  = ();

    my $name = $func->{name};
    my $file = $func->{file};
    my $n = 0;
    for my $arg (@args) {
        ++$n;
        if ( $arg =~ m{ARG(?:MOD|OUT)(?:_NULLOK)?\((.+?)\)} ) {
            my $modified = $1;
            if ( $modified =~ s/.*\*/*/ ) {
                # We're OK
            }
            else {
                $modified =~ s/.* (\w+)$/$1/ or die qq{Unable to figure out the modified parm out of "$modified"};
            }
            push( @mods, "FUNC_MODIFIES($modified)" );
        }
        if ( $arg =~ m{(ARGIN|ARGOUT|ARGMOD|ARGFREE_NOTNULL|NOTNULL)\(} || $arg eq 'PARROT_INTERP' ) {
            push( @attrs, "__attribute__nonnull__($n)" );
        }
        if ( ( $arg =~ m{\*} ) && ( $arg !~ /\b(SHIM|((ARGIN|ARGOUT|ARGMOD)(_NULLOK)?)|ARGFREE(_NOTNULL)?)\b/ ) ) {
            if ( $name !~ /^yy/ ) { # Don't complain about the lexer auto-generated funcs
                $headerizer->squawk( $file, $name, qq{"$arg" isn't protected with an ARGIN, ARGOUT or ARGMOD (or a _NULLOK variant), or ARGFREE} );
            }
        }
        if ( ($arg =~ /\bconst\b/) && ($arg =~ /\*/) && ($arg !~ /\*\*/) && ($arg =~ /\b(ARG(MOD|OUT))\b/) ) {
            $headerizer->squawk( $file, $name, qq{"$arg" is const, but that $1 conflicts with const} );
        }
    }

    return (@attrs,@mods);
}

sub asserts_from_args {
    my @args = @_;
    my @asserts;

    for my $arg (@args) {
        if ( $arg =~ m{(ARGIN|ARGOUT|ARGMOD|ARGFREE_NOTNULL|NOTNULL)\((.+)\)} ) {
            my $var = $2;
            if($var =~ /\(*\s*([a-zA-Z_][a-zA-Z0-9_]*)\s*\)\s*\(/) {
                # argument is a function pointer
                $var = $1;
            }
            else {
                # try to isolate the variable's name;
                # strip off everything before the final space or asterisk.
                $var =~ s{.+[* ]([^* ]+)$}{$1};
                # strip off a trailing "[]", if any.
                $var =~ s{\[\]$}{};
            }
            push( @asserts, "PARROT_ASSERT_ARG($var)" );
        }
        if( $arg eq 'PARROT_INTERP' ) {
            push( @asserts, "PARROT_ASSERT_ARG(interp)" );
        }
    }

    return (@asserts);
}

sub make_function_decls {
    my @funcs = @_;

    my @decls;
    foreach my $func (@funcs) {
        my $multiline = 0;

        my $return = $func->{return_type};
        my $alt_void = ' ';

        # Splint can't handle /*@alt void@*/ on pointers, although this page
        # http://www.mail-archive.com/lclint-interest@virginia.edu/msg00139.html
        # seems to say that we can.
        if ( $func->{is_ignorable} && ($return !~ /\*/) ) {
            $alt_void = " /*\@alt void@*/\n";
        }

        my $decl = sprintf( "%s%s%s(", $return, $alt_void, $func->{name} );
        $decl = "static $decl" if $func->{is_static};

        my @args    = @{ $func->{args} };
        my @attrs   = attrs_from_args( $func, @args );

        for my $arg (@args) {
            if ( $arg =~ m{SHIM\((.+)\)} ) {
                $arg = $1;
                if ( $func->{is_static} || ( $arg =~ /\*/ ) ) {
                    $arg = "SHIM($arg)";
                }
                else {
                    $arg = "NULLOK($arg)";
                }
            }
        }

        my $argline = join( ", ", @args );
        if ( length( $decl . $argline ) <= 75 ) {
            $decl = "$decl$argline)";
        }
        else {
            if ( $args[0] =~ /^((SHIM|PARROT)_INTERP|Interp)\b/ ) {
                $decl .= ( shift @args );
                $decl .= "," if @args;
            }
            $argline   = join( ",", map { "\n\t$_" } @args );
            $decl      = "$decl$argline)";
            $multiline = 1;
        }

        my $attrs = join( "", map { "\n\t\t$_" } @attrs );
        if ($attrs) {
            $decl .= $attrs;
            $multiline = 1;
        }
        my @macros = @{ $func->{macros} };
        $multiline = 1 if @macros;

        $decl .= $multiline ? ";\n" : ";";
        $decl = join( "\n", @macros, $decl );
        $decl =~ s/\t/    /g;
        push( @decls, $decl );
    }

    foreach my $func (@funcs) {
        my @args    = @{ $func->{args} };
        my @asserts = asserts_from_args( @args );

        my $assert = "#define ASSERT_ARGS_" . $func->{name};
        if(length($func->{name}) > 29) {
            $assert .= " \\\n    ";
        }
        $assert .= " __attribute__unused__ int _ASSERT_ARGS_CHECK = (";
        if(@asserts) {
            $assert .= "\\\n       ";
            $assert .= join(" \\\n    , ", @asserts);
        }
        else {
            $assert .= "0";
        }
        $assert .= ")";
        push(@decls, $assert);
    }

    return @decls;
}

sub read_file {
    my $filename = shift;

    open my $fh, '<', $filename or die "couldn't read '$filename': $!";
    my $text = do { local $/ = undef; <$fh> };
    close $fh;

    return $text;
}

sub write_file {
    my $filename = shift;
    my $text     = shift;

    open my $fh, '>', $filename or die "couldn't write '$filename': $!";
    print {$fh} $text;
    close $fh;
}

sub replace_headerized_declarations {
    my $source_code = shift;
    my $sourcefile = shift;
    my $hfile       = shift;
    my @funcs       = @_;

    # Allow a way to not headerize statics
    if ( $source_code =~ m{/\*\s*HEADERIZER NONE:\s*$sourcefile\s*\*/} ) {
        return $source_code;
    }

    @funcs = sort api_first_then_alpha @funcs;

    my @function_decls = make_function_decls(@funcs);

    my $function_decls = join( "\n", @function_decls );
    my $STARTMARKER    = qr{/\* HEADERIZER BEGIN: $sourcefile \*/\n};
    my $ENDMARKER      = qr{/\* HEADERIZER END: $sourcefile \*/\n?};
    my $DO_NOT_TOUCH   = q{/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */};

    $source_code =~
        s{($STARTMARKER)(?:.*?)($ENDMARKER)}
         {$1$DO_NOT_TOUCH\n\n$function_decls\n$DO_NOT_TOUCH\n$2}s
        or die "Need begin/end HEADERIZER markers for $sourcefile in $hfile\n";

    return $source_code;
}

sub api_first_then_alpha {
    return ( ( $b->{is_api} || 0 ) <=> ( $a->{is_api} || 0 ) )
        || ( lc $a->{name} cmp lc $b->{name} );
}

sub main {
    my $macro_match;
    GetOptions(
        'macro=s' => \$macro_match,
    ) or exit(1);

    die 'No files specified.' unless @ARGV;
    my %ofiles;
    ++$ofiles{$_} for @ARGV;
    my @ofiles = sort keys %ofiles;
    for (@ofiles) {
        print "$_ is specified more than once.\n" if $ofiles{$_} > 1;
    }
    my %sourcefiles;
    my %sourcefiles_with_statics;
    my %api;

    # Walk the object files and find corresponding source (either .c or .pmc)
    for my $ofile (@ofiles) {
        next if $ofile =~ m/^\Qsrc$PConfig{slash}ops\E/;

        $ofile =~ s/\\/\//g;

        my $is_yacc = ($ofile =~ /\.y$/);
        if ( !$is_yacc ) {
            my $sfile = $ofile;
            $sfile    =~ s/\Q$PConfig{o}\E$/.s/;
            next if -f $sfile;
        }

        my $cfile = $ofile;
        $cfile =~ s/\Q$PConfig{o}\E$/.c/ or $is_yacc
            or die "$cfile doesn't look like an object file";

        my $pmcfile = $ofile;
        $pmcfile =~ s/\Q$PConfig{o}\E$/.pmc/;

        my $from_pmc = -f $pmcfile && !$is_yacc;

        my $sourcefile = $from_pmc ? $pmcfile : $cfile;

        my $source_code = read_file( $sourcefile );
        die qq{can't find HEADERIZER HFILE directive in "$sourcefile"}
            unless $source_code =~
                m{ /\* \s+ HEADERIZER\ HFILE: \s+ ([^*]+?) \s+ \*/ }sx;

        my $hfile = $1;
        if ( ( $hfile ne 'none' ) && ( not -f $hfile ) ) {
            die qq{"$hfile" not found (referenced from "$sourcefile")};
        }

        my @decls;
        if ( $macro_match ) {
            @decls = $headerizer->extract_function_declarations( $source_code );
        }
        else {
            @decls = extract_function_declarations_and_update_source( $sourcefile );
        }

        for my $decl (@decls) {
            my $components = $headerizer->function_components_from_declaration( $sourcefile, $decl );
            push( @{ $sourcefiles{$hfile}->{$sourcefile} }, $components ) unless $hfile eq 'none';
            push( @{ $sourcefiles_with_statics{$sourcefile} }, $components ) if $components->{is_static};
            if ( $macro_match ) {
                if ( grep { $_ eq $macro_match } @{$components->{macros}} ) {
                    push( @{ $api{$sourcefile} }, $components );
                }
            }
        }
    }    # for @cfiles

    if ( $macro_match ) {
        my $nfuncs = 0;
        for my $cfile ( sort keys %api ) {
            my @funcs = sort { $a->{name} cmp $b->{name} } @{$api{$cfile}};
            print "$cfile\n";
            for my $func ( @funcs ) {
                print "    $func->{name}\n";
                ++$nfuncs;
            }
        }
        my $s = $nfuncs == 1 ? '' : 's';
        print "$nfuncs $macro_match function$s\n";
    }
    else { # Normal headerization and updating
        # Update all the .h files
        for my $hfile ( sort keys %sourcefiles ) {
            my $sourcefiles = $sourcefiles{$hfile};

            my $header = read_file($hfile);

            for my $cfile ( sort keys %{$sourcefiles} ) {
                my @funcs = @{ $sourcefiles->{$cfile} };
                @funcs = grep { not $_->{is_static} } @funcs;    # skip statics

                $header = replace_headerized_declarations( $header, $cfile, $hfile, @funcs );
            }

            write_file( $hfile, $header );
        }

        # Update all the .c files in place
        for my $cfile ( sort keys %sourcefiles_with_statics ) {
            my @funcs = @{ $sourcefiles_with_statics{$cfile} };
            @funcs = grep { $_->{is_static} } @funcs;

            my $source = read_file($cfile);
            $source = replace_headerized_declarations( $source, 'static', $cfile, @funcs );

            write_file( $cfile, $source );
        }
        print "Headerization complete.\n";
    }

    my %warnings = %{$headerizer->{warnings}};
    if ( keys %warnings ) {
        my $nwarnings     = 0;
        my $nwarningfuncs = 0;
        my $nwarningfiles = 0;
        for my $file ( sort keys %warnings ) {
            ++$nwarningfiles;
            print "$file\n";
            my $funcs = $warnings{$file};
            for my $func ( sort keys %{$funcs} ) {
                ++$nwarningfuncs;
                for my $error ( @{ $funcs->{$func} } ) {
                    print "    $func: $error\n";
                    ++$nwarnings;
                }
            }
        }

        print "$nwarnings warnings in $nwarningfuncs funcs in $nwarningfiles C files\n";
    }

    return;
}

=head1 NAME

headerizer.pl

=head1 SYNOPSIS

  $ tools/build/headerizer.pl [object files]

Generates C function declarations based on the function definitions in
the C source code.

=head1 DIRECTIVES

The headerizer works off of directives in the source and header files.

One source file's public declarations can only go into one header file.
However, one header file can have declarations from multiple source files.
In other words, headers-to-source is one-to-many.

=over 4

=item HEADERIZER BEGIN: F<source-filename> / HEADERIZER END: F<source-filename>

Marks the beginning and end of a block of declarations in a header file.

    # In file foo.h
    /* HEADERIZER BEGIN: src/foo.c */
    /* HEADERIZER END: src/foo.c */

    /* HEADERIZER BEGIN: src/bar.c */
    /* HEADERIZER END: src/bar.c */

=item HEADERIZER HFILE: F<header-filename>

Tells the headerizer where the declarations for the functions should go

    # In file foo.c
    /* HEADERIZER HFILE: foo.h */

    # In file bar.c
    /* HEADERIZER HFILE: foo.h */

=back

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

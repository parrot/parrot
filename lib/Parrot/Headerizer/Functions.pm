# Copyright (C) 2004-2011, Parrot Foundation.
#

package Parrot::Headerizer::Functions;
use strict;
use warnings;
use base qw( Exporter );
our @EXPORT_OK = qw(
    process_argv
    read_file
    write_file
    qualify_sourcefile
    replace_pod_item
    no_both_PARROT_EXPORT_and_PARROT_INLINE
    validate_prototype_args
    no_both_static_and_PARROT_EXPORT
    handle_split_declaration
    asserts_from_args
    clean_args_for_declarations
    handle_modified_args
    add_asserts_to_declarations
    add_newline_if_multiline
    func_modifies
    add_headerizer_markers
);

=head1 NAME

Parrot::Headerizer::Functions - Functions used in headerizer programs

=head1 SYNOPSIS

    use Parrot::Headerizer::Functions qw(
        process_argv
        read_file
        write_file
        qualify_sourcefile
        replace_pod_item
        no_both_PARROT_EXPORT_and_PARROT_INLINE
        validate_prototype_args
        no_both_static_and_PARROT_EXPORT
        handle_split_declaration
        asserts_from_args
        clean_args_for_declarations
        handle_modified_args
        add_asserts_to_declarations
        add_newline_if_multiline
        func_modifies
        add_headerizer_markers
    );

=head1 DESCRIPTION

This package holds (non-object-oriented) functions used in
F<tools/dev/headerizer.pl>.

=head1 SUBROUTINES

=head2 C<process_argv>

=over 4

=item * Purpose

Validate (mostly, deduplicate) list of names of object files provided as arguments.

=item * Arguments

    @ofiles = process_argv(@ARGV);

List of files specified on the command-line.

=item * Return Value

Deduplicated list of object files.  Dies if no filenames were specified as
arguments.

=back

=cut

sub process_argv {
    my @argv = @_;
    die 'No files specified.' unless @argv;
    my %ofiles;
    ++$ofiles{$_} for @argv;
    my @ofiles = sort keys %ofiles;
    for (@ofiles) {
        print "$_ is specified more than once.\n" if $ofiles{$_} > 1;
    }
    return @ofiles;
}


=head2 C<read_file()>

=over 4

=item * Purpose

Read a file into a string.

=item * Arguments

String holding name of file to be read.

=item * Return Value

String holding the file's content.

=item * Comment

We can't alias this to C<Parrot::BuildUtil::slurp_file()> because that function
changes DOS line endings to Unix, which we don't necessarily want here.

=back

=cut


sub read_file {
    my $filename = shift;

    open my $fh, '<', $filename or die "couldn't read '$filename': $!";
    my $text = do { local $/ = undef; <$fh> };
    close $fh;

    return $text;
}

=head2 C<write_file()>

=over 4

=item * Purpose

Write a file.

=item * Arguments

List of two scalars: string holding name of file to be written; text to be
written to the file.

=item * Return Value

Implicitly returns true upon success.

=back

=cut

sub write_file {
    my $filename = shift;
    my $text     = shift;

    open my $fh, '>', $filename or die "couldn't write '$filename': $!";
    print {$fh} $text;
    close $fh;
}

=head2 C<qualify_sourcefile()>

=over 4

=item * Purpose

Given the name of a C object file, derive the name of its C<.c> or C<.pmc>
source code file, verify that file's existence, read in its source code, and
verify the existence of the corresponding C<.h> file.

=item * Arguments

    my ($sourcefile, $source_code, $hfile) =
        qualify_sourcefile( {
            ofile           => $ofile,
            PConfig         => \%PConfig,
            is_yacc         => $is_yacc,
        } );

Reference to hash with 3 key-value pairs:

=over 4

=item * C<ofile>

String holding name of C or yacc object file.

=item * C<PConfig>

Reference to Parrot configuration hash.

=item * C<is_yacc>

Boolean reporting whether the source code file is a yacc file or not.

=back

=item * Return Value

List of 3 scalars: String holding source code file, string holding the ssource
code, string holding header file (or C<none> if no header file is found).

=item * Comment

The subroutine will die if the value provided for C<ofile> does not have a
corresponding C<.c> file or if it is a yacc file.  The subroutine will also
die if it cannot locate an C<HEADERIZER HFILE> directive in the source code
file.  The subroutine will also die if any header file referenced from the
source code cannot be located.

=back

=cut

sub qualify_sourcefile {
    my $args = shift;
    my $cfile = $args->{ofile};
    $cfile =~ s/\Q$args->{PConfig}->{o}\E$/.c/ or $args->{is_yacc}
        or die "$cfile doesn't look like an object file";

    my $pmcfile = $args->{ofile};
    $pmcfile =~ s/\Q$args->{PConfig}->{o}\E$/.pmc/;

    my $from_pmc = -f $pmcfile && !$args->{is_yacc};

    my $sourcefile = $from_pmc ? $pmcfile : $cfile;

    my $source_code = read_file( $sourcefile );
    die qq{can't find HEADERIZER HFILE directive in "$sourcefile"}
        unless $source_code =~
            m{ /\* \s+ HEADERIZER\ HFILE: \s+ ([^*]+?) \s+ \*/ }sx;

    my $hfile = $1;
    if ( ( $hfile ne 'none' ) && ( not -f $hfile ) ) {
        die qq{"$hfile" not found (referenced from "$sourcefile")};
    }

    return ($sourcefile, $source_code, $hfile);
}

=head2 C<replace_pod_item()>

=over 4

=item * Purpose

In the course of headerizing, replaces a POD C<=item>-type line with a heading
created by C<generate_documentation_signature()>.

=item * Arguments

    $text = replace_pod_item( {
        text        => $text,
        name        => $name,
        heading     => $heading,
        cfile_name  => $cfile_name,
    } );

=item * Return Value

String holding modified text of file.

=back

=cut

sub replace_pod_item {
    my $args = shift;
    $args->{text} =~ s/=item C<[^>]*\b$args->{name}\b[^>]*>\n+/$args->{heading}\n\n/sm
        or do {
            warn "$args->{cfile_name}: $args->{name} has no POD\n"
                # lexer funcs don't have to have POD
                unless $args->{name} =~ /^yy/;
    };
    return $args->{text};
}

=head2 C<no_both_PARROT_EXPORT_and_PARROT_INLINE()>

=over 4

=item * Purpose

Checks that a given Parrot function cannot simultaneously have both of the
macros in the function's name.

=item * Arguments

    no_both_PARROT_EXPORT_and_PARROT_INLINE( {
        file            => $file,
        name            => $name,
        parrot_inline   => $parrot_inline,
        parrot_api      => $parrot_api,
    } );

=item * Return Value

Returns true value upon success.

=back

=cut

sub no_both_PARROT_EXPORT_and_PARROT_INLINE {
    my $args = shift;
    my $death =
        "$args->{file} $args->{name}: Can't have both PARROT_EXPORT and PARROT_INLINE";
    die $death if $args->{parrot_inline} && $args->{parrot_api};
    return 1;
}

=head2 C<validate_prototype_args()>

=over 4

=item * Purpose

Performs some validation on prototype arguments.

=item * Arguments

    @args = validate_prototype_args( $args, $proto );

=item * Return Value

=back

=cut

sub validate_prototype_args {
    my ($args, $proto) = @_;
    my @args = split( /\s*,\s*/, $args );
    for (@args) {
        /\S+\s+\S+/
            || ( $_ eq '...' )
            || ( $_ eq 'void' )
            || ( $_ =~ /(PARROT|NULLOK|SHIM)_INTERP/ )
            or die "Bad args in $proto";
    }
    return @args;
}

=head2 C<no_both_static_and_PARROT_EXPORT()>

=over 4

=item * Purpose

Checks that a given function cannot be simultaneously labelled as both static
and C<PARROT_EXPORT>.

=item * Arguments

    ($return_type, $is_static) = no_both_static_and_PARROT_EXPORT( {
        file            => $file,
        name            => $name,
        return_type     => $return_type,
        parrot_api      => $parrot_api,
    } );

=item * Return Value

List of two items: String holding the return type; Boolean indicating whether
function is static or not.

=back

=cut

sub no_both_static_and_PARROT_EXPORT {
    my $args = shift;
    my $is_static = 0;
    $is_static = $2 if $args->{return_type} =~ s/^((static)\s+)?//i;
    my $death = "$args->{file} $args->{name}: Impossible to have both static and PARROT_EXPORT";
    die $death if $args->{parrot_api} && $is_static;
    return ($args->{return_type}, $is_static);
}

=head2 C<handle_split_declaration()>

=over 4

=item * Purpose

Reformats declarations with appropriate line breaks to avoid long, unwieldy
lines.

=item * Arguments

    $split_decl = handle_split_declaration(
        $function_decl,
        $line_len,
    );

=item * Return Value

String holding declaration, broken into shorter lines as needed.

=back

=cut

sub handle_split_declaration {
    my ($function_decl, $line_len) = @_;
    my @doc_chunks = split /\s+/, $function_decl;
    my $split_decl = '';
    my @line;
    while (@doc_chunks) {
        my $chunk = shift @doc_chunks;
        if (length(join(' ', @line, $chunk)) <= $line_len) {
            push @line, $chunk;
        }
        else {
            $split_decl .= join(' ', @line) . "\n";
            @line=($chunk);
        }
    }
    $split_decl .= join(' ', @line) . "\n";
    $split_decl =~ s/\n$//;

    return $split_decl;
}

=head2 C<asserts_from_args()>

=over 4

=item * Purpose

Compose assertions to be added to headers.

=item * Arguments

    @asserts = asserts_from_args( @this_functions_args );

List of function arguments.

=item * Return Value

List of strings holding assertions to be added to that function's header.

=item * Comment

Called within C<add_asserts_to_declarations()>.

=back

=cut

sub asserts_from_args {
    my @args = @_;
    my @asserts;

    for my $arg (@args) {
        if ( $arg =~ m{(ARGIN|ARGOUT|ARGMOD|ARGFREE_NOTNULL|NOTNULL)\((.+?)\)} ) {
            my $var = $2;
            my $was_shimmed = ( $var =~ /SHIM/ );

            # try to isolate the variable's name;
            # strip off everything before the final space or asterisk.
            $var =~ s{.+[* ]([^* ]+)$}{$1};
            # strip off a trailing "[]", if any.
            $var =~ s{\[\]$}{};

            $var .= '_unused' if $was_shimmed;
            push( @asserts, "PARROT_ASSERT_ARG($var)" );
        }
        if ( $arg eq 'PARROT_INTERP' ) {
            push( @asserts, "PARROT_ASSERT_ARG(interp)" );
        }
    }

    return (@asserts);
}

=head2 C<clean_args_for_declarations()>

Removes SHIM()s from args for putting into declarations.

=cut

sub clean_args_for_declarations {
    my ($func, $argsref) = @_;
    my @args = @{$argsref};
    for my $arg (@args) {
        $arg =~ s{SHIM\((.+?)\)}{$1};
        $arg =~ s{SHIM_INTERP}{PARROT_INTERP};
    }
    return @args;
}

=head2 C<handle_modified_args()>

=over 4

=item * Purpose

Performs some modifications of arguments.

=item * Arguments

    ($decl, $multiline) = handle_modified_args($decl, \@modified_args);

List of two arguments: string holding a declaration; reference to an array of
modified arguments.

=item * Return Value

List of two elements:  String holding declaration, modified as needed; Boolean
indicating whether declaration runs over more than one line (multiline) or not.

=back

=cut

sub handle_modified_args {
    my ($decl, $modified_args_ref) = @_;
    my @modified_args = @{ $modified_args_ref };
    my  $multiline = 0;
    my $argline = join( ", ", @modified_args );
    if ( length( $decl . $argline ) <= 75 ) {
        $decl = "$decl$argline)";
    }
    else {
        if ( $modified_args[0] =~ /^(?:(?:SHIM|PARROT)_INTERP|Interp)\b/ ) {
            my $arg = shift @modified_args;
            $arg =~ s/\bSHIM_INTERP/PARROT_INTERP/;
            $decl .= $arg;
            $decl .= ',' if @modified_args;
        }
        $argline   = join( ",", map { "\n\t$_" } @modified_args );
        $decl      = "$decl$argline)";
        $multiline = 1;
    }
    return ($decl, $multiline);
}

=head2 C<add_newline_if_multiline()>

=over 4

=item * Purpose

Guarantee proper formatting of multiline declarations.

=item * Arguments

    $decl = add_newline_if_multiline($decl, $multiline);

List of two arguments: String holding declaration; scalar holding Boolean
indicating whether declaration runs over more than one line or not.

=item * Return Value

String holding the declaration, with an additional newline added as needed.

=back

=cut

sub add_newline_if_multiline {
    my ($decl, $multiline) = @_;
    $decl .= $multiline ? ";\n" : ";";
    return $decl;
}

=head2 C<add_asserts_to_declarations()>

=over 4

=item * Purpose

Formulates an assertion, where needed.  Currently, assertions begin like this:

    #define ASSERT_ARGS_

=item * Arguments

    @decls = add_asserts_to_declarations( \@funcs, \@decls );

List of two arguments: Reference to array of hash references holding
characteristics of functions; reference to array of declarations.

=item * Return Value

List of strings holding declarations.

=back

=cut

sub add_asserts_to_declarations {
    my ($funcs_ref, $decls_ref) = @_;
    foreach my $func (@{ $funcs_ref }) {
        my $assert = "#define ASSERT_ARGS_" . $func->{name};
        if(length($func->{name}) > 29) {
            $assert .= " \\\n    ";
        }
        $assert .= " __attribute__unused__ int _ASSERT_ARGS_CHECK = (";

        my @asserts = asserts_from_args( @{ $func->{args} } );
        if (@asserts) {
            $assert .= "\\\n       ";
            $assert .= join(" \\\n    , ", @asserts);
        }
        else {
            $assert .= "0";
        }
        $assert .= ")";
        push(@{ $decls_ref }, $assert);
    }
    return @{ $decls_ref };
}

=head2 C<func_modifies()>

=over 4

=item * Purpose

Add C<FUNC_MODIFIES> where needed.

=item * Arguments

   @mods = func_modifies($arg, \@mods);

List of two items: String holding function text; reference to array of
modifications.

=item * Return Value

Augmented list of modifications.

=back

=cut

sub func_modifies {
    my ($arg, $modsref) = @_;
    my @mods = @{$modsref};
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
    return @mods;
}


=head2 C<add_headerizer_markers()>

=over 4

=item * Purpose

Takes headerizer markers in source code files (like C<HEADERIZER_BEGIN> and
C<HEADERIZER END>) and formulates appropriate variants to be placed in the
headerfile.

=item * Arguments

    $source_code = add_headerizer_markers( {
        function_decls  => \@function_decls,
        sourcefile      => $sourcefile,
        hfile           => $hfile,
        code            => $source_code,
    } );

=item * Return Value

String holding modified source code.

=back

=cut

sub add_headerizer_markers {
    my $args = shift;

    my $function_decls = join( "\n" => @{ $args->{function_decls} });
    my $STARTMARKER    = qr{/\* HEADERIZER BEGIN: $args->{sourcefile} \*/\n};
    my $ENDMARKER      = qr{/\* HEADERIZER END: $args->{sourcefile} \*/\n?};
    my $DO_NOT_TOUCH   = q{/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */};

    $args->{code} =~
        s{($STARTMARKER)(?:.*?)($ENDMARKER)}
         {$1$DO_NOT_TOUCH\n\n$function_decls\n$DO_NOT_TOUCH\n$2}s
        or die "Need begin/end HEADERIZER markers for $args->{sourcefile} in $args->{hfile}\n";

    return $args->{code};
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

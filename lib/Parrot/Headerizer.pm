# Copyright (C) 2004-2011, Parrot Foundation.
#

package Parrot::Headerizer;

=head1 NAME

Parrot::Headerizer - Parrot header generation functionality

=head1 SYNOPSIS

    use Parrot::Headerizer;

    $headerizer = Parrot::Headerizer->new( {
        macro_match => $macro_match, # optional
    } );

    $headerizer->get_sources(@ofiles);
    $headerizer->process_sources();
    $headerizer->print_final_message();
    $headerizer->print_warnings();

    @function_decls = $headerizer->extract_function_declarations($buf);
    $escaped_decl = $headerizer->generate_documentation_signature($function_decl);

=head1 DESCRIPTION

C<Parrot::Headerizer> knows how to extract all kinds of information out
of C-language files.  Its methods are used in F<tools/dev/headerizer.pl> and
F<t/codingstd/c_function_docs.t>.

=head1 METHODS

=cut

use strict;
use warnings;
use Data::Dumper;$Data::Dumper::Indent=1;
use Scalar::Util qw( reftype );
use lib qw( lib );
use Parrot::Config;
use Parrot::Headerizer::Functions qw(
    read_file
    write_file
    qualify_sourcefile
    replace_pod_item
    no_both_PARROT_EXPORT_and_PARROT_INLINE
    validate_prototype_args
    no_both_static_and_PARROT_EXPORT
    handle_split_declaration
    clean_args_for_declarations
    handle_modified_args
    add_newline_if_multiline
    add_asserts_to_declarations
    func_modifies
    add_headerizer_markers
);

=head2 C<new()>

=over 4

=item * Purpose

Constructor of headerizer object.  The object is initialized with a list of
valid C<PARROT_XXX> macros.

=item * Arguments

    $headerizer = Parrot::Headerizer->new();

No mandatory arguments, but one special use-case takes a hash reference.

    $headerizer = Parrot::Headerizer->new( {
        macro_match => $macro_match, # optional
    } );

Currently, the only meaningful element in that hash reference is
C<macro_match>.  See C<process_sources()> below for discussion of how that is
used.

=item * Return Value

Parrot::Headerizer object.

=back

=cut

sub new {
    my ($class, $args) = @_;
    if (defined $args) {
        die 'Argument to Parrot::Headerizer must be hashref'
            unless reftype($args) eq 'HASH';
    }
    else {
        $args = {};
    }
    $args->{macro_match} = undef unless defined $args->{macro_match};
    $args->{warnings} = {};
    $args->{message} = '';
    $args->{valid_macros} = { map { ( $_, 1 ) } qw(
        PARROT_EXPORT
        PARROT_INLINE
        PARROT_NOINLINE

        PARROT_CAN_RETURN_NULL
        PARROT_CANNOT_RETURN_NULL

        PARROT_IGNORABLE_RESULT
        PARROT_WARN_UNUSED_RESULT

        PARROT_PURE_FUNCTION
        PARROT_CONST_FUNCTION

        PARROT_DOES_NOT_RETURN
        PARROT_DOES_NOT_RETURN_WHEN_FALSE

        PARROT_MALLOC
        PARROT_OBSERVER

        PARROT_HOT
        PARROT_COLD

        PARROT_API
        )
    };
    return bless $args, $class;
}

=over 4

=item * Purpose

Identify the source code files which need to have header information
extracted.  The header information is extracted and stored inside the
headerizer object in appropriate ways.

=item * Arguments

    $headerizer->get_sources(@ofiles);

List of names of C object (C<.o>) files.

=item * Return Value

No defined return value.

=back

=cut

sub get_sources {
    my $self = shift;
    my @ofiles = @_;
    my %sourcefiles;
    my %sourcefiles_with_statics;
    my %api;
    # Walk the object files and find corresponding source (either .c or .pmc)
    for my $ofile (@ofiles) {

        # Skip files in the src/ops/ subdirectory.
        next if $ofile =~ m/^\Qsrc$PConfig{slash}ops\E/ || # if run by hand...
                $ofile =~ m{^src/ops};                     # ... or by makefile

        $ofile =~ s/\\/\//g;

        my $is_yacc = ($ofile =~ /\.y$/);
        if ( !$is_yacc ) {
            my $sfile = $ofile;
            $sfile    =~ s/\Q$PConfig{o}\E$/.s/;
            next if -f $sfile;
        }

        my ($sourcefile, $source_code, $hfile) =
            qualify_sourcefile( {
                ofile           => $ofile,
                PConfig         => \%PConfig,
                is_yacc         => $is_yacc,
            } );

        my @decls;
        if ( $self->{macro_match} ) {
            @decls = $self->extract_function_declarations( $source_code );
        }
        else {
            @decls =
            $self->extract_function_declarations_and_update_source( $sourcefile );
        }

        for my $decl (@decls) {
            my $components =
                $self->function_components_from_declaration( $sourcefile, $decl );
            push( @{ $sourcefiles{$hfile}->{$sourcefile} }, $components )
                unless $hfile eq 'none';
            push( @{ $sourcefiles_with_statics{$sourcefile} }, $components )
                if $components->{is_static};
            if ( $self->{macro_match} ) {
                if ( grep { $_ eq $self->{macro_match} } @{$components->{macros}} ) {
                    push( @{ $api{$sourcefile} }, $components );
                }
            }
        }
    }    # for @cfiles
    $self->{sourcefiles} = \%sourcefiles;
    $self->{sourcefiles_with_statics} = \%sourcefiles_with_statics;
    $self->{api} = \%api;
}

=head2 C<extract_function_declarations()>

=over 4

=item * Purpose

Extracts the function declarations from the text argument, and returns an
array of strings containing the function declarations.

=item * Arguments

    @function_decls = $headerizer->extract_function_declarations($text)

String holding the slurped-in content of a source code file.

=item * Return Value

List of strings holding function declarations.

=item * Comment

Called within C<get_sources()>, but also called on its own within
F<t/codingstd/c_function_docs.t>.

=back

=cut

sub extract_function_declarations {
    my $self = shift;
    my $text = shift;

    # Only check the YACC C code if we find what looks like YACC file
    $text =~ s/%\{(.*)%\}.*/$1/sm;

    # Drop all text after HEADERIZER STOP
    $text =~ s{/\*\s*HEADERIZER STOP.+}{}s;

    # Drop begin/end PMC HEADER sections
    $text =~ s{BEGIN_PMC_HEADER_PREAMBLE}{}sx;
    $text =~ s{END_PMC_HEADER_PREAMBLE}{}sx;

    # Strip blocks of comments
    $text =~ s{^/\*.*?\*/}{}mxsg;

    # Strip # compiler directives
    $text =~ s{^#(\\\n|.)*}{}mg;

    # Strip code blocks
    $text =~ s/^{.+?^}//msg;

    # Split on paragraphs
    my @funcs = split /\n{2,}/, $text;

    # If it doesn't start in the left column, it's not a func
    @funcs = grep { /^\S/ } @funcs;

    # Typedefs, enums and externs are no good
    @funcs = grep { !/^(?:typedef|enum|extern)\b/ } @funcs;

    # Structs are OK if they're not alone on the line
    @funcs = grep { !/^struct.+;\n/ } @funcs;

    # Structs are OK if they're not being defined
    @funcs = grep { !/^(?:static\s+)?struct.+{\n/ } @funcs;

    # Ignore magic function name YY_DECL
    @funcs = grep { !/YY_DECL/ } @funcs;

    # Ignore anything with magic words HEADERIZER SKIP
    @funcs = grep { !m{/\*\s*HEADERIZER SKIP\s*\*/} } @funcs;

    # pmclass declarations in PMC files are no good
    @funcs = grep { !m{^pmclass } } @funcs;

    # Variables are of no use to us
    @funcs = grep { !/=/ } @funcs;

    # Get rid of any blocks at the end
    s/\s*{.*//s for @funcs;

    # Toast anything non-whitespace
    @funcs = grep { /\S/ } @funcs;

    # If it's got a semicolon, it's not a function header
    @funcs = grep { !/;/ } @funcs;

    # remove any remaining }'s
    @funcs = grep {! /^}/} @funcs;

    chomp @funcs;

    return @funcs;
}

=head2 C<extract_function_declaration_and_update_source()>

=over 4

=item * Purpose

Extract all the function declarations from a source code file and update the
comment blocks within it.

=item * Arguments

    @function_declarations =
        $headerizer->extract_function_declaration_and_update_source($cfile_name);

String holding source code filename.

=item * Return Value

List of strings holding function declarations.

=item * Comment

Called within C<get_sources()>.  Wraps around
C<extract_function_declarations()> but differs from that method by generating
signatures, correcting POD, etc.

=back

=cut

sub extract_function_declarations_and_update_source {
    my $self = shift;
    my $cfile_name = shift;

    open( my $fhin, '<', $cfile_name ) or die "Can't open $cfile_name: $!";
    my $text = join( '', <$fhin> );
    close $fhin;

    my @func_declarations = $self->extract_function_declarations( $text );
    for my $decl ( @func_declarations ) {
        my $specs = $self->function_components_from_declaration( $cfile_name, $decl );
        my $name = $specs->{name};

        my $heading = $self->generate_documentation_signature($decl);
        $text = replace_pod_item( {
            text        => $text,
            name        => $name,
            heading     => $heading,
            cfile_name  => $cfile_name,
        } );
    }
    open( my $fhout, '>', $cfile_name ) or die "Can't create $cfile_name: $!";
    print {$fhout} $text;
    close $fhout;

    return @func_declarations;
}

=head2 C<function_components_from_declaration($file, $proto)>

=over 4

=item * Purpose

Creates a data structure in which information about a particular function can
be looked up.

=item * Arguments

List of two strings, the filename and the function declaration.

=item * Return Value

Returns a reference to a hash of these function components:

    file
    name
    args
    macros
    is_static
    is_inline
    is_api
    is_ignorable
    return_type

=item * Comment

Currently called within both
C<extract_function_declarations()> and
C<extract_function_declarations_and_update_source()>.

=back

=cut

sub function_components_from_declaration {
    my $self  = shift;
    my $file  = shift;
    my $proto = shift;

    my @lines = split( /\n/, $proto );
    chomp @lines;

    my @macros;
    my $parrot_api;
    my $parrot_inline;

    while ( @lines && ( $lines[0] =~ /^PARROT_/ ) ) {
        my $macro = shift @lines;
        if ( $macro eq 'PARROT_EXPORT' ) {
            $parrot_api = 1;
        }
        elsif ( $macro eq 'PARROT_INLINE' ) {
            $parrot_inline = 1;
        }
        push( @macros, $macro );
    }

    my $return_type = shift @lines;
    my $args = join( ' ', @lines );

    $args =~ s/\s+/ /g;
    $args =~ s{([^(]+)\s*\((.+)\);?}{$2}
        or die qq{Couldn't handle "$proto" in $file\n};

    my $name = $1;
    $args = $2;

    no_both_PARROT_EXPORT_and_PARROT_INLINE( {
        file            => $file,
        name            => $name,
        parrot_inline   => $parrot_inline,
        parrot_api      => $parrot_api,
    } );

    my @args = validate_prototype_args( $args, $proto );

    my $is_static;
    ($return_type, $is_static) = no_both_static_and_PARROT_EXPORT( {
        file            => $file,
        name            => $name,
        return_type     => $return_type,
        parrot_api      => $parrot_api,
    } );

    my $is_ignorable = 0;
    my %macros;
    for my $macro (@macros) {
        $macros{$macro} = 1;
        if (not $self->valid_macro($macro)) {
            $self->squawk( $file, $name, "Invalid macro $macro" );
        }
        if ( $macro eq 'PARROT_IGNORABLE_RESULT' ) {
            $is_ignorable = 1;
        }
    }
    $self->check_pointer_return_type( {
        return_type     => $return_type,
        macros          => \%macros,
        name            => $name,
        file            => $file,
    } );

    return {
        file         => $file,
        name         => $name,
        args         => \@args,
        macros       => \@macros,
        is_static    => $is_static,
        is_inline    => $parrot_inline,
        is_api       => $parrot_api,
        is_ignorable => $is_ignorable,
        return_type  => $return_type,
    };
}

=head2 C<check_pointer_return_type()>

=over 4

=item * Purpose

Performs some validation in the case where a function's return value is a
pointer.

=item * Arguments

    $headerizer->check_pointer_return_type( {
        return_type     => $return_type,
        macros          => \%macros,
        name            => $name,
        file            => $file,
    } );

Reference to a hash with the four elements listed above.

=item * Return Value

No defined return value.

=back

=cut

sub check_pointer_return_type {
    my ($self, $args) = @_;
    if ( $args->{return_type} =~ /\*/ ) {
        if ( !$args->{macros}->{PARROT_CAN_RETURN_NULL} &&
             !$args->{macros}->{PARROT_CANNOT_RETURN_NULL} ) {
            if ( $args->{name} !~ /^yy/ ) { # Don't complain about lexer-created functions
                $self->squawk( $args->{file}, $args->{name},
                    'Returns a pointer, but no PARROT_CAN(NOT)_RETURN_NULL macro found.' );
            }
        }
        elsif ( $args->{macros}->{PARROT_CAN_RETURN_NULL} &&
                $args->{macros}->{PARROT_CANNOT_RETURN_NULL} ) {
            $self->squawk( $args->{file}, $args->{name},
                q{Can't have both PARROT_CAN_RETURN_NULL and PARROT_CANNOT_RETURN_NULL together.} );
        }
    }
}

=head2 C<generate_documentation_signature()>

=over 4

=item * Purpose

Given an extracted function signature, return a modified
version suitable for inclusion in POD documentation.

=item * Arguments

    $heading = $headerizer->generate_documentation_signature($decl);

String holding a function declaration.

=item * Return Value

String holding a function header, split over multiple lines as needed.

=back

=cut

sub generate_documentation_signature {
    my $self = shift;
    my $function_decl = shift;

    # strip out any PARROT_* function modifiers
    foreach my $key ($self->valid_macros) {
        $function_decl =~ s/^$key$//m;
    }

    $function_decl =~ s/^\s+//g;
    $function_decl =~ s/\s+/ /g;

    # strip out any ARG* modifiers
    $function_decl =~ s/ARG(?:IN|IN_NULLOK|OUT|OUT_NULLOK|MOD|MOD_NULLOK|FREE|FREE_NOTNULL)\((.*?)\)/$1/g;

    # strip out the SHIM modifier
    $function_decl =~ s/SHIM\((.*?)\)/$1/g;

    # strip out the NULL modifiers
    $function_decl =~ s/(?:NULLOK|NOTNULL)\((.*?)\)/$1/g;

    # SHIM_INTERP is still a PARROT_INTERP
    $function_decl =~ s/SHIM_INTERP/PARROT_INTERP/g;

    # wrap with POD
    $function_decl = "=item C<$function_decl>";

    # Wrap long lines.
    my $line_len = 80;
    if (length($function_decl)<= $line_len) {
        return $function_decl;
    }
    else {
        return handle_split_declaration(
            $function_decl,
            $line_len,
        );
    }
}

=head2 C<valid_macro()>

=over 4

=item * Purpose

Tests the validity of a given macro.

=item * Arguments

    $headerizer->valid_macro( $macro )

String holding a macro.

=item * Return Value

Boolean: true value for valid macro; false value for invalid macro.

=back

=cut

sub valid_macro {
    my $self = shift;
    my $macro = shift;

    return exists $self->{valid_macros}{$macro};
}

=head2 C<valid_macros()>

=over 4

=item * Purpose

Identify all valid macros whose names are of the form C<PARROT_XXX>.

=item * Arguments

    @marcros = $headerizer->valid_macros();

None.

=item * Return Value

List of all the valid C<PARROT_XXX> macros.

=back

=cut

sub valid_macros {
    my $self = shift;

    my @macros = sort keys %{$self->{valid_macros}};

    return @macros;
}

=head2 C<squawk()>

=over 4

=item * Purpose

Builds a data structure with headerizer-specific ways of complaining if
something went wrong.

=item * Arguments

    $headerizer->squawk($file, $func, $error);

List of 3 arguments:  the file containing the error; the function containing
the error; the text of the error message.

=item * Return Value

Undefined value.

=item * Comment

C<squawk()> does not print any warnings or errors itself.  Use
C<print_warnings()> to report those.

=back

=cut

sub squawk {
    my $self  = shift;
    my $file  = shift;
    my $func  = shift;
    my $error = shift;

    push( @{ $self->{warnings}{$file}{$func} }, $error );

    return;
}

=head2 C<process_sources()>

=over 4

=item * Purpose

Once the source files needing headerization have been identified, this method
serves as a wrapper around that headerization.  Both C<.h> and C<.c> files are
handled.

=item * Arguments

None.

=item * Return Value

None.

=item * Comment

If a hash reference with an element named C<macro_match> was passed to
C<new()>, C<process_sources()> merely prints to C<STDOUT> a list of files and
functions using the macro named as the value of that element.  No
headerization or revision of headers is performed.

=back

=cut

sub process_sources {
    my ($self) = @_;
    my %sourcefiles = %{$self->{sourcefiles}};
    my %sourcefiles_with_statics = %{$self->{sourcefiles_with_statics}};
    my %api = %{$self->{api}};
    if ( $self->{macro_match} ) {
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
        $self->{message} = "$nfuncs $self->{macro_match} function$s";
    }
    # Normal headerization and updating
    else {
        # Update all the .h files
        for my $hfile ( sort keys %sourcefiles ) {
            my $sourcefiles = $sourcefiles{$hfile};

            my $header = read_file($hfile);

            for my $cfile ( sort keys %{$sourcefiles} ) {
                my @funcs = @{ $sourcefiles->{$cfile} };
                @funcs = grep { not $_->{is_static} } @funcs;    # skip statics
                $header = $self->replace_headerized_declarations(
                    $header, $cfile, $hfile, @funcs );
            }

            write_file( $hfile, $header );
        }

        # Update all the .c files in place
        for my $cfile ( sort keys %sourcefiles_with_statics ) {
            my @funcs = @{ $sourcefiles_with_statics{$cfile} };
            @funcs = grep { $_->{is_static} } @funcs;

            my $source = read_file($cfile);
            $source = $self->replace_headerized_declarations( $source, 'static', $cfile, @funcs );

            write_file( $cfile, $source );
        }
        $self->{message} = "Headerization complete.";
    }
}

=head2 C<replace_headerized_declarations()>

=over 4

=item * Purpose


=item * Arguments

=item * Return Value

=back

=cut

sub replace_headerized_declarations {
    my $self = shift;
    my $source_code = shift;
    my $sourcefile  = shift;
    my $hfile       = shift;
    my @funcs       = @_;

    # Allow a way to not headerize statics
    if ( $source_code =~ m{/\*\s*HEADERIZER NONE:\s*$sourcefile\s*\*/} ) {
        return $source_code;
    }

    @funcs = sort {
        ( ( $b->{is_api} || 0 ) <=> ( $a->{is_api} || 0 ) )
        || ( ( lc($a->{name}) || '') cmp ( lc($b->{name}) || '') )
    } @funcs;
    my @function_decls = $self->make_function_decls(@funcs);

    my $markers_args = {
        function_decls  => \@function_decls,
        sourcefile      => $sourcefile,
        hfile           => $hfile,
        code            => $source_code,
    };

    return add_headerizer_markers( $markers_args );
}

=head2 C<make_function_decls()>

=over 4

=item * Purpose

Composes proper function declarations.

=item * Arguments

    @function_decls = $self->make_function_decls(@funcs);

List of functions.

=item * Return Value

List of function declarations.

=item * Comment

Called within C<replace_headerized_declarations()>.

=back

=cut

sub make_function_decls {
    my $self = shift;
    my @funcs = @_;

    my @decls;
    foreach my $func (@funcs) {
        my $alt_void = ' ';

        # Splint can't handle /*@alt void@*/ on pointers, although this page
        # http://www.mail-archive.com/lclint-interest@virginia.edu/msg00139.html
        # seems to say that we can.
        if ( $func->{is_ignorable} && ($func->{return_type} !~ /\*/) ) {
            $alt_void = " /*\@alt void@*/\n";
        }

        my $decl = sprintf( "%s%s%s(" => (
            $func->{return_type},
            $alt_void,
            $func->{name}
        ) );
        $decl = "static $decl" if $func->{is_static};

        my @args    = @{ $func->{args} };
        my @attrs   = $self->attrs_from_args( $func, @args );

        my @modified_args = clean_args_for_declarations($func, \@args);

        my $multiline;
        ($decl, $multiline) = handle_modified_args($decl, \@modified_args);

        my $attrs = join( "", map { "\n\t\t$_" } @attrs );
        if ($attrs) {
            $decl .= $attrs;
            $multiline = 1;
        }
        my @macros = @{ $func->{macros} };
        $multiline = 1 if @macros;

        $decl = add_newline_if_multiline($decl, $multiline);
        $decl = join( "\n", @macros, $decl );
        $decl =~ s/\t/    /g;
        push( @decls, $decl );
    }

    @decls = add_asserts_to_declarations( \@funcs, \@decls );

    return @decls;
}

=head2 C<attrs_from_args()>

=over 4

=item * Purpose

Adds to headers strings of the form C<__attribute__nonnull__(1)>.

=item * Arguments

    @attrs   = $headerizer->attrs_from_args( $func, @args );

List whose first element is a hash reference holding characteristics about a
given function, followed by list of arguments.

=item * Return Value

List.

=item * Comment

Called within C<make_function_decls()>.

=back

=cut

sub attrs_from_args {
    my $self = shift;
    my $func = shift;
    my @args = @_;

    my @attrs = ();
    my @mods  = ();

    my $name = $func->{name};
    my $file = $func->{file};
    my $n = 0;
    for my $arg (@args) {
        ++$n;
        @mods = func_modifies($arg, \@mods);
        if ( $arg =~ m{(ARGIN|ARGOUT|ARGMOD|ARGFREE_NOTNULL|NOTNULL)\(} || $arg eq 'PARROT_INTERP' ) {
            push( @attrs, "__attribute__nonnull__($n)" );
        }
        if ( ( $arg =~ m{\*} ) && ( $arg !~ /\b(SHIM|((ARGIN|ARGOUT|ARGMOD)(_NULLOK)?)|ARGFREE(_NOTNULL)?)\b/ ) ) {
            if ( $name !~ /^yy/ ) { # Don't complain about the lexer auto-generated funcs
                $self->squawk( $file, $name, qq{"$arg" isn't protected with an ARGIN, ARGOUT or ARGMOD (or a _NULLOK variant), or ARGFREE} );
            }
        }
        if ( ($arg =~ /\bconst\b/) && ($arg =~ /\*/) && ($arg !~ /\*\*/) && ($arg =~ /\b(ARG(MOD|OUT))\b/) ) {
            $self->squawk( $file, $name, qq{"$arg" is const, but that $1 conflicts with const} );
        }
    }

    return (@attrs,@mods);
}

=head2 C<print_final_message()>

=over 4

=item * Purpose

Prints a concluding message whose content reflects either normal headerization
or macro matching.

=item * Arguments

None.

=item * Return Value

Implicitly returns true value upon success.

=back

=cut

sub print_final_message {
    my $self = shift;
    if ($self->{message} ne '') {
        print "$self->{message}\n";
    }
}

=head2 C<print_headerizer_warnings()>

=over 4

=item * Purpose

Print all warnings accumulated in the course of the headerization process.

=item * Arguments

None.

=item * Return Value

Implicitly returns true value upon success.

=back

=cut

sub print_warnings {
    my $self = shift;
    my %warnings = %{$self->{warnings}};
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
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

# Copyright (C) 2004-2010, Parrot Foundation.
# $Id$

package Parrot::Headerizer;

=head1 NAME

Parrot::Headerizer - Parrot Header Generation functionality

=head1 SYNOPSIS

    use Parrot::Headerizer;

    my $headerizer = Parrot::Headerizer->new();

=head1 DESCRIPTION

C<Parrot::Headerizer> knows how to extract all kinds of information out
of C-language files.

=head2 Class Methods

=over 4

=cut

use strict;
use warnings;

=item C<new()>

TODO

Contructor of headerizer objects

=cut

sub new {
    my ($class) = @_;

    my $self = bless {
        warnings => {},
    }, $class;

    $self->{valid_macros} = { map { ( $_, 1 ) } qw(
        PARROT_EXPORT
        PARROT_INLINE

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
        )
    };

    return $self;
}

=item $headerizer->valid_macro( $macro )

Returns a boolean saying wither I<$macro> is a valid PARROT_XXX macro.

=cut

sub valid_macro {
    my $self = shift;
    my $macro = shift;

    return exists $self->{valid_macros}{$macro};
}

=item $headerizer->valid_macros()

Returns a list of all the valid PARROT_XXX macros.

=cut

sub valid_macros {
    my $self = shift;

    my @macros = sort keys %{$self->{valid_macros}};

    return @macros;
}

=item $headerizer->extract_function_declarations($text)

Extracts the function declarations from the text argument, and returns an
array of strings containing the function declarations.

=cut

sub extract_function_declarations {
    my $self = shift;
    my $text = shift;

    # Only check the YACC C code if we find what looks like YACC file
    $text =~ s/%\{(.*)%\}.*/$1/sm;

    # Drop all text after HEADERIZER STOP
    $text =~ s{/\*\s*HEADERIZER STOP.+}{}s;

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

=item C<function_components_from_declaration($file, $proto)>

$file => the filename
$proto => the function declaration

Returns an anonymous hash of function components:

        file         => $file,
        name         => $name,
        args         => \@args,
        macros       => \@macros,
        is_static    => $is_static,
        is_inline    => $parrot_inline,
        is_api       => $parrot_api,
        is_ignorable => $is_ignorable,
        return_type  => $return_type,

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

    die "Can't have both PARROT_EXPORT and PARROT_INLINE on $name\n" if $parrot_inline && $parrot_api;

    my @args = split( /\s*,\s*/, $args );
    for (@args) {
        /\S+\s+\S+/
            || ( $_ eq '...' )
            || ( $_ eq 'void' )
            || ( $_ =~ /(PARROT|NULLOK|SHIM)_INTERP/ )
            or die "Bad args in $proto";
    }

    my $is_ignorable = 0;
    my $is_static = 0;
    $is_static = $2 if $return_type =~ s/^((static)\s+)?//i;

    die "$file $name: Impossible to have both static and PARROT_EXPORT" if $parrot_api && $is_static;

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
    if ( $return_type =~ /\*/ ) {
        if ( !$macros{PARROT_CAN_RETURN_NULL} && !$macros{PARROT_CANNOT_RETURN_NULL} ) {
            if ( $name !~ /^yy/ ) { # Don't complain about lexer-created functions
                $self->squawk( $file, $name,
                    'Returns a pointer, but no PARROT_CAN(NOT)_RETURN_NULL macro found.' );
            }
        }
        elsif ( $macros{PARROT_CAN_RETURN_NULL} && $macros{PARROT_CANNOT_RETURN_NULL} ) {
            $self->squawk( $file, $name,
                q{Can't have both PARROT_CAN_RETURN_NULL and PARROT_CANNOT_RETURN_NULL together.} );
        }
    }

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

=item C<generate_documentation_signature>

Given an extracted function signature, return a modified
version suitable for inclusion in POD documentation.

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
    return $function_decl if length($function_decl)<= $line_len;

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
    if (@line) {
        $split_decl .= join(' ', @line) . "\n";
    }

    $split_decl =~ s/\n$//;

    return $split_decl;
}

=item C<squawk($file, $func, $error)>

Headerizer-specific ways of complaining if something went wrong.

$file => filename
$func => function name
$error => error message text

=cut

sub squawk {
    my $self  = shift;
    my $file  = shift;
    my $func  = shift;
    my $error = shift;

    push( @{ $self->{warnings}{$file}{$func} }, $error );

    return;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

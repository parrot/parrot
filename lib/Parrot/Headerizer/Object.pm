# Copyright (C) 2004-2010, Parrot Foundation.
# $Id$

package Parrot::Headerizer::Object;

=head1 NAME

Parrot::Headerizer::Object - Parrot Header Generation functionality

=head1 SYNOPSIS

    use Parrot::Headerizer::Object;

    my $headerizer = Parrot::Headerizer::Object->new();

=head1 DESCRIPTION

C<Parrot::Headerizer::Object> knows how to extract all kinds of information out
of C-language files.

=head2 Class Methods

=over 4

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
    asserts_from_args
    shim_test
    add_asserts_to_declarations
    add_headerizer_markers
);

=item C<new()>

Constructor of headerizer objects.

=cut

sub new {
    my ($class, $args) = @_;
    if (defined $args) {
        die "Argument to Parrot::Headerizer::Object must be hashref"
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
        )
    };
    return bless $args, $class;
}

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

=item C<extract_function_declarations()>

    $headerizer->extract_function_declarations($text)

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

=head2 extract_function_declaration_and_update_source( $cfile_name )

Extract all the function declarations from the C file specified by
I<$cfile_name>, and update the comment blocks within.

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

        $text =~ s/=item C<[^>]*\b$name\b[^>]*>\n+/$heading\n\n/sm or do {
            warn "$cfile_name: $name has no POD\n" unless $name =~ /^yy/; # lexer funcs don't have to have POD
        }
    }
    open( my $fhout, '>', $cfile_name ) or die "Can't create $cfile_name: $!";
    print {$fhout} $text;
    close $fhout;

    return @func_declarations;
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

=item C<valid_macro()>

    $headerizer->valid_macro( $macro )

Returns a boolean saying whether I<$macro> is a valid C<PARROT_XXX> macro.

=cut

sub valid_macro {
    my $self = shift;
    my $macro = shift;

    return exists $self->{valid_macros}{$macro};
}

=item C<valid_macros()>

    $headerizer->valid_macros()

Returns a list of all the valid C<PARROT_XXX> macros.

=cut

sub valid_macros {
    my $self = shift;

    my @macros = sort keys %{$self->{valid_macros}};

    return @macros;
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
    else { # Normal headerization and updating
        # Update all the .h files
        for my $hfile ( sort keys %sourcefiles ) {
            my $sourcefiles = $sourcefiles{$hfile};
    
            my $header = read_file($hfile);
    
            for my $cfile ( sort keys %{$sourcefiles} ) {
                my @funcs = @{ $sourcefiles->{$cfile} };
                @funcs = grep { not $_->{is_static} } @funcs;    # skip statics
                $header = $self->replace_headerized_declarations( $header, $cfile, $hfile, @funcs );
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

#    my $function_decls = join( "\n", @function_decls );
#    my $STARTMARKER    = qr{/\* HEADERIZER BEGIN: $sourcefile \*/\n};
#    my $ENDMARKER      = qr{/\* HEADERIZER END: $sourcefile \*/\n?};
#    my $DO_NOT_TOUCH   = q{/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */};
#
#    $source_code =~
#        s{($STARTMARKER)(?:.*?)($ENDMARKER)}
#         {$1$DO_NOT_TOUCH\n\n$function_decls\n$DO_NOT_TOUCH\n$2}s
#        or die "Need begin/end HEADERIZER markers for $sourcefile in $hfile\n";
#
#    return $source_code;

    my $markers_args = {
        function_decls  => \@function_decls,
        sourcefile      => $sourcefile,
        hfile           => $hfile,
        code            => $source_code,
    };
#print STDERR Dumper $markers_args;
    return add_headerizer_markers( $markers_args );
}


sub make_function_decls {
    my $self = shift;
    my @funcs = @_;

    my @decls;
    foreach my $func (@funcs) {
        my $multiline = 0;

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

        my @modified_args = shim_test($func, \@args);

        my $argline = join( ", ", @modified_args );
        if ( length( $decl . $argline ) <= 75 ) {
            $decl = "$decl$argline)";
        }
        else {
            if ( $modified_args[0] =~ /^((SHIM|PARROT)_INTERP|Interp)\b/ ) {
                $decl .= ( shift @modified_args );
                $decl .= "," if @modified_args;
            }
            $argline   = join( ",", map { "\n\t$_" } @modified_args );
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

    @decls = add_asserts_to_declarations( \@funcs, \@decls );

    return @decls;
}

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
                $self->squawk( $file, $name, qq{"$arg" isn't protected with an ARGIN, ARGOUT or ARGMOD (or a _NULLOK variant), or ARGFREE} );
            }
        }
        if ( ($arg =~ /\bconst\b/) && ($arg =~ /\*/) && ($arg !~ /\*\*/) && ($arg =~ /\b(ARG(MOD|OUT))\b/) ) {
            $self->squawk( $file, $name, qq{"$arg" is const, but that $1 conflicts with const} );
        }
    }

    return (@attrs,@mods);
}

sub print_final_message {
    my $self = shift;
    if ($self->{message} ne '') {
        print "$self->{message}\n";
    }
}

=head2 C<print_headerizer_warnings()>

=over 4

=item * Purpose

=item * Arguments

=item * Return Value

=item * Comment

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

=back

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
package Parrot::Ops2c::Utils;
use strict;
use warnings;
use lib ("lib/");
use Parrot::OpLib::core;
use Parrot::OpsFile;
use File::Spec ();
use IO::File ();

=head1 NAME

Parrot::Ops2c::Utils - Methods holding functionality for F<tools/build/ops2c.pl>.

=head1 SYNOPSIS

    $self = Parrot::Ops2c::Utils->new( {
        argv    => [ @ARGV ],
        flag    => Parrot::Ops2c::Auxiliary::getoptions(),
        script  => $0,
    } );

    $c_header_filename = $self->print_c_header_file();

    $c_source_filename = $self->print_c_source_file();

=head1 DESCRIPTION

Parrot::Ops2c::Utils provides methods called by F<tools/build/ops2c.pl>, a
program which is called at various points in the Parrot F<make> process.
The program's function is to create a pair of C header (F<*.h>) and
implementation (F<*.c>) files from the operation definitions found in
one or more F<*.ops> files.

The functionality originally found in F<tools/build/ops2c.pl> has been
extracted into this package's methods in order to support component-focused
testing and future refactoring.

=head1 METHODS

=head2 C<new()>

=over 4

=item * Purpose

Process command-line arguments provided to F<tools/build/ops2c.pl>; construct
and initialize a Parrot::Ops2c::Utils object.

=item * Arguments

Hash reference with the following elements:

    argv        :   reference to @ARGV
    flag        :   hash reference which is the return value of
                    Parrot::Ops2c::Utils::getoptions();
                    hash will have keys such as 'core', 'dynamic' or 'nolines'
    script      :   name of the script to be executed by 'make'
                    (generally, $0 or tools/build/ops2c.pl)

=item * Return Value

Parrot::Ops2c::Utils object.  At this point, the caller is ready to open a
handle to the C-header file and write to it.

=item * Comment

Arguments for the constructor have been selected so as to provide
subsequent methods with all information needed to execute properly and to be
testable.

=back

=cut

sub new {
    my ( $class, $argsref ) = @_;
    unless ( defined $argsref->{flag} ) {
        print STDERR
            "Parrot::Ops2c::Utils::new() requires reference to hash of command-line options: $!";
        return;
    }
    my $flagref = $argsref->{flag};
    my @argv    = @{ $argsref->{argv} };
    $argsref->{script} ||= "tools/build/ops2c.pl";
    unless (@argv) {
        print STDERR "Parrot::Ops2c::Utils::new() requires 'trans' options: $!";
        return;
    }
    my $class_name = shift @argv;
    my %is_allowed = map { $_ => 1 } qw(C CGoto CGP CSwitch CPrederef);
    unless ( $is_allowed{$class_name} ) {
        print STDERR
            "Parrot::Ops2c::Utils::new() requires C, CGoto, CGP, CSwitch and/or  CPrederef: $!";
        return;
    }

    my $trans_class = "Parrot::OpTrans::" . $class_name;
    eval "require $trans_class";
    my $trans = $trans_class->new();

    # Don't yet know how to test the following.
    unless ( defined $trans ) {
        print STDERR "Unable to construct $trans object: $!";
        return;
    }

    my $suffix = $trans->suffix();    # Invoked (sometimes) as ${suffix}

    my $file = $flagref->{core} ? 'core.ops' : shift @argv;
    my $base = $file;    # Invoked (sometimes) as ${base}
    $base =~ s/\.ops$//;
    my $base_ops_stub = $base . q{_ops} . $suffix;
    my $base_ops_h    = $base_ops_stub . q{.h};

    my $incdir  = "include/parrot/oplib";
    my $include = "parrot/oplib/$base_ops_h";
    my $header  = "include/$include";

    # A partially written file will confuse make -j and make error recovery
    # problematic.  create a temp file and rename it afterward.
    my $source = "src/ops/$base_ops_stub.c.temp";

    if ( $flagref->{dynamic} ) {
        $source =~ s!src/ops/!!;
        $header = $base_ops_h;
        $base =~ s!^.*[/\\]!!;
        $include = $base_ops_h;
        $flagref->{dynamic} = 1;
    }

    my $sym_export =
        $flagref->{dynamic}
        ? 'PARROT_DYNEXT_EXPORT'
        : '';

    my $ops;
    if ( $flagref->{core} ) {
        $ops = _prepare_core(
            {
                file => $file,
                flag => $flagref,
            }
        );
    }
    else {
        $ops = _prepare_non_core(
            {
                file   => $file,
                argv   => [@argv],
                flag   => $flagref,
                script => $argsref->{script},
            }
        );
    }

    my %versions = (
        major => $ops->major_version,
        minor => $ops->minor_version,
        patch => $ops->patch_version,
    );
    my $num_ops     = scalar $ops->ops;
    my $num_entries = $num_ops + 1;       # For trailing NULL
    my $preamble    = _compose_preamble( $file, $argsref->{script} );
    my $init_func   = join '_',
        ( 'Parrot', 'DynOp', $base . $suffix, @versions{qw(major minor patch)}, );

    ##### Populate the object #####
    $argsref->{argv}       = \@argv;
    $argsref->{trans}      = $trans;
    $argsref->{suffix}     = $suffix;
    $argsref->{file}       = $file;
    $argsref->{base}       = $base;
    $argsref->{incdir}     = $incdir;
    $argsref->{include}    = $include;
    $argsref->{header}     = $header;
    $argsref->{source}     = $source;
    $argsref->{sym_export} = $sym_export;

    $argsref->{ops}         = $ops;
    $argsref->{versions}    = \%versions;
    $argsref->{num_ops}     = $num_ops;
    $argsref->{num_entries} = $num_entries;

    $argsref->{preamble}     = $preamble;
    $argsref->{init_func}    = $init_func;
    $argsref->{bs}           = "$argsref->{base}$argsref->{suffix}_";
    $argsref->{opsarraytype} = $argsref->{trans}->opsarraytype();

    # Invoked as:  ${defines}
    $argsref->{defines} = $argsref->{trans}->defines();

    $argsref->{flag} = $flagref;
    my $self = bless $argsref, $class;
    $self->_iterate_over_ops();

    my ( $op_info, $op_func, $getop );
    $op_info = $op_func = 'NULL';
    $getop = '( int (*)(PARROT_INTERP, const char *, int) )NULL';

    if ($self->{suffix} eq '') {
        $op_func = $self->{bs} . "op_func_table";
        $op_info = $self->{bs} . "op_info_table";
        if (!$self->{flag}->{dynamic}) {
            $getop = 'get_op';
        }
    }
    $self->{getop}   = $getop;
    $self->{op_info} = $op_info;
    $self->{op_func} = $op_func;

    $self->{names} = {};

    return $self;
}


=head2 C<print_c_header_file()>

=over 4

=item * Purpose

Creates a C-header file corresponding to a particular op.  Such files will
have names like these:

    include/parrot/oplib/core_ops.h
    include/parrot/oplib/myops_ops_switch.h

=item * Arguments

None.  (All data needed is already in the object.)

=item * Return Value

Returns the name of the C-header file created.  You do not need to capture or
make use of this return value during production, but it has proven useful in
testing.

=item * Comment

=back

=cut

sub print_c_header_file {
    my $self = shift;

    open my $HEADER, '>', $self->{header}
        or die "ops2c.pl: Cannot open header file '$self->{header}' for writing: $!!\n";

    $self->_print_guard_prefix($HEADER);

    $self->_print_preamble_header($HEADER);

    my @op_protos = @{ $self->{op_protos} };
    foreach my $proto (@op_protos) {
        print $HEADER "$proto;\n";
    }

    $self->_print_run_core_func_decl_header($HEADER);

    $self->_print_guard_suffix($HEADER);

    _print_coda($HEADER);

    close $HEADER          or die "Unable to close handle to $self->{header}: $!";
    ( -e $self->{header} ) or die "$self->{header} not created: $!";
    ( -s $self->{header} ) or die "$self->{header} has 0 size: $!";
    return $self->{header};
}


=head2 C<print_c_source_file()>

=over 4

=item * Purpose

Writes out a C source file.  Calls print_c_source_top and print_c_source_bottom
to do the dirty work.

=item * Arguments

None.  (All data needed is already in the object.)

=item * Return Value

Returns the filename it created.  Caller need not do anything useful with this.

=back

=cut

sub print_c_source_file {
    my $self = shift;

    my $source = IO::File->new('>' . $self->{source})
        or die "ops2c.pl: Cannot open source file '$self->{source}' for writing: $!!\n";
    $self->print_c_source_top($source);

    $self->_reset_line_number($source);

    $self->print_c_source_bottom($source);

    $source->close() or die "Unable to close handle to $self->{source}: $!";

    my $c_source_final = $self->_rename_source();
    return $c_source_final;
}


=head2 C<print_c_source_top()>

=over 4

=item * Purpose

Writes the top half of a C-source file corresponding to a particular op.
Such files will have names like these:

    src/ops/core_ops.c
    src/ops/myops_ops_switch.c

=item * Arguments

None.  (All data needed is already in the object.)

=item * Return Value

Returns a still-open filehandle to the C-source file.

=item * Comment

B<Q:>  Why does this method write only the top-half of the C-source file
rather than the whole thing?

B<A:>  Mainly for convenience in maintenance and testing.
Internally, a handle is opened to the file, the file is written to, and the
handle is closed and returned.  That same handle is then re-opened, a line
count on the file so far is taken, the handle is closed, then opened again for
writing the bottom half of the source file.  There are quite a few private
methods implementing the first and last of these steps.  It made sense to
group these private methods into two public methods corresponding to the two
points where the filehandle is opened and the C-source file is written to.

B<Q:>  Why return a filehandle?

B<A:>  It is re-used as an argument to the next method.

=back

=cut

sub print_c_source_top {
    my $self = shift;
    my $SOURCE = shift;

    $self->_print_preamble_source($SOURCE);

    $self->_op_info_table($SOURCE);

    $self->_op_func_table($SOURCE);

    $self->_print_op_lib_descriptor($SOURCE);

    $self->_print_ops_addr_decl($SOURCE);

    $self->_print_run_core_func_decl_source($SOURCE);

    $self->_print_cg_jump_table($SOURCE);

    $self->_print_goto_opcode($SOURCE);

    $self->_print_op_function_definitions($SOURCE);
}


=head2 C<print_c_source_bottom()>

=over 4

=item * Purpose

Writes the bottom half of a C-source file corresponding to a particular op.

=item * Arguments

One argument:  the filehandle returned by C<print_c_source_top()>.

=item * Return Value

Returns the name of the C-source file created.  You do not need to capture or
make use of this return value during production, but it has proven useful in
testing.

=item * Comment

=back

=cut

sub print_c_source_bottom {
    my ( $self, $SOURCE ) = @_;

    $self->_op_lookup($SOURCE);

    $self->_generate_init_func($SOURCE);

    $self->_print_dynamic_lib_load($SOURCE);

    _print_coda($SOURCE);

}


sub _prepare_core {
    my $argsref = shift;
    my $ops = Parrot::OpsFile->new( [qq|src/ops/$argsref->{file}|], $argsref->{flag}->{nolines}, );
    $ops->{OPS}      = $Parrot::OpLib::core::ops;
    $ops->{PREAMBLE} = $Parrot::OpLib::core::preamble;
    return $ops;
}

sub _prepare_non_core {
    my $argsref = shift;
    my %opsfiles;
    my @opsfiles;

    foreach my $f ( $argsref->{file}, @{ $argsref->{argv} } ) {
        if ( $opsfiles{$f} ) {
            print STDERR "$argsref->{script}: Ops file '$f' mentioned more than once!\n";
            next;
        }

        $opsfiles{$f} = 1;
        push @opsfiles, $f;

        die "$argsref->{script}: Could not read ops file '$f'!\n" unless -r $f;
    }

    my $ops = Parrot::OpsFile->new( \@opsfiles, $argsref->{flag}->{nolines} );

    my $cur_code = 0;
    for my $el ( @{ $ops->{OPS} } ) {
        $el->{CODE} = $cur_code++;
    }
    return $ops;
}

sub _compose_preamble {
    my ( $file, $script ) = @_;
    my $preamble = <<END_C;
/* ex: set ro:
 * !!!!!!!   DO NOT EDIT THIS FILE   !!!!!!!
 *
 * This file is generated automatically from '$file' (and possibly other
 * .ops files). by $script.
 *
 * Any changes made here will be lost!
 *
 */

END_C
    return $preamble;
}

sub _print_preamble_header {
    my ( $self, $fh ) = @_;

    print $fh $self->{preamble};
    if ( $self->{flag}->{dynamic} ) {
        print $fh "#define PARROT_IN_EXTENSION\n";
    }
    print $fh <<END_C;
#include "parrot/parrot.h"
#include "parrot/oplib.h"

$self->{sym_export} op_lib_t *$self->{init_func}(PARROT_INTERP, long init);

END_C
    return 1;
}

sub _print_run_core_func_decl_header {
    my ( $self, $fh ) = @_;

    if ( $self->{trans}->can("run_core_func_decl") ) {
        my $run_core_func = $self->{trans}->run_core_func_decl( $self->{base} );
        print $fh "$run_core_func;\n";
        return 1;
    }
    else {
        return;
    }
}

# given a headerfile name like "include/parrot/oplib/core_ops.h", this
# returns a string like "PARROT_OPLIB_CORE_OPS_H_GUARD"
sub _generate_guard_macro_name {
    my $self = shift;
    my $fn   = $$self{header};
    $fn =~ s/\.h$//;
    my @path = File::Spec->splitdir($fn);
    shift @path if $path[0] eq 'include';
    shift @path if $path[0] eq 'parrot';
    return uc( join( '_', 'parrot', @path, 'h', 'guard' ) );

}

sub _print_guard_prefix {
    my ( $self, $fh ) = @_;
    my $guardname = $self->_generate_guard_macro_name();
    print $fh <<END_C;
#ifndef $guardname
#define $guardname

END_C
}

sub _print_guard_suffix {
    my ( $self, $fh ) = @_;
    my $guardname = $self->_generate_guard_macro_name();
    print $fh <<END_C;

#endif /* $guardname */
END_C
}

sub _print_coda {
    my $fh = shift;
    print $fh <<END_C;

/*
 * Local variables:
 *   c-file-style: "parrot"
 *   buffer-read-only: t
 * End:
 * vim: expandtab shiftwidth=4:
 */
END_C
    return 1;
}


sub _print_preamble_source {
    my ( $self, $fh ) = @_;

    print $fh $self->{preamble};
    print $fh <<END_C;
#include "$self->{include}"
#include "pmc/pmc_parrotlibrary.h"
#include "pmc/pmc_callcontext.h"

$self->{defines}

END_C

    if ( $self->{suffix} eq '' && !$self->{flag}->{dynamic} ) {
        print $fh <<END_C_2;
static int get_op(PARROT_INTERP, const char * name, int full);

END_C_2
    }
    my $text = $self->{ops}->preamble( $self->{trans} );
    $text =~ s/\bops_addr\b/$self->{bs}ops_addr/g;
    print $fh $text;
}

sub _print_ops_addr_decl {
    my ( $self, $fh ) = @_;

    if ( $self->{trans}->can("ops_addr_decl") ) {
        print $fh $self->{trans}->ops_addr_decl( $self->{bs} );
        return 1;
    }
    else {
        return;
    }
}

sub _print_run_core_func_decl_source {
    my ( $self, $fh ) = @_;

    if ( $self->{trans}->can("run_core_func_decl") ) {
        print $fh $self->{trans}->run_core_func_decl( $self->{base} );
        print $fh "\n{\n";
        print $fh $self->{trans}->run_core_func_start;
        return 1;
    }
    else {
        return;
    }
}

sub _iterate_over_ops {
    my $self = shift;
    my @op_funcs;
    my @op_protos;
    my @op_func_table;
    my @cg_jump_table;
    my $index = 0;
    my ( $prev_src, $prev_index );

    $prev_src = '';
    foreach my $op ( $self->{ops}->ops ) {
        my $func_name = $op->func_name( $self->{trans} );
        my $arg_types = "$self->{opsarraytype} *, PARROT_INTERP";
        my $prototype = "$self->{sym_export} $self->{opsarraytype} * $func_name ($arg_types)";
        my $args      = "$self->{opsarraytype} *cur_opcode, PARROT_INTERP";
        my $definition;
        my $comment = '';
        my $one_op  = "";

        if ( $self->{suffix} =~ /cg/ ) {
            $definition = "PC_$index:";
            $comment    = "/* " . $op->full_name() . " */";
        }
        elsif ( $self->{suffix} =~ /switch/ ) {
            $definition = "case $index:";
            $comment    = "/* " . $op->full_name() . " */";
        }
        else {
            $definition = "$self->{opsarraytype} *\n$func_name ($args)";
        }

        my $src = $op->source( $self->{trans} );
        $src =~ s/\bop_lib\b/$self->{bs}op_lib/g;
        $src =~ s/\bops_addr\b/$self->{bs}ops_addr/g;

        if ( $self->{suffix} =~ /cg/ ) {
            if ( $prev_src eq $src ) {
                push @cg_jump_table, "        &&PC_$prev_index,\n";
            }
            else {
                push @cg_jump_table, "        &&PC_$index,\n";
            }
        }
        elsif ( $self->{suffix} eq '' ) {
            push @op_func_table, sprintf( "  %-50s /* %6ld */\n", "$func_name,", $index );
        }
        if ( $prev_src eq $src ) {
            push @op_funcs, "$comment\n";
        }
        else {
            $one_op .= "$definition $comment {\n$src}\n\n";
            push @op_funcs,  $one_op;
            push @op_protos, $prototype;
            $prev_src = $src if ( $self->{suffix} eq '_cgp' || $self->{suffix} eq '_switch' );
            $prev_index = $index;
        }
        $index++;
    }
    $self->{index}         = $index;
    $self->{op_funcs}      = \@op_funcs;
    $self->{op_protos}     = \@op_protos;
    $self->{op_func_table} = \@op_func_table;
    $self->{cg_jump_table} = \@cg_jump_table;
}

sub _print_cg_jump_table {
    my ( $self, $fh ) = @_;

    my @cg_jump_table = @{ $self->{cg_jump_table} };

    if ( $self->{suffix} =~ /cg/ ) {
        print $fh @cg_jump_table;
        print $fh <<END_C;
        NULL
    };
END_C
        print $fh $self->{trans}->run_core_after_addr_table( $self->{bs} );
    }
    return 1;
}

sub _print_goto_opcode {
    my ( $self, $fh ) = @_;

    if ( $self->{suffix} =~ /cgp/ ) {
        print $fh <<END_C;
#ifdef __GNUC__
# ifdef I386
    else if (cur_opcode == (opcode_t *)(void **) 1)
    __asm__ ("jmp *4(%ebp)");  /* jump to ret addr, used by JIT */
# endif
#endif
    _reg_base = (char*)Parrot_pcc_get_regs_ni(interp, CURRENT_CONTEXT(interp))->regs_i;
    goto **(void **)cur_opcode;

END_C
    }
    elsif ( $self->{suffix} =~ /cg/ ) {
        print $fh <<END_C;
goto *$self->{bs}ops_addr[*cur_opcode];

END_C
    }
    return 1;
}

sub _print_op_function_definitions {
    my ( $self, $fh ) = @_;

    my @op_funcs = @{ $self->{op_funcs} };
    print $fh <<END_C;
/*
** Op Function Definitions:
*/

END_C

    # Finish the SOURCE file's array initializer:
    my $CORE_SPLIT = 300;
    for ( my $i = 0 ; $i < @op_funcs ; $i++ ) {
        if (   $i
            && $i % $CORE_SPLIT == 0
            && $self->{trans}->can("run_core_split") )
        {
            print $fh $self->{trans}->run_core_split( $self->{base} );
        }
        print $fh $op_funcs[$i];
    }

    if ( $self->{trans}->can("run_core_finish") ) {
        print $fh $self->{trans}->run_core_finish( $self->{base} );
    }
    return 1;
}

sub _reset_line_number {
    my ( $self, $fh ) = @_;

    my $source = $self->{source};
    my $line   = 0;
    my $input = IO::File->new('<' . $source)
        or die "Error re-reading $source: $!\n";
    while (<$input>) { $line++; }
    $line += 2;
    unless ( $self->{flag}->{nolines} ) {
        my $source_escaped = $source;
        $source_escaped =~ s|\.temp||;
        $source_escaped =~ s|(\\)|$1$1|g;    # escape backslashes
        print $fh qq{#line $line "$source_escaped"\n};
    }
}

sub _op_func_table {
    my ( $self, $fh ) = @_;

    if ( $self->{suffix} eq '' ) {
        print $fh <<END_C;

INTVAL $self->{bs}numops$self->{suffix} = $self->{num_ops};

/*
** Op Function Table:
*/

static op_func$self->{suffix}_t $self->{op_func}\[$self->{num_entries}] = {
END_C

        print $fh @{ $self->{op_func_table} };

        print $fh <<END_C;
  NULL /* NULL function pointer */
};


END_C
    }
}

sub _op_info_table {
    my ( $self, $fh ) = @_;

    my %names           = %{ $self->{names} };
    my %arg_dir_mapping = (
        ''   => 'PARROT_ARGDIR_IGNORED',
        'i'  => 'PARROT_ARGDIR_IN',
        'o'  => 'PARROT_ARGDIR_OUT',
        'io' => 'PARROT_ARGDIR_INOUT'
    );

    if ( $self->{suffix} eq '' ) {

        #
        # Op Info Table:
        #
        print $fh <<END_C;

/*
** Op Info Table:
*/

static op_info_t $self->{op_info}\[$self->{num_entries}] = {
END_C

        $self->{index} = 0;

        foreach my $op ( $self->{ops}->ops ) {
            my $type = sprintf( "PARROT_%s_OP", uc $op->type );
            my $name = $op->name;
            $names{$name} = 1;
            my $full_name = $op->full_name;
            my $func_name = $op->func_name( $self->{trans} );
            my $body      = $op->body;
            my $jump      = $op->jump || 0;
            my $arg_count = $op->size;

            ## 0 inserted if arrays are empty to prevent msvc compiler errors
            my $arg_types = "{ "
                . join( ", ",
                scalar $op->arg_types
                ? map { sprintf( "PARROT_ARG_%s", uc $_ ) } $op->arg_types
                : '(arg_type_t) 0'
                ) . " }";
            my $arg_dirs = "{ "
                . join(
                ", ", scalar $op->arg_dirs
                ? map { $arg_dir_mapping{$_} } $op->arg_dirs
                : '(arg_dir_t) 0'
                ) . " }";
            my $labels = "{ "
                . join(
                ", ", scalar $op->labels
                ? $op->labels
                : 0
                ) . " }";
            my $flags = 0;

            print $fh <<END_C;
  { /* $self->{index} */
    /* type $type, */
    "$name",
    "$full_name",
    "$func_name",
    /* "",  body */
    $jump,
    $arg_count,
    $arg_types,
    $arg_dirs,
    $labels,
    $flags
  },
END_C

            $self->{index}++;
        }
        print $fh <<END_C;
};

END_C
    }
    return 1;
}

sub _op_lookup {
    my ( $self, $fh ) = @_;

    if ( $self->{suffix} eq '' && !$self->{flag}->{dynamic} ) {
        my $hash_size = 3041;
        my $tot       = $self->{index} + scalar keys( %{ $self->{names} } );
        if ( $hash_size < $tot * 1.2 ) {
            print STDERR "please increase hash_size ($hash_size) in lib/Parrot/Ops2c/Utils.pm "
                . "to a prime number > ", $tot * 1.2, "\n";
        }
        print $fh <<END_C;

/*
** Op lookup function:
*/

#define NUM_OPS $self->{num_ops}

#define OP_HASH_SIZE $hash_size

/* we could calculate a prime somewhat bigger than
 * n of fullnames + n of names
 * for now this should be ok
 *
 * look up an op_code: at first call to op_code() a hash
 * of short and full opcode names is created
 * hash functions are from imcc, thanks to Melvin.
 */


typedef struct hop {
    op_info_t * info;
    struct hop *next;
} HOP;
static HOP **hop;

static void hop_init(PARROT_INTERP);
static size_t hash_str(const char *str);
static void store_op(PARROT_INTERP, op_info_t *info, int full);

/* XXX on changing interpreters, this should be called,
   through a hook */

static void hop_deinit(PARROT_INTERP);

/*
 * find a short or full opcode
 * usage:
 *
 * interp->op_lib->op_code("set", 0)
 * interp->op_lib->op_code("set_i_i", 1)
 *
 * returns >= 0 (found idx into info_table), -1 if not
 */

static size_t hash_str(const char *str) {
    size_t      key = 0;
    const char *s   = str;

    while (*s) {
        key *= 65599;
        key += *s++;
    }

    return key;
}

static void store_op(PARROT_INTERP, op_info_t *info, int full) {
    HOP * const p     = mem_gc_allocate_zeroed_typed(interp, HOP);
    const size_t hidx =
        hash_str(full ? info->full_name : info->name) % OP_HASH_SIZE;

    p->info   = info;
    p->next   = hop[hidx];
    hop[hidx] = p;
}
static int get_op(PARROT_INTERP, const char * name, int full) {
    const HOP * p;
    const size_t hidx = hash_str(name) % OP_HASH_SIZE;
    if (!hop) {
        hop = mem_gc_allocate_n_zeroed_typed(interp, OP_HASH_SIZE,HOP *);
        hop_init(interp);
    }
    for (p = hop[hidx]; p; p = p->next) {
        if(STREQ(name, full ? p->info->full_name : p->info->name))
            return p->info - $self->{bs}op_lib.op_info_table;
    }
    return -1;
}
static void hop_init(PARROT_INTERP) {
    size_t i;
    op_info_t * const info = $self->{bs}op_lib.op_info_table;
    /* store full names */
    for (i = 0; i < $self->{bs}op_lib.op_count; i++)
        store_op(interp, info + i, 1);
    /* plus one short name */
    for (i = 0; i < $self->{bs}op_lib.op_count; i++)
        if (get_op(interp, info[i].name, 0) == -1)
            store_op(interp, info + i, 0);
}
static void hop_deinit(PARROT_INTERP)
{
    if (hop) {
        size_t i;
        for (i = 0; i < OP_HASH_SIZE; i++) {
            HOP *p = hop[i];
            while (p) {
                HOP * const next = p->next;
                mem_gc_free(interp, p);
                p = next;
            }
        }
        mem_sys_free(hop);
        hop = NULL;
    }
}

END_C
    }
    else {
        print $fh <<END_C;
static void hop_deinit(SHIM_INTERP) {}
END_C
    }
    return 1;
}

sub _print_op_lib_descriptor {
    my ( $self, $fh ) = @_;

    my $core_type = $self->{trans}->core_type();
    print $fh <<END_C;

/*
** op lib descriptor:
*/

static op_lib_t $self->{bs}op_lib = {
  "$self->{base}",               /* name */
  "$self->{suffix}",             /* suffix */
  $core_type,                       /* core_type = PARROT_XX_CORE */
  0,                                /* flags */
  $self->{versions}->{major},    /* major_version */
  $self->{versions}->{minor},    /* minor_version */
  $self->{versions}->{patch},    /* patch_version */
  $self->{num_ops},              /* op_count */
  $self->{op_info},              /* op_info_table */
  $self->{op_func},              /* op_func_table */
  $self->{getop}                 /* op_code() */
};

END_C
    return 1;
}

sub _generate_init_func {
    my ( $self, $fh ) = @_;

    my $init1_code = "";
    if ( $self->{trans}->can("init_func_init1") ) {
        $init1_code = $self->{trans}->init_func_init1( $self->{base} );
    }

    my $init_set_dispatch = "";
    if ( $self->{trans}->can("init_set_dispatch") ) {
        $init_set_dispatch = $self->{trans}->init_set_dispatch( $self->{bs} );
    }

    print $fh <<END_C;
op_lib_t *
$self->{init_func}(PARROT_INTERP, long init) {
    /* initialize and return op_lib ptr */
    if (init == 1) {
$init1_code
        return &$self->{bs}op_lib;
    }
    /* set op_lib to the passed ptr (in init) */
    else if (init) {
$init_set_dispatch
    }
    /* deinit - free resources */
    else {
        hop_deinit(interp);
    }
    return NULL;
}

END_C
    return 1;
}

sub _print_dynamic_lib_load {
    my ( $self, $fh ) = @_;

    if ( $self->{flag}->{dynamic} ) {
        my $load_func = join q{_},
            ( q{Parrot}, q{lib}, $self->{base}, ( q{ops} . $self->{suffix} ), q{load}, );
        print $fh <<END_C;
/*
 * dynamic lib load function - called once
 */
$self->{sym_export} PMC*
$load_func(PARROT_INTERP);

$self->{sym_export} PMC*
$load_func(PARROT_INTERP)
{
    PMC *const lib = Parrot_pmc_new(interp, enum_class_ParrotLibrary);
    ((Parrot_ParrotLibrary_attributes*)PMC_data(lib))->oplib_init = (void *) $self->{init_func};
    dynop_register(interp, lib);
    return lib;
}
END_C
    }
    return 1;
}

sub _rename_source {
    my $self = shift;

    my $final = $self->{source};
    $final =~ s/\.temp//;
    rename $self->{source}, $final
        or die "Unable to rename $self->{source} to $final: $!";
    return $final;
}

1;

=head1 DEPENDENCIES

=over 4

=item * Parrot::OpsFile

=item * Parrot::OpLib::core

This package is not part of the Parrot distribution.  It is created during
Parrot's F<make> process before the first invocation of F<tools/build/ops2c.pl>.

=back

=head1 AUTHOR

See F<tools/build/ops2c.pl> for a list of the Parrot hackers who, over a
period of several years, developed the functionality now found in the methods
of Parrot::Ops2c::Utils.  Jim Keenan extracted that functionality and placed
it in this package's methods.

=head1 SEE ALSO

=over 4

=item * F<tools/build/ops2c.pl>

=item * Parrot::OpsFile

=item * Parrot::Ops2c::Auxiliary

=back

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

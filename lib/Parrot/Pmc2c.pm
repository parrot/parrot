# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Pmc2c - PMC to C Code Generation

=head1 SYNOPSIS

	use Parrot::Pmc2c;

=head1 DESCRIPTION

C<Parrot::Pmc2c> (and the L<subclasses|/SUBCLASSES> defined in this
file) is used by F<classes/pmc2c2.pl> to generate C code from PMC files.

=head2 Functions

=over

=cut

package Parrot::Pmc2c;
use strict;
use vars qw(@EXPORT_OK @writes %writes );

use base qw( Exporter );
@EXPORT_OK = qw(gen_c gen_h gen_ret dynext_load_code);

BEGIN {
    @writes = qw(STORE PUSH POP SHIFT UNSHIFT DELETE);
    @writes{@writes} = (1) x @writes;
};

use Text::Balanced 'extract_bracketed';

=item C<does_write($method, $section)>

Returns whether a method writes.

=cut

sub does_write($$) {
    my ($meth, $section) = @_;
    warn "no $meth\n" unless $section;
    exists $writes{$section} || $meth eq 'morph';
}

=item C<count_newlines($string)>

Returns the number of newlines (C<\n>) in C<$string>.

=cut

sub count_newlines {
    return scalar(() = $_[0] =~ /\n/g);
}

=item C<gen_ret($method, $body)>

Generate the C code for a C<return> statement, if the body is empty then
make a cast if needed.

This method is imported by subclasses.

=cut

sub gen_ret {
    my ($method, $body) = @_;
    my $ret;
    if ($body) {
        $ret = $method->{type} eq 'void' ? "$body;" : "return $body;" ;
    }
    else {
        $ret = $method->{type} eq 'void' ? "" : "return ($method->{type})0;";
    }
    $ret;
}

=item C<class_name($self, $class)>

Returns the appropriate C<Parrot::Pmc2c> subclass for the PMC (C<<
$self->{class} >>). C<$self> is the hash reference passed to C<new()>,
and C<$class> is C<Parrot::Pmc2c>.

=cut

sub class_name {
    my ($self, $class) = @_;
    my %special = ( 'Ref' => 1, 'default' => 1, 'Null' => 1,
                    'delegate' => 1, 'SharedRef' => 1 );
    my $classname = $self->{class};
    my $nclass = $class;
    # bless object into different classes inheriting from
    # Parrot::Pmc2c
    if ($special{$classname}) {
        $nclass .= "::" . $classname;
    }
    else {
        $nclass .= "::Standard";
    }
    $nclass;
}

=item C<dynext_load_code($classname, $call_class_init)>

C<$classname> is the name of a PMC.

C<$call_class_init> is the C code for a call to the PMC's class
initialization method.

This function is exported.

=cut

sub dynext_load_code {
    my ($classname, $call_class_init ) = @_;
    my $lc_classname = lc $classname;
    return <<"EOC";
/*
 * This load function will be called to do global (once) setup
 * whatever is needed to get this extension running
 */
#include "parrot/dynext.h"

PMC* Parrot_lib_${lc_classname}_load(Interp *interpreter)
{
    STRING *whoami;
    PMC *pmc;
    INTVAL type;

    /*
     * create a library PMC
     */
    pmc = pmc_new(interpreter, enum_class_ParrotLibrary);
    /*
     * TODO stuff some info into this PMCs props
     */

    /*
     * for all PMCs we want to register:
     */
    whoami = string_from_cstring(interpreter, "$classname", 0);
    type = pmc_register(interpreter, whoami);
    /* do class_init code */
    $call_class_init

    return pmc;
}

EOC
}

=back

=head2 Class Methods

=over

=item C<new($self, $opt)>

Returns C<$self> as a new instance.

C<$self> is a hash reference C<eval>-ed from a F<*.dump> file generated
by F<classes/pmc2c.pl> from a F<*.pmc> file. It is C<bless>-ed either into
C<Parrot::Pmc2c::::Standard>, or into one of the other I<special> PMCs:
F<default>, C<delegate>, C<Null>, C<Ref> or C<SharedRef>.

C<$opt> is a hash reference.

=cut

sub new {
    my $this = shift;
    my $class = ref($this) || $this;
    my $self = shift;
    $self->{opt} = shift;
    $class = class_name($self, $class);
    bless $self, $class;
    $self->init($class);
    $self;
}

=back

=head2 Instance Methods

=over

=item C<get_vtable_section()>

Creates a hash of all the method names containing vtable section. Called
from C<init()>.

=cut

sub get_vtable_section() {
    my $self = shift;
    #  make a hash of all method names containing vtable section
    my $vt = $self->{vtable};
    foreach my $entry (@{ $vt->{methods} } ) {
	$self->{all}{$entry->{meth}} = $entry->{section};
    }
}

=item C<make_const($class)>

If the PMC had its C<const_too> flag set then this method is called in
C<init()> to to create the read-only set methods.

=cut

sub make_const() {
    my ($self, $class) = @_;
    my $const = bless {}, $class . '::Const';
    $self->{const} = $const;
    my @methods = @{ $self->{methods} };
    # copy super
    $const->{super} = { %{ $self->{super} } };
    my $i;
    foreach my $entry (@methods) {
	my $meth = $entry->{meth};
	if (does_write($meth, $self->{all}{$meth})) {
            # create methods if they write
            $const->{has_method}{$meth} = $i++;
	    push @{ $const->{methods} }, {
		meth => "$meth",
		type => $entry->{type},
		parameters => $entry->{parameters}
	    };
	}
        else {
            # if not - they are inherited from $self
            $const->{super}{$meth} = $self->{class};
        }
    }
    # copy parent(s), prepend self as parrent
    $const->{parents} = [ $self->{class}, @{ $self->{parents} } ];
    # copy flags, set is_const
    $const->{flags} = {is_const => 1, %{ $self->{flags} } };
    delete $const->{flags}{const_too};
    # set const in does
    $const->{flags}{does}{const} = 1;
    # set classname
    $const->{class} = "Const" . $self->{class};
    # and alias vtable
    $const->{vtable} = $self->{vtable};
    # set parentname
    $const->{parentname} = $self->{class};

}

=item C<init($class)>

Initializes the instance. C<$class> is its class.

=cut

sub init() {
    my ($self, $class) = @_;
    $self->get_vtable_section();
    $self->make_const($class) if $self->{flags}{const_too};

}

=item C<dont_edit($pmcfile)>

Returns the "DO NOT EDIT THIS FILE" warning text. C<$pmcfile> is the name
of the original source F<*.pmc> file.

=cut

sub dont_edit() {
    my ($self, $pmcfile) = @_;
    return <<"EOC";
/*
 * !!!!!!!   DO NOT EDIT THIS FILE   !!!!!!!
 *
 * This file is generated automatically from '$pmcfile'
 * by $0.
 *
 * Any changes made here will be lost!
 *
 */

EOC
}

=item C<decl($classname, $method, $for_header)>

Returns the C code for the PMC method declaration. C<$for_header>
indicates whether the code is for a header or implementation file.

=cut

sub decl() {
    my ($self, $classname, $method, $for_header) = @_;
    my $ret = $method->{type};
    my $meth= $method->{meth};
    my $args= $method->{parameters};
    $args = ", $args" if $args =~ /\S/;
    my ($extern, $newl, $semi, $interp, $pmc);
    if ($for_header) {
	$extern = "extern ";
	$newl = " ";
	$semi = ";";
        $interp = $pmc = "";
    }
    else {
	$extern = "";
	$newl = "\n";
	$semi = "";
        $interp = ' interpreter';
        $pmc = ' pmc';
    }
    return <<"EOC";
$extern$ret${newl}Parrot_${classname}_$meth(Parrot_Interp$interp, PMC*$pmc$args)$semi
EOC
}

=item C<includes()>

Returns the C C<#include> for the header file of each of the PMC's
superclasses.

=cut

sub includes() {
    my $self = shift;
    my $cout = "";
    foreach my $parents ($self->{class}, @{ $self->{parents} } ) {
	my $name = lc $parents;
	$cout .= <<"EOC";
#include "pmc_$name.h"
EOC
    }
    "$cout\n";
}

=item C<full_arguments($args)>

Prepends C<INTERP, SELF> to C<$args>.

=cut

sub full_arguments {
    my $args = shift;
    if ($args =~ /\S/) {
        return "INTERP, SELF, $args";
    } else {
        return "INTERP, SELF";
    }
}

=item C<rewrite_method($class, $method, $super, $super_table)>

Rewrites the method body performing the various macro subsitiutions for
vtable method bodies (see F<classes/pmc2c.pl>).

=cut

sub rewrite_method ($$$$$) {
    my ($class, $method, $super, $super_table) = @_;
    local $_ = $_[4];

    # Rewrite method body
    my $supertype = "enum_class_$super";
    die "$class defines unknown vtable method '$method'\n"
      if ! defined $super_table->{$method};
    my $supermethod = "Parrot_" . $super_table->{$method} . "_$method";

    # Rewrite DYNSUPER(args...)
    s/DYNSUPER\(\s*(.*?)\)/"Parrot_base_vtables[$supertype].$method(".full_arguments($1).")"/eg;

    # Rewrite OtherClass.SUPER(args...)
    s/(\w+)\.SUPER\(\s*(.*?)\)/"Parrot_${1}_$method(".full_arguments($2).")"/eg;

    # Rewrite SUPER(args...)
    s/SUPER\(\s*(.*?)\)/"$supermethod(".full_arguments($1).")"/eg;

    # Rewrite DYNSELF.other_method(args...)
    s/DYNSELF\.(\w+)\(\s*(.*?)\)/"pmc->vtable->$1(".full_arguments($2).")"/eg;

    # Rewrite DYNSELF(args...). See comments above.
    s/DYNSELF\(\s*(.*?)\)/"pmc->vtable->$method(".full_arguments($1).")"/eg;

    # Rewrite OtherClass.SELF.other_method(args...)
    s/(\w+)\.SELF\.(\w+)\(\s*(.*?)\)/"Parrot_${1}_$2(".full_arguments($3).")"/eg;

    # Rewrite SELF.other_method(args...)
    s/SELF\.(\w+)\(\s*(.*?)\)/"Parrot_${class}_$1(".full_arguments($2).")"/eg;

    # Rewrite SELF -> pmc, INTERP -> interpreter
    s/SELF/pmc/g;
    s/\bINTERP\b/interpreter/g;

    # now use macros for all rewritten stuff
    s/\b(?:\w+)->vtable->(\w+)\(/ VTABLE_$1(/g;

    return $_;
}

=item C<body($method)>

Returns the C code for the method body.

=cut

sub body
{
    my ($self, $method) = @_;
    my $cout = "";
    my $classname = $self->{class};
    my $pmc = lc($classname) .'.pmc';
    my $meth = $method->{meth};
    unless ($self->{opt}{nolines}) {
        $cout .= <<"EOC";
#line $method->{line} "$pmc"
EOC
    }
    $cout .= $self->decl($classname, $method, 0);
    my $body = $method->{body};
    $body =~ s/^\t/        /mg;
    $body =~ s/^[ ]{4}//mg;
    my $super = $self->{super}{$meth};
    my $total_body = rewrite_method($classname, $meth, $super,
                      $self->{super}, $body);
    # now split into MMD if necessary:
    my $additional_bodies= '';
    $total_body = substr $total_body, 1, -1;
    my $standard_body = $total_body;
    while ($total_body =~ s/\bMMD_(\w+):\s*//) {
        my $right_type = $1;
        my $body_part = extract_bracketed($total_body, '{');
        $body_part = substr($body_part, 1, -1);
        if ($right_type eq 'DEFAULT') {
            $standard_body = $body_part
        }
        else {
            my $sub_meth_decl = $self->decl($classname, $method);
            $sub_meth_decl =~ /(\w+)\(/;
            my $sub_meth_name = $1;
            my $sub_meth = "static " . $sub_meth_decl;
            $sub_meth =~ s/\(/_$right_type(/;
            $additional_bodies .= $sub_meth;
            $additional_bodies .= "{$body_part\n}";
            push @{ $self->{mmd_variants}{$meth} },
                [ $right_type, $sub_meth_name ];
        }

    }
    $cout .= "{$standard_body\n}\n";
    $cout .= $additional_bodies;
    $cout .= "\n\n";
}

=item C<methods($line)>

Returns the C code for the vtable methods. C<$line> is used to accumulate
the number of lines.

=cut

sub methods() {
    my ($self, $line) = @_;
    my $cout = "";

    foreach my $method (@{ $self->{vtable}{methods}} ) {
        my $meth = $method->{meth};
        next if $meth eq 'class_init';
        if ($self->implements($meth)) {
            my $ret = $self->body($method, $line);
            $line += count_newlines($ret);
            $cout .= $ret;
        }
    }
    $cout;
}

=item C<lib_load_code()>

Returns the C code for loading a library.

=cut

sub lib_load_code() {
    my $self = shift;
    my $classname = $self->{class};
    # TODO multiple (e.g. Const subclasses)
    my $call_class_init =
        "Parrot_${classname}_class_init(interpreter, type);\n";
    return dynext_load_code($classname, $call_class_init);
}

=item C<init_func()>

Returns the C code for the PMC's initialization method, or an empty
string if the PMC has a C<no_init> flag.

=cut

sub init_func() {
    my $self = shift;
    my $cout = "";
    return "" if exists $self->{flags}{noinit};

    # TODO gen C line comment
    my $classname = $self->{class};
    my $vtbl_flag =  $self->{flags}{const_too} ?
        'VTABLE_HAS_CONST_TOO' : $self->{flags}{is_const} ?
	  'VTABLE_IS_CONST_FLAG' : 0;
    if (exists $self->{flags}{need_ext}) {
        $vtbl_flag .= '|VTABLE_PMC_NEEDS_EXT';
    }
    if (exists $self->{flags}{singleton}) {
        $vtbl_flag .= '|VTABLE_PMC_IS_SINGLETON';
    }
    if (exists $self->{flags}{is_shared}) {
        $vtbl_flag .= '|VTABLE_IS_SHARED_FLAG';
    }
    my (@meths, @mmds);
    foreach my $method (@{ $self->{vtable}{methods}} ) {
        my $meth = $method->{meth};
        my $meth_name;
        if ($self->implements($meth)) {
            $meth_name = "Parrot_${classname}_$meth";
        }
        elsif (exists $self->{super}{$meth}) {
            my $class = $self->{super}{$meth};
            $meth_name = "Parrot_${class}_$meth";
        }
        else {
            $meth_name = "Parrot_default_$meth";
        }
        unless ($method->{mmd} =~ /MMD_BXOR/) {
            push @meths, $meth_name;  # for now push even MMDs
            # except BXOR for testing
        }
        if ($method->{mmd} =~ /MMD_/) {
            my ($func, $left, $right);
            $func = $method->{mmd};
            $left = "enum_class_$classname";
            $right = 0;
            push @mmds, [ $func, $left, $right, $meth_name ];
            foreach my $variant (@{ $self->{mmd_variants}{$meth} }) {
                $right = "enum_class_$variant->[0]";
                $meth_name = $variant->[1] . '_' .$variant->[0];
                push @mmds, [ $func, $left, $right, $meth_name];
            }

        }
    }
    my $methlist = join(",\n        ", @meths);
    my $mmd_list = join(",\n        ", map {
        "{ $_->[0], $_->[1], $_->[2],
                    (funcptr_t) $_->[3] }" } @mmds);
    # XXX mmd_default - old cruft
    $mmd_list = '/* N/Y */' if $classname =~ /^(mmd_default|Integer|Float)$/;
    my $isa = join(" ", $classname, @{ $self->{parents} });
    $isa =~ s/\s?default$//;
    my $does = join(" ", keys(%{ $self->{flags}{does} }));
    my $n = exists $self->{has_method}{class_init} ?
                   $self->{has_method}{class_init} : -1;
    my $class_init_code = $n >= 0 ? $self->{methods}[$n]{body} : "";
    $class_init_code =~ s/INTERP/interp/g;
    $cout .= <<"EOC";
void
Parrot_${classname}_class_init(Parrot_Interp interp, int entry)
{
    struct _vtable temp_base_vtable = {
        NULL,	/* package */
        enum_class_$classname,	/* base_type */
        NULL,	/* whoami */
        $vtbl_flag, /* flags */
        NULL,   /* does_str */
        NULL,   /* isa_str */
        NULL, /* extra data */
        $methlist
    };
EOC

    $cout .= <<"EOC" if $mmd_list ne '/* N/Y */';

    const struct {
        INTVAL func_nr;
        INTVAL left, right;
        funcptr_t func_ptr;
    } _temp_mmd_init[] = {
        $mmd_list
    };
EOC
    $cout .= <<"EOC";
    int i;

    /*
     * parrotio calls some class_init functions during its class_init
     * code, so some of the slots might already be allocated
     */
    if (!Parrot_base_vtables[entry]) {
	temp_base_vtable.whoami = string_make(interp,
	    "$classname", @{[length($classname)]}, "iso-8859-1",
            PObj_constant_FLAG|PObj_external_FLAG);
	temp_base_vtable.isa_str = string_make(interp,
	    "$isa", @{[length($isa)]}, "iso-8859-1",
            PObj_constant_FLAG|PObj_external_FLAG);
	temp_base_vtable.does_str = string_make(interp,
	    "$does", @{[length($does)]}, "iso-8859-1",
            PObj_constant_FLAG|PObj_external_FLAG);

	Parrot_base_vtables[entry] =
	    Parrot_clone_vtable(interp, &temp_base_vtable);
    }
EOC
    $cout .= <<"EOC" if $mmd_list ne '/* N/Y */';
    /*
     * register mmds
     */
    #define N_MMD_INIT (sizeof(_temp_mmd_init)/sizeof(_temp_mmd_init[0]))
    for (i = 0; i < (int)N_MMD_INIT; ++i) {
        mmd_register(interp,
            _temp_mmd_init[i].func_nr,
            _temp_mmd_init[i].left,
            _temp_mmd_init[i].right,
            _temp_mmd_init[i].func_ptr);
    }
EOC
    $cout .= <<"EOC";
    $class_init_code
} /* Parrot_${classname}_class_init */
EOC
    if ($self->{flags}{dynpmc}) {
        $cout .= $self->lib_load_code();
    }
    $cout;
}

=item C<gen_c($file)>

Generates the C implementation file code for the PMC.

C<$file> is the name of the original source F<*.pmc> file.

=cut

sub gen_c() {
    my ($self, $file) = @_;
    my $cout = $self->dont_edit($file);
    $cout .= $self->{pre};
    $cout .= $self->includes;
    my $l = count_newlines($cout);
    $cout .= $self->methods($l);
    $cout .= $self->init_func;
    if ($self->{const}) {
        $cout .= $self->{const}->methods($l);
        $cout .= $self->{const}->init_func;
    }
    $cout .= $self->{post};
    $cout;
}

=item C<hdecls()>

Returns the C code function declarations for all the methods for inclusion
in the PMC's C header file.

=cut

sub hdecls() {
    my $self = shift;
    my $hout;
    my $classname = $self->{class};
    # generat decls for all methods in this file
    foreach my $meth (@{ $self->{vtable}{methods} } ) {
        if ($self->implements($meth->{meth})) {
            $hout .= $self->decl($classname, $meth, 1);
        }
    }
    # class init decl
    $hout .= <<"EOC";
void Parrot_${classname}_class_init(Parrot_Interp, int);
EOC
    $hout;
}

=item C<gen_h($file)>

Generates the C header file code for the PMC.

C<$file> is the name of the original source F<*.pmc> file.

=cut

sub gen_h() {
    my ($self, $file) = @_;
    my $hout = $self->dont_edit($file);
    my $name = uc $self->{class};
    $hout .= <<"EOH";

#ifndef PARROT_PMC_${name}_H_GUARD
#define PARROT_PMC_${name}_H_GUARD

EOH

    $hout .= $self->hdecls();
    if ($self->{const}) {
        $self = $self->{const};
        $hout .= "\n/* Const */\n";
        $hout .= $self->hdecls();
    }
    $hout .= <<"EOH";

#endif

EOH
    $hout;
}

=item C<implements($method)>

True if this class generates code for C<$method>.

=cut

sub implements
{
    my ($self, $meth) = @_;
    return exists $self->{has_method}{$meth};
}

=back

=head1 SUBCLASSES

=head2 Parrot::Pmc2c::Standard Instance Methods

Standard behavior.

=over 4

=cut

package Parrot::Pmc2c::Standard;
use base 'Parrot::Pmc2c';

=item C<body($method)>

Returns the C code for the method body.

=cut

sub body
{
    my ($self, $method) = @_;
    my $meth = $method->{meth};
    my $n = $self->{has_method}{$meth};
    return $self->SUPER::body($self->{methods}[$n]);
}

=back

=head2 Parrot::Pmc2c::Standard::Const Instance Methods

Returns the C code for the method body.

=over 4

=cut

package Parrot::Pmc2c::Standard::Const;
use base 'Parrot::Pmc2c::Standard';
import Parrot::Pmc2c qw( gen_ret );

=item C<body($method)>

Overrides the default implementation to throw exception if the method
writes.

=cut

sub body {
    my ($self, $method) = @_;
    my $meth = $method->{meth};

    my $decl = $self->decl($self->{class}, $method, 0);
    my $classname = $self->{class};
    my $parentname = $self->{parentname};
    my $ret = gen_ret($method);
    my $cout = <<"EOC";
$decl {
EOC
    if ($meth eq 'morph') {
        $cout .= <<EOC;
    if (Parrot_is_const_pmc(interpreter, pmc))
	internal_exception(WRITE_TO_CONSTCLASS,
		"$meth() in $classname");
    else
        Parrot_${parentname}_$meth(interpreter, pmc, type);
EOC
    }
    else {
        $cout .= <<EOC;
	internal_exception(WRITE_TO_CONSTCLASS,
		"$meth() in $classname");
        $ret
EOC
    }
    $cout .= <<"EOC";
}

EOC
    $cout;
}

=back

=head2 Parrot::Pmc2c::Ref Instance Methods

=over 4

=cut

package Parrot::Pmc2c::Ref;
use base 'Parrot::Pmc2c';
import Parrot::Pmc2c qw( gen_ret );

=item C<implements($method)>

Always true.

=cut

sub implements
{
    1;
}

=item C<body($method, $line)>

Returns the C code for the method body.

Overrides the default implementation to direct all unknown methods to
the thing referred to.

=cut

sub body
{
    my ($self, $method, $line) = @_;
    my $meth = $method->{meth};
    # existing methods get emitted
    if ($self->SUPER::implements($meth)) {
        my $n = $self->{has_method}{$meth};
        return $self->SUPER::body($self->{methods}[$n]);
    }
    my $parameters = $method->{parameters};
    my $n=0;
    my @args = grep {$n++ & 1 ? $_ : 0} split / /, $parameters;
    my $arg = '';
    $arg = ", ". join(' ', @args) if @args;
    $parameters = ", $parameters" if $parameters;
    my $body = "VTABLE_$meth(interpreter, PMC_pmc_val(pmc)$arg)";
    my $ret = gen_ret($method, $body);
    my $decl = $self->decl($self->{class}, $method, 0);
    my $l = "";
    unless ($self->{opt}{nolines}) {
        $l = <<"EOC";
#line $line "ref.c"
EOC
    }
    return <<EOC;
$l
$decl {
    $ret
}

EOC
}

=back

=head2 Parrot::Pmc2c::SharedRef Instance Methods

C<SharedRef> is like C<Ref> but with locking.

=over 4

=cut

package Parrot::Pmc2c::SharedRef;
use base 'Parrot::Pmc2c';

=item C<implements($method)>

Always true.

=cut

sub implements
{
    1;
}

=item C<gen_ret($type)>

Generate the C code for a C<return> statement.

=cut

sub gen_ret
{
    my ($self, $type) = @_;
    return "ret_val = ";
}

=item C<body($method, $line)>

Returns the C code for the method body.

Overrides the default implementation to perform locking.

=cut

sub body
{
    my ($self, $method, $line) = @_;
    my $meth = $method->{meth};
    # existing methods get emitted
    if ($self->SUPER::implements($meth)) {
        my $n = $self->{has_method}{$meth};
        return $self->SUPER::body($self->{methods}[$n]);
    }
    my $parameters = $method->{parameters};
    my $n=0;
    my @args = grep {$n++ & 1 ? $_ : 0} split / /, $parameters;
    my $arg = '';
    $arg = ", ". join(' ', @args) if @args;
    $parameters = ", $parameters" if $parameters;
    my $body = "VTABLE_$meth(interpreter, PMC_pmc_val(pmc)$arg)";
    my $ret = '';
    my $decl = $self->decl($self->{class}, $method, 0);
    my $l = "";
    my $ret_def = '';
    my $func_ret = '(void) ';
    if ($method->{type} ne 'void') {
        my $type = $method->{type};
        $ret_def = "$type ret_val;";
        $func_ret = $self->gen_ret($method->{type});
        $ret = "return ret_val;";
    }
    unless ($self->{opt}{nolines}) {
        $l = <<"EOC";
#line $line "sharedref.c"
EOC
    }
    return <<EOC;
$l
$decl {
    $ret_def
    LOCK_PMC(interpreter, pmc);
    $func_ret$body;
    UNLOCK_PMC(interpreter, pmc);
    $ret
}

EOC
}

=back

=head2 Parrot::Pmc2c::default Instance Methods

=over 4

=cut

package Parrot::Pmc2c::default;
use base 'Parrot::Pmc2c';
import Parrot::Pmc2c qw( gen_ret );

=item C<implements($method)>

Always true.

=cut

sub implements
{
    1;
}

=item C<body($method, $line)>

Returns the C code for the method body.

Overrides the default implementation to throw an execption for unknown
methods.

=cut

sub body
{
    my ($self, $method, $line) = @_;
    my $meth = $method->{meth};
    # existing methods get emitted
    if ($self->SUPER::implements($meth)) {
        my $n = $self->{has_method}{$meth};
        return $self->SUPER::body($self->{methods}[$n]);
    }
    my $decl = $self->decl($self->{class}, $method, 0);
    my $l = "";
    my $ret = gen_ret($method);
    unless ($self->{opt}{nolines}) {
        $l = <<"EOC";
#line $line "default.c"
EOC
    }
    return <<EOC;
$l
${decl} {
	internal_exception(ILL_INHERIT,
		"$meth() not implemented in class '%s'",
		caller(interpreter, pmc));
        $ret
}

EOC
}

=back

=head2 Parrot::Pmc2c::Null Instance Methods

=over 4

=cut

package Parrot::Pmc2c::Null;
use base 'Parrot::Pmc2c';
import Parrot::Pmc2c qw( gen_ret );

=item C<implements($method)>

Always true.

=cut

sub implements
{
    1;
}

=item C<body($method, $line)>

Returns the C code for the method body.

The C<Null> PMC throws an execption for all methods.

=cut

sub body
{
    my ($self, $method, $line) = @_;
    my $meth = $method->{meth};
    my $decl = $self->decl($self->{class}, $method, 0);
    my $l = "";
    my $ret = gen_ret($method);
    unless ($self->{opt}{nolines}) {
        $l = <<"EOC";
#line $line "null.c"
EOC
    }
    return <<EOC;
$l
${decl} {
	internal_exception(NULL_REG_ACCESS,
		"Null PMC access in $meth()");
        $ret
}

EOC
}

=back

=head2 Parrot::Pmc2c::delegate Instance Methods

=over 4

=cut

package Parrot::Pmc2c::delegate;
use base 'Parrot::Pmc2c';

=item C<implements($method)>

Always true.

=cut

sub implements
{
    1;
}

=item C<trans($type)>

Used in C<signature()> to normalize argument types.

=cut

sub trans
{
    my ($self, $type) = @_;
    my $char = substr $type, 0, 1;
    return $1 if ($char =~ /([ISP])/);
    return 'N' if ($char eq 'F');
    return 'v' if ($type eq 'void');
    return '?';
}

=item C<signature($params)>

Returns the method signature for C<$params>.

=cut

sub signature
{
    my ($self, $params) = @_;
    my $n=1;
    my @types = grep {$n++ & 1 ? $_ : 0} split / /, $params;
    @types = map { $self->trans($_) } @types;
    return join '', @types;
}

=item C<gen_ret($type)>

Generate the C code for a C<return> statement.

=cut

sub gen_ret
{
    my ($self, $type) = @_;
    #return "ret_val = *($1*) " if ($type =~ /((?:INT|FLOAT)VAL)/);
    return "ret_val = ($type) ";
}

=item C<body($method, $line)>

Returns the C code for the method body.

The C<delegate> PMC redirects all methods to bytecode.

=cut

sub body
{
    my ($self, $method, $line) = @_;
    my $meth = $method->{meth};
    # existing methods get emitted
    if ($self->SUPER::implements($meth)) {
        my $n = $self->{has_method}{$meth};
        return $self->SUPER::body($self->{methods}[$n]);
    }
    my $decl = $self->decl($self->{class}, $method, 0);
    my $parameters = $method->{parameters};
    my $n=0;
    my @args = grep {$n++ & 1 ? $_ : 0} split / /, $parameters;
    my $arg = '';
    $arg = ", ". join(' ', @args) if @args;
    my $sig = $self->signature($parameters);
    $sig = $self->trans($method->{type}) . $sig;
    my $l = "";
    my $ret = '';
    my $ret_def = '';
    my $func_ret = '(void) ';
    my $ret_type = '';
    if ($method->{type} ne 'void') {
        my $type = $method->{type};
        $ret_def = "$type ret_val;";
        $func_ret = $self->gen_ret($method->{type});
        $ret = "return ret_val;";
        if ($type !~ /\*/) {
            $ret_type = "_ret" . lc substr $type, 0, 1;
            $ret_type = "_reti" if $ret_type eq '_retu';
        }
    }
    my $umeth = uc $meth;
    my $delegate_meth = "PARROT_VTABLE_${umeth}_METHNAME";
    unless ($self->{opt}{nolines}) {
        $l = <<"EOC";
#line $line "delegate.c"
EOC
    }
    return <<EOC;
$l
${decl} {
    $ret_def
    STRING *meth = const_string(interpreter, $delegate_meth);
    PMC *sub = find_or_die(interpreter, pmc, meth);
    ${func_ret}Parrot_run_meth_fromc_args_save$ret_type(interpreter, sub,
        pmc, meth, "$sig"$arg);
    $ret
}

EOC
}

=back

=head1 SEE ALSO

=over 4

=item F<classes/pmc2c2.pl>

=back

=cut

# vim: expandtab shiftwidth=4:
1;

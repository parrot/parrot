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
use Parrot::PMC qw(%pmc_types);

use base qw( Exporter );
@EXPORT_OK = qw(gen_c gen_h gen_ret dynext_load_code count_newlines);

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
    return scalar $_[0] =~ tr/\n//;
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
                    'delegate' => 1, 'SharedRef' => 1,
                    'deleg_pmc' => 1,
                );
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

=item C<dynext_load_code($library_name, %classes)>

C<$library_name> is the name of the dynamic library to be created.

C<%classes> is a map from the PMC names for which code is to be generated,
to dump info (PMC metadata).

This function is exported.

=cut

sub dynext_load_code {
    my ($libname, %classes ) = @_;
    my $lc_libname = lc $libname;
    my $cout;

    $cout .= <<"EOC";
/*
 * This load function will be called to do global (once) setup
 * whatever is needed to get this extension running
 */
#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "parrot/dynext.h"

EOC
    for my $class (keys %classes) {
        my $lc_class = lc $class;
        $cout .= <<"EOC";
#include "pmc_${lc_class}.h"
EOC
    }
    $cout .= <<"EOC";

extern Parrot_PMC Parrot_lib_${lc_libname}_load(Parrot_INTERP interpreter); /* don't warn */
Parrot_PMC Parrot_lib_${lc_libname}_load(Parrot_INTERP interpreter)
{
    Parrot_STRING whoami;
    Parrot_PMC pmc;
EOC
    while (my ($class, $info) = each %classes) {
	next if $info->{flags}->{noinit};
        $cout .= <<"EOC";
    Parrot_Int type${class};
EOC
    }
    $cout .= <<"EOC";
    int pass;

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
EOC
    while (my ($class, $info) = each %classes) {
	my $lhs = $info->{flags}->{noinit} ? "" : "type$class = ";
        $cout .= <<"EOC";
    whoami = string_from_cstring(interpreter, "$class", 0);
    ${lhs}pmc_register(interpreter, whoami);
EOC
    }
    $cout .= <<"EOC";

    /* do class_init code */
    for (pass = 0; pass <= 1; ++pass) {
EOC
    while (my ($class, $info) = each %classes) {
	next if $info->{flags}->{noinit};
        my $lc_class = lc $class;
        $cout .= <<"EOC";
        Parrot_${class}_class_init(interpreter, type$class, pass);
EOC
    }
    $cout .= <<"EOC";
    }

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
		parameters => $entry->{parameters},
                loc => $entry->{loc}
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
$extern$ret${newl}Parrot_${classname}_$meth(Interp*$interp, PMC*$pmc$args)$semi
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
    if (!$self->{flags}{dynpmc}) {
	    my $name = lc $self->{class};
	    $cout .= <<"EOC";
#include "$name.str"
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

=item C<proto($type,$parameters)>

Determines the prototype (argument signature) for a method body
(see F<src/call_list>).

=cut

my %calltype = (
  "char"     => "c",
  "short"    => "s",
  "char"     => "c",
  "short"    => "s",
  "int"      => "i",
  "INTVAL"   => "i",
  "float"    => "f",
  "FLOATVAL" => "f",
  "double"   => "d",
  "STRING*"  => "t",
  "char*"    => "t",
  "PMC*"     => "P",
  "short*"   => "2",
  "int*"     => "3",
  "long*"    => "4",
  "void"     => "v",
  "void*"    => "b",
  "void**"   => "B",
  #"BIGNUM*" => "???" # XXX
);

sub proto ($$) {
    my ($type, $parameters) = @_;

    # reduce to a comma separated set of types
    $parameters =~ s/\w+(,|$)/,/g;
    $parameters =~ s/ //g;

    # type method(interpreter, self, parameters...)
    my $ret = $calltype{$type or "void"};
    $ret .= "IO";
    $ret .= join('', map {$calltype{$_} or "?"} split(/,/, $parameters));
    # TODO
    # scan src/call_list.txt if the generated signature is available
    # TODO report errors for "?"
    # --leo

    return $ret;
}

=item C<rewrite_nci_method($class, $method, $super, $super_table)>

Rewrites the method body performing the various macro substitutions for
nci method bodies (see F<classes/pmc2c.pl>).

=cut

sub rewrite_nci_method ($$$) {
    my ($class, $method) = @_;
    local $_ = $_[2];
    # Rewrite SELF -> pmc, INTERP -> interpreter
    s/SELF/pmc/g;
    s/\bINTERP\b/interpreter/g;

    return $_;
}

=item C<rewrite_vtable_method($class, $method, $super, $super_table)>

Rewrites the method body performing the various macro substitutions for
vtable method bodies (see F<classes/pmc2c.pl>).

=cut

sub rewrite_vtable_method ($$$$$) {
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
    my $body = $method->{body};
    $body =~ s/^\t/        /mg;
    $body =~ s/^[ ]{4}//mg;
    my $super = $self->{super}{$meth};

    my $total_body;
    if ($method->{loc} eq 'vtable') {
        $total_body = rewrite_vtable_method($classname, $meth, $super,
                       $self->{super}, $body);
    }
    else {
        $total_body = rewrite_nci_method($classname, $meth, $body);
    }

    # now split into MMD if necessary:
    my $additional_bodies= '';
    $total_body = substr $total_body, 1, -1;
    my $standard_body = $total_body;
    my $header_decls = '';
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
            my $sub_meth =  $sub_meth_decl;   # no "static ." ...
            $sub_meth =~ s/\(/_$right_type(/;
            $header_decls .= <<EOH;
$sub_meth;
EOH
            $additional_bodies .= $sub_meth;
            $additional_bodies .= "{$body_part\n}";
            push @{ $self->{mmd_variants}{$meth} },
                [ $right_type, $sub_meth_name ];
        }

    }
    $cout .= $header_decls;
    $cout .= $self->decl($classname, $method, 0);
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

    # vtable methods
    foreach my $method (@{ $self->{vtable}{methods}} ) {
        my $meth = $method->{meth};
        next if $meth eq 'class_init';
        if ($self->implements($meth)) {
            my $ret = $self->body($method, $line);
            $line += count_newlines($ret);
            $cout .= $ret;
        }
    }

    # nci methods
    foreach my $method (@{ $self->{methods}} ) {
        next unless $method->{loc} eq 'nci';
        my $ret = $self->body($method, $line);
        $line += count_newlines($ret);
        $cout .= $ret;
    }

    $cout;
}

=item C<lib_load_code()>

Returns the C code for loading a library.

=cut

sub lib_load_code() {
    my $self = shift;
    my $classname = $self->{class};
    return dynext_load_code($classname, $classname => {});
}

=item C<pmc_is_dynpmc>

Determines if a given PMC type is dynamically loaded or not.

=cut

sub pmc_is_dynpmc {
    # surely core PMCs aren't dynamic
    return exists($pmc_types{$_[1]}) ? 0 : 1;
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
    my (@meths, @mmds, @init_mmds, %init_mmds);
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
        unless ($method->{mmd} =~ /MMD_/) {
            push @meths, $meth_name;  # for now push even MMDs
            # except BXOR for testing
        }
        if ($method->{mmd} =~ /MMD_/) {
            my ($func, $left, $right);
            $func = $method->{mmd};
            # dynamic classes need the runtime type
            # which is passed in entry to class_init
            $left = 0;  # set to 'entry' below in initialization loop.
            $right = 0;
            push @mmds, [ $func, $left, $right, $meth_name ];
            foreach my $variant (@{ $self->{mmd_variants}{$meth} }) {
                if ($self->pmc_is_dynpmc($variant->[0])) {
                    $right = 'enum_class_default';
                    push @init_mmds, [$#mmds + 1, $variant->[0]];
                    $init_mmds{$variant->[0]} = 1;
                }
                else {
                    $right = "enum_class_$variant->[0]";
                }
                $meth_name = $variant->[1] . '_' .$variant->[0];
                push @mmds, [ $func, $left, $right, $meth_name];
            }
        }
    }
    my $methlist = join(",\n        ", @meths);
    my $mmd_list = join(",\n        ", map {
        "{ $_->[0], $_->[1], $_->[2],
                    (funcptr_t) $_->[3] }" } @mmds);
    my $isa = join(" ", $classname, @{ $self->{parents} });
    $isa =~ s/\s?default$//;
    my $does = join(" ", keys(%{ $self->{flags}{does} }));
    my $n = exists $self->{has_method}{class_init} ?
                   $self->{has_method}{class_init} : -1;
    my $class_init_code = $n >= 0 ? $self->{methods}[$n]{body} : "";
    $class_init_code =~ s/INTERP/interp/g;
    my $enum_name = $self->{flags}{dynpmc} ? -1 : "enum_class_$classname";
    $cout .= <<"EOC";
void
Parrot_${classname}_class_init(Parrot_Interp interp, int entry, int pass)
{
    const struct _vtable temp_base_vtable = {
        NULL,	/* package */
        $enum_name,	/* base_type */
        NULL,	/* whoami */
        $vtbl_flag, /* flags */
        NULL,   /* does_str */
        NULL,   /* isa_str */
        NULL, /* extra data */
        $methlist
    };
EOC

    $cout .= <<"EOC";

    const MMD_init _temp_mmd_init[] = {
        $mmd_list
    };
    /*  Dynamic classes need the runtime type
	which is passed in entry to class_init.
    */
EOC
    # declare auxiliary variables for dyncpmc IDs
    foreach my $dynclass (keys %init_mmds) {
        next if $dynclass eq $classname;
        $cout .= <<"EOC";
    int my_enum_class_$dynclass = Parrot_PMC_typenum(interp, "$dynclass");
EOC
    }
    # init MMD "right" slots with the dynpmc types
    foreach my $entry (@init_mmds) {
        if ($entry->[1] eq $classname) {
            $cout .= <<"EOC";
    _temp_mmd_init[$entry->[0]].right = entry;
EOC
        }
        else {
            $cout .= <<"EOC";
    _temp_mmd_init[$entry->[0]].right = my_enum_class_$entry->[1];
EOC
        }
    }
    # just to be safe
    foreach my $dynclass (keys %init_mmds) {
        next if $dynclass eq $classname;
        $cout .= <<"EOC";
    assert(my_enum_class_$dynclass != enum_class_default);
EOC
    }
    $cout .= <<"EOC";
    if (pass == 0) {
EOC
    $cout .= <<"EOC";
        /*
         * Parrot_base_vtables is a true global - register just once
         */
        if (!Parrot_base_vtables[entry]) {
            struct _vtable *vt_clone =
                Parrot_clone_vtable(interp, &temp_base_vtable);

EOC
    # init vtable slot
    if ($self->{flags}{dynpmc}) {
        $cout .= <<"EOC";
            vt_clone->base_type = entry;
            vt_clone->whoami = string_make(interp,
                "$classname", @{[length($classname)]}, "iso-8859-1",
                PObj_constant_FLAG|PObj_external_FLAG);
            vt_clone->isa_str = string_make(interp,
                "$isa", @{[length($isa)]}, "iso-8859-1",
                PObj_constant_FLAG|PObj_external_FLAG);
            vt_clone->does_str = string_make(interp,
                "$does", @{[length($does)]}, "iso-8859-1",
                PObj_constant_FLAG|PObj_external_FLAG);
EOC
    }
    else {
        $cout .= <<"EOC";
            vt_clone->whoami = CONST_STRING(interp, "$classname");
            vt_clone->isa_str = CONST_STRING(interp, "$isa");
            vt_clone->does_str = CONST_STRING(interp, "$does");
EOC
    }
    $cout .= <<"EOC";
            Parrot_base_vtables[entry] = vt_clone;
        }
EOC
    $cout .= <<"EOC";
    } /* pass */
EOC

    # declare each nci method for this class
    my $firstnci = 1;
    foreach my $method (@{ $self->{methods} }) {
      next unless $method->{loc} eq 'nci';
      my $proto = proto($method->{type}, $method->{parameters});
      $cout .= <<"EOC" if $firstnci;
    if (pass) {
EOC
      $cout .= <<"EOC";
        enter_nci_method(interp, enum_class_${classname},
                F2DPTR(Parrot_${classname}_$method->{meth}),
                "$method->{meth}", "$proto");
EOC
      $firstnci = 0;
    }
      $cout .= <<"EOC" unless $firstnci;
    }
EOC

    # include any class specific init code from the .pmc file
    $cout .= <<"EOC";
    $class_init_code
    if (pass == 1) {
EOC

    # declare auxiliary variables for dyncpmc IDs
    foreach my $dynclass (keys %init_mmds) {
        next if $dynclass eq $classname;
        $cout .= <<"EOC";
        int my_enum_class_$dynclass = Parrot_PMC_typenum(interp, "$dynclass");
EOC
    }
    # init MMD "right" slots with the dynpmc types
    foreach my $entry (@init_mmds) {
        if ($entry->[1] eq $classname) {
            $cout .= <<"EOC";
        _temp_mmd_init[$entry->[0]].right = entry;
EOC
        }
        else {
            $cout .= <<"EOC";
        _temp_mmd_init[$entry->[0]].right = my_enum_class_$entry->[1];
EOC
        }
    }
    # just to be safe
    foreach my $dynclass (keys %init_mmds) {
        next if $dynclass eq $classname;
        $cout .= <<"EOC";
        assert(my_enum_class_$dynclass != enum_class_default);
EOC
    }
    $cout .= <<"EOC";
#define N_MMD_INIT (sizeof(_temp_mmd_init)/sizeof(_temp_mmd_init[0]))
        Parrot_mmd_register_parents(interp, entry,
            _temp_mmd_init, N_MMD_INIT);
    }
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

TODO include MMD variants.

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
    foreach my $method (@{ $self->{methods}} ) {
        next unless $method->{loc} eq 'nci';
        $hout .= $self->decl($classname, $method, 1);
    }
    # class init decl
    $hout .= <<"EOC";
void Parrot_${classname}_class_init(Parrot_Interp, int, int);
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
    my $ret = "";
    if ($method->{type} ne 'void') {
        # This cheats, assuming that all return types can be cast from zero.
        $ret = "return ($method->{type})0;";
    }
    my $l = "";
    unless ($self->{opt}{nolines}) {
        $l = <<"EOC";
#line $line "default.c"
EOC
    }
    return <<EOC;
$l
${decl}\{
    cant_do_method(interpreter, pmc, "$meth");
    ${ret}
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
    STRING *meth = CONST_STRING(interpreter, "__$meth");
    PMC *sub = find_or_die(interpreter, pmc, meth);
    ${func_ret}Parrot_run_meth_fromc_args$ret_type(interpreter, sub,
        pmc, meth, "$sig"$arg);
    $ret
}

EOC
}

package Parrot::Pmc2c::deleg_pmc;
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
the PMC in the first attribute slot.

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
    my $body = "VTABLE_$meth(interpreter, attr$arg)";
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
    SLOTTYPE *attrib_array = PMC_data(pmc);
    PMC *attr = get_attrib_num(attrib_array, POD_FIRST_ATTRIB);
    $ret
}

EOC
}

=back

=head1 Parrot::Pmc2c::Library

This class is a wrapper around a collection of PMCs linked in the same
dynamic library. A degenerate case is having an unnamed library with just ne
PMC, which is the case used by the Parrot core.

=head2 Parrot::Pmc2c::Library Instance Methods

=over 4

=cut

package Parrot::Pmc2c::Library;

=item C<new($opt, $vtable_dump, %pmcs)

    $library = Parrot::Pmc2c::Library->new
        ( $options,     # hash refernce, the same passet to other constructors
          $vtable_dump, # vtable.dump
          pmc1        => $pmc1_dump,
          pmc2        => $pmc2_dump,
          ... );

Creates a new library object. If the C<$options> hash contains a
C<library> key its value will be used for the library name.

=cut

sub new {
    my ($class, $opt, $vtable_dump) = (shift, shift, shift);
    my %pmcs = @_;

    foreach my $file (keys %pmcs) {
        $pmcs{$file}->{vtable} = $vtable_dump;
        $pmcs{$file} = Parrot::Pmc2c->new($pmcs{$file}, $opt);
    }

    return bless { opt         => $opt,
                   pmcs        => \%pmcs,
                 }, $class;
}

=item C<write_all_files()>

Writes C and header files for all the PMCs in the library,
plus E<lt>libnameE<gt>.c and pmc_E<lt>libnameE<gt>.h if his object
represents a named library.

=cut

sub write_all_files {
    my $self = shift;
    my %opt = %{$self->{opt}};
    my $library = $opt{library} ? 1 : 0;

    if (!$library) {
    while (my @fc = each %{$self->{pmcs}}) {
        my ($file, $generator) = @fc;
	print Data::Dumper->Dump([$generator]) if $opt{debug} > 1;

	my $hout = $generator->gen_h($file);
        print $hout if $opt{debug};
        my $h;
        ($h = $file) =~ s/\.\w+$/.h/;
        $h =~ s/(\w+)\.h$/pmc_$1.h/;
        print "Writing $h\n" if $opt{verbose};
        open H, ">$h" or die "Can't write '$h";
        print H $hout;
        close H;
	my $cout = $generator->gen_c($file);
        print $cout if $opt{debug};
        my $c;
        ($c = $file) =~ s/\.\w+$/.c/;
        print "Writing $c\n" if $opt{verbose};
        open C, ">$c" or die "Can't write '$c";
        print C $cout;
        close C;
    }

    }
    else {
	my $hout = $self->gen_h($opt{library});
        my $h = "$opt{library}.h";
        print "Writing $h\n" if $opt{verbose};
        open H, ">$h" or die "Can't write '$h";
        print H $hout;
        close H;
	my $cout = $self->gen_c($opt{library});
        print $cout if $opt{debug};
        my $c = "$opt{library}.c";
        print "Writing $c\n" if $opt{verbose};
        open C, ">$c" or die "Can't write '$c";
        print C $cout;
        close C;
    }
}

=item C<gen_h>

Writes the header file for the library.

=cut

sub gen_h {
    my ($self, $file) = @_;
    my $hout = Parrot::Pmc2c->dont_edit('various files');
    my $lc_libname = lc $self->{opt}{library};

    $hout .= <<"EOH";
Parrot_PMC Parrot_lib_${lc_libname}_load(Parrot_INTERP interpreter);
EOH

    return $hout;
}

=item C<gen_c>

Writes the C file for the library.

=cut

sub gen_c {
    my ($self, $file) = @_;
    my $cout = Parrot::Pmc2c->dont_edit('various files');

    $cout .= Parrot::Pmc2c::dynext_load_code($self->{opt}{library},
                                             map { $_->{class} => $_ }
                                                 values %{$self->{pmcs}} );

    return $cout;
}

=back

=head1 SEE ALSO

=over 4

=item F<classes/pmc2c2.pl>

=back

=cut

# vim: expandtab shiftwidth=4:
1;

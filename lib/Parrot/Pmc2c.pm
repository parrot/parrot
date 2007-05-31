# Copyright (C) 2004-2006, The Perl Foundation.
# $Id$

=head1 NAME

Parrot::Pmc2c - PMC to C Code Generation

=head1 SYNOPSIS

    use Parrot::Pmc2c;

=head1 DESCRIPTION

C<Parrot::Pmc2c> is used by F<tools/build/pmc2c.pl> to generate C code from PMC files.

=head2 Functions

=over

=cut

package Parrot::Pmc2c;
use strict;
use warnings;
use Parrot::PMC qw(%pmc_types);
use Parrot::Pmc2c::UtilFunctions
    qw( gen_ret dont_edit count_newlines dynext_load_code c_code_coda );
use Text::Balanced 'extract_bracketed';
use Parrot::Pmc2c::PCCMETHOD;

=back

=head2 Class Methods

=over

=item C<new($self, $opt)>

Returns C<$self> as a new instance.

C<$self> is a hash reference C<eval>-ed from a F<*.dump> file generated
by F<tools/build/pmc2c.pl> from a F<*.pmc> file. It is C<bless>-ed either into
C<Parrot::Pmc2c::Standard>, or into one of the other I<special> PMCs:
F<default>, C<delegate>, C<Null>, C<Ref> or C<SharedRef>.

C<$opt> is a hash reference.

=cut

my %special_class_name =
    map { ( $_, 1 ) } qw( STMRef Ref default Null delegate SharedRef deleg_pmc );

sub new {
    my ( $this, $self, $options ) = @_;
    $self->{opt} = $options;

    #determine blessed classname
    my $this_classname = ref($this) || $this;
    my $classname      = $self->{class};
    my $suffix         = $special_class_name{$classname} ? $classname : "Standard";
    $classname = $this_classname . "::" . $suffix;

    bless $self, $classname;
    $self->init();
    $self;
}

=back

=head2 Instance Methods

=over

=item C<does_write($method)>

Returns true if the vtable method C<$method> writes our value.

=cut

sub does_write {
    my ( $self, $method_name ) = @_;

    my $attrs;
    if ( $self->{has_method}{$method_name} ) {
        $attrs = $self->{methods}[ $self->{has_method}{$method_name} ]->{attrs};
    }
    elsif ( $self->{super}{$method_name} ) {
        $attrs = $self->{super_attrs}{$method_name};
    }

    return 1 if $attrs->{write};
    return 0 if $attrs->{read};

    return $self->{attrs}{$method_name}{write};
}

=item C<line_directive($self,$line,$file)>

Generates the C pre processor string for a #line directive, or an empty string
if C<$self->{opt}{nolines}> is true.

=cut

sub line_directive {
    my ( $self, $line, $file ) = @_;

    return '' if $self->{opt}{nolines};
    if ( defined $file ) {
        my $file_escaped = $file;
        $file_escaped =~ s|(\\)|$1$1|g;    # escape backslashes
        return qq{#line $line "$file_escaped"\n};
    }
    return qq{#line $line\n};
}

=item C<line_directive_here($self,$output,$file)>

Generates the C pre processor string for a #line directive to reset the
compiler's line number to the next physical line in the output.

=cut

sub line_directive_here {
    my ( $self, $output, $file ) = @_;

    # Compilers count lines from 1, and on the 1st line there are no preceding
    # newlines, so *this* line is (number of newlines plus one).
    # But that's the number for *this* line (the #line directive) and we're
    # about to set the number for the next line. So + 1 again.
    return $self->line_directive( 1 + 1 + count_newlines($output), $file );
}

=item C<make_constlike($type, $is_variant)>

Create a variant for Const or RO.

=cut

sub make_constlike {
    my ( $self, $type, $prefix ) = @_;

    $prefix = "$type" unless defined $prefix;

    my $const = bless {}, ref($self) . "::$type";
    {

        # autogenerate for exotic types
        # (XXX is this appropriate or do we want them to each
        # be explicitly cleared to have the variant?)
        no strict 'refs';
        if ( !@{ ref($const) . '::ISA' } ) {
            @{ ref($const) . '::ISA' } = "Parrot::Pmc2c::Standard::\u$type";
        }
    }
    my @methods = @{ $self->{methods} };

    # copy super
    $const->{super} = { %{ $self->{super} } };
    my $i;

    # FIXME support getting implementations from central superclass instead
    # (e.g. some ro_fail pseudoclass that generates an exception)
    foreach my $entry ( @{ $self->{vtable}{methods} } ) {
        my $meth = $entry->{meth};
        if ( $self->does_write($meth) ) {
            $const->{has_method}{$meth} = $i++;
            push @{ $const->{methods} },
                {
                meth       => $meth,
                type       => $entry->{type},
                parameters => $entry->{parameters},
                loc        => 'vtable',
                };
        }
        else {
            if ( $self->implements($meth) ) {
                $const->{super}{$meth} = $self->{class};
            }
            else {
                $const->{super}{$meth} = $self->{super}{$meth};
            }
        }
    }

    # copy parent(s), prepend self as parrent
    $const->{parents} = [ $self->{class}, @{ $self->{parents} } ];

    # copy flags, set is_const
    $const->{flags} = { %{ $self->{flags} } };

    # set classname
    $const->{class} = $prefix . $self->{class};

    # and alias vtable
    $const->{vtable} = $self->{vtable};

    # set parentname
    $const->{parentname} = $self->{class};
    return $const;
}

=item C<make_const()>

If the PMC had its C<const_too> flag set then this method is called in
C<init()> to to create the read-only set methods.

=cut

sub make_const {
    my ($self) = @_;
    my $const = $self->make_constlike('Const');
    $self->{const} = $const;
    $const->{flags}->{is_const} = 1;
    delete $const->{flags}{const_too};

    # set const in does
    $const->{flags}{does}{const} = 1;
}

=item C<make_ro()>

If the PMC doesn't have C<const_too> set (FIXME?) then this method is called
to create the read-only set methods and vtable variant.

=cut

sub make_ro {
    my ($self) = @_;
    my $ro = $self->make_constlike( 'RO', '' );
    $self->{flags}{has_ro} = 1;
    $self->{ro} = $ro;
    delete $ro->{flags}->{has_ro};
    $ro->{flags}->{is_ro} = 1;
    $ro->{variant} = '_ro';
}

=item C<init()>

Initializes the instance.

=cut

sub init {
    my ($self) = @_;

    # XXX FIXME unused?
    #Creates a hash of all the method names correspdoning vtable section.
    #Creates a hash of all the method names correspdoning to their attributes.
    foreach my $entry ( @{ $self->{vtable}->{methods} } ) {
        $self->{all}{ $entry->{meth} }   = $entry->{section};
        $self->{attrs}{ $entry->{meth} } = $entry->{attr};
    }

    if ( $self->{flags}{const_too} ) {
        $self->make_const;
    }
    elsif ( $self->{flags}{abstract} ) {
    }
    elsif ( $self->{flags}{singleton} ) {

        # Since singletons are shared between interpreters, we need to make special effort to use
        # the right namespace for method lookups.
        #
        # Note that this trick won't work if the singleton inherits from something else
        # (because the MRO will still be shared).
        unless ( $self->implements('pmc_namespace') or $self->{super}{'pmc_namespace'} ne 'default' ) {
            push @{ $self->{methods} },
                {
                meth       => 'pmc_namespace',
                parameters => '',
                body       => '{ return INTERP->vtables[SELF->vtable->base_type]->_namespace; }',
                loc        => 'vtable',
                mmds       => [],
                type       => 'PMC*',
                line       => 1,
                attrs      => {},
                };
            $self->{has_method}{pmc_namespace} = $#{ $self->{methods} };
        }
    }

    #!( const_too or singleton or abstract ) everything else gets readonly version of methods too.
    else {
        $self->make_ro;
    }
}

=item C<decl($classname, $method, $for_header)>

Returns the C code for the PMC method declaration. C<$for_header>
indicates whether the code is for a header or implementation file.

=cut

sub decl {
    my ( $self, $classname, $method, $for_header ) = @_;

    my $ret     = $method->{type};
    my $meth    = $method->{meth};
    my $args    = $method->{parameters};
    my $variant = $self->{variant} || "";
    $args = ", $args" if $args =~ /\S/;
    my ( $export, $extern, $newl, $semi, $interp, $pmc );
    if ($for_header) {
        $export = $self->{flags}->{dynpmc} ? 'PARROT_DYNEXT_EXPORT ' : 'PARROT_API ';
        $extern = "extern ";
        $newl   = " ";
        $semi   = ";";
        $interp = $pmc = "";
    }
    else {
        $export = "";
        $extern = "";
        $newl   = "\n";
        $semi   = "";
        $interp = 'interp';
        $pmc    = ' pmc';
    }
    return <<"EOC";
$export$extern$ret${newl}Parrot_${classname}${variant}_$meth(Interp *$interp, PMC*$pmc$args)$semi
EOC
}

=item C<includes()>

Returns the C C<#include> for the header file of each of the PMC's
superclasses.

=cut

sub includes {
    my $self = shift;

    my $cout = <<"EOC";
#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "parrot/dynext.h"
EOC

    $cout .= qq{#include "pmc_fixedintegerarray.h"\n} if ( $self->{flags}->{need_fia_header} );
    foreach my $parents ( $self->{class}, @{ $self->{parents} } ) {
        my $name = lc $parents;
        $cout .= qq{#include "pmc_$name.h"\n};
    }
    if ( !$self->{flags}{dynpmc} ) {
        my $name = lc $self->{class};
        $cout .= qq{#include "$name.str"\n};
    }
    "$cout\n";
}

=item C<full_arguments($args)>

Prepends C<INTERP, SELF> to C<$args>.

=cut

sub full_arguments {
    my $args = shift;
    my $obj = shift || 'SELF';

    if ( $args =~ m/\S/ ) {
        return "INTERP, $obj, $args";
    }
    else {
        return "INTERP, $obj";
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
    "INTVAL"   => "I",
    "float"    => "f",
    "FLOATVAL" => "N",
    "double"   => "d",
    "STRING*"  => "S",
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

sub proto {
    my ( $type, $parameters ) = @_;

    # reduce to a comma separated set of types
    $parameters =~ s/\w+(,|$)/,/g;
    $parameters =~ s/ //g;

    # type method(interp, self, parameters...)
    my $ret = $calltype{ $type or "void" };
    $ret .= "JO" . join( '', map { $calltype{$_} or "?" } split( /,/, $parameters ) );

    # TODO
    # scan src/call_list.txt if the generated signature is available
    # TODO report errors for "?"
    # --leo

    return $ret;
}

=item C<rewrite_nci_method($self, $class, $method, $super, $super_table)>

Rewrites the method body performing the various macro substitutions for
nci method bodies (see F<tools/build/pmc2c.pl>).

=cut

sub rewrite_nci_method {
    my ( $self, $class, $method ) = @_;

    local $_ = $_[3];

    # Rewrite DYNSELF.other_method(args...)
    s/\bDYNSELF\b           # Macro: DYNSELF
      \.(\w+)           # other_method
      \(\s*(.*?)\)      # capture argument list
     /"pmc->vtable->$1(" . full_arguments($2) . ')'/xeg;

    # Rewrite SELF.other_method(args...)
    s/\bSELF\b              # Macro SELF
      \.(\w+)           # other_method
      \(\s*(.*?)\)      # capture argument list
     /"Parrot_${class}" .
      ($self->is_vtable_method($1) ? "" : "_nci") .
      "_$1(" . full_arguments($2) . ")"/xeg;

    # Rewrite SELF -> pmc, INTERP -> interp
    s/\bSELF\b/pmc/g;
    s/\bINTERP\b/interp/g;

    return $_;
}

=item C<rewrite_vtable_method($self, $class, $method, $super, $super_table)>

Rewrites the method body performing the various macro substitutions for
vtable method bodies (see F<tools/build/pmc2c.pl>).

=cut

sub rewrite_vtable_method {
    my ( $self, $class, $method, $super, $super_table ) = @_;
    local $_ = $_[5];

    # Rewrite method body
    my $supertype = "enum_class_$super";
    die "$class defines unknown vtable method '$method'\n"
        unless defined $super_table->{$method};
    my $supermethod = "Parrot_" . $super_table->{$method} . "_$method";

    # Rewrite DYNSUPER(args)
    s/\bDYNSUPER\b          # Macro: DYNSUPER
      \(\s*(.*?)\)      # capture argument list
     /"interp->vtables[$supertype].$method(" . full_arguments($1) . ')'/xeg;

    # Rewrite OtherClass.SUPER(args...)
    s/(\w+)             # capture OtherClass
      \.SUPER\b           # Macro: SUPER
      \(\s*(.*?)\)      # capture argument list
     /"Parrot_${1}_$method(" . full_arguments($2) . ')'/xeg;

    # Rewrite SUPER(args...)
    s/\bSUPER\b             # Macro: SUPER
      \(\s*(.*?)\)      # capture argument list
     /"$supermethod(" . full_arguments($1) . ')'/xeg;

    # Rewrite DYNSELF.other_method(args...)
    s/\bDYNSELF\b           # Macro: DYNSELF
      \.(\w+)           # other_method
      \(\s*(.*?)\)      # capture argument list
     /"pmc->vtable->$1(" . full_arguments($2) . ')'/xeg;

    # Rewrite DYNSELF(args...). See comments above.
    s/\bDYNSELF\b           # Macro: DYNSELF
      \(\s*(.*?)\)      # capture argument list
     /"pmc->vtable->$method(" . full_arguments($1) . ')'/xeg;

    # Rewrite OtherClass.SELF.other_method(args...)
    s/(\w+)             # OtherClass
      \.\bSELF\b            # Macro SELF
      \.(\w+)           # other_method
      \(\s*(.*?)\)      # capture argument list
     /"Parrot_${1}" .
      ($self->is_vtable_method($2) ? "" : "_nci") .
      "_$2(" . full_arguments($3) . ')'/xeg;

    # Rewrite OtherClass.object.other_method(args...)
    s/(\w+)             # OtherClass
      \.\b(\w+)\b       # any object
      \.(\w+)           # other_method
      \(\s*(.*?)\)      # capture argument list
     /"Parrot_${1}" .
      ($self->is_vtable_method($3) ? "" : "_nci") .
      "_$3(" . full_arguments($4, $2) . ')'/xeg;

    # Rewrite SELF.other_method(args...)
    s/\bSELF\b              # Macro SELF
      \.(\w+)           # other_method
      \(\s*(.*?)\)      # capture argument list
     /"Parrot_${class}" .
      ($self->is_vtable_method($1) ? "" : "_nci") .
      "_$1(" . full_arguments($2) . ")"/xeg;

    # Rewrite SELF -> pmc, INTERP -> interp
    s/\bSELF\b/pmc/g;
    s/\bINTERP\b/interp/g;

    # now use macros for all rewritten stuff
    s/\b(?:\w+)->vtable->(\w+)\(/ VTABLE_$1(/g;

    return $_;
}

=item C<body($method, $line, $out_name)>

Returns the C code for the method body. C<$line> is used to accumulate
the number of lines, C<$out_name> is the name of the output file we are
generating.

=cut

sub body {
    my ( $self, $method, $line, $out_name ) = @_;

    my $cout      = "";
    my $classname = $self->{class};
    my $meth      = $method->{meth};
    my $body      = $method->{body};
    $body =~ s/^\t/        /mg;
    $body =~ s/^[ ]{4}//mg;
    my $super = $self->{super}{$meth};

    my $total_body;
    if ( $method->{loc} eq 'vtable' ) {
        $total_body =
            $self->rewrite_vtable_method( $classname, $meth, $super, $self->{super}, $body );
    }
    else {
        $total_body = $self->rewrite_nci_method( $classname, $meth, $body );
    }
    Parrot::Pmc2c::PCCMETHOD::rewrite_pccinvoke( $method, \$total_body );

    # now split into MMD if necessary:
    my $additional_bodies = '';
    $total_body = substr $total_body, 1, -1;
    my $standard_body = $total_body;
    while ( $total_body =~ s/\bMMD_(\w+):\s*// ) {
        my $right_type = $1;
        my $body_part = extract_bracketed( $total_body, '{' );
        die "Empty MMD body near '$total_body'" if ( !$body_part );
        $body_part = substr( $body_part, 1, -1 );
        $body_part =~ s/\n(\s*)$//s;
        if ( $right_type eq 'DEFAULT' ) {
            $standard_body = $body_part;
        }
        else {
            my $sub_meth_decl = $self->decl( $classname, $method );
            my $sub_meth_decl_h = $self->decl( $classname, $method, 1 );
            $sub_meth_decl =~ /(\w+)\(/;
            my $sub_meth_name = $1;
            my $sub_meth      = $sub_meth_decl;    # no "static ." ...
            $sub_meth        =~ s/\(/_$right_type(/;
            $sub_meth_decl_h =~ s/\(/_$right_type(/;
            $self->{hdecls} .= <<EOH;
$sub_meth_decl_h
EOH
            $additional_bodies .= $sub_meth;
            $additional_bodies .= "{$body_part\n}";
            push @{ $self->{mmd_variants}{$meth} }, [ $right_type, $sub_meth_name ];
        }

    }

    $cout .= $self->decl( $classname, $method, 0 );

    if ( exists $method->{pre_block} ) {
        $cout .= $method->{pre_block};

        # This is the part that comes from the PMC file.
        $cout .= $self->line_directive( $method->{line}, $self->{file} );
        $cout .= $standard_body;
        $cout .= $method->{post_block};
        $cout .= "\n}\n";
    }
    else {

        # This is the part that comes from the PMC file.
        $cout .= $self->line_directive( $method->{line}, $self->{file} );
        $cout .= "{$standard_body\n}\n";
    }

    # We are back to generated code immediately here
    $cout .= $self->line_directive( 2 + $line + count_newlines($cout), $out_name );
    $cout .= $additional_bodies;
    $cout .= "\n\n";

    #remove trailing whitespacei
    $cout =~ s/^\s+$//mg;
    return $cout;
}

=item C<methods($line, $out_name)>

Returns the C code for the vtable methods. C<$line> is used to accumulate
the number of lines, C<$out_name> is the name of the output file we are
generating.

=cut

sub methods {
    my ( $self, $line, $out_name ) = @_;

    my $cout = "";
    my %method_used_p;

    # vtable methods
    foreach my $method ( @{ $self->{vtable}{methods} } ) {
        my $meth = $method->{meth};
        if ( $self->implements($meth) ) {
            my $ret = $self->body( $method, $line, $out_name );
            $line += count_newlines($ret);
            $cout .= $ret;
            $method_used_p{$meth}++;
        }
    }

    # nci methods
    foreach my $method ( @{ $self->{methods} } ) {
        next unless $method->{loc} eq 'nci';
        my $ret = $self->body( $method, $line, $out_name );
        $line += count_newlines($ret);
        $cout .= $ret;
        $method_used_p{$method->{meth}}++;
    }

    # check for misspelled or unimplemented method names.
    foreach my $method ( @{ $self->{methods} } ) {
        my $meth = $method->{meth};
        warn "Cannot generate $out_name code for unknown method '$meth'.\n"
            unless $method_used_p{$meth} || $meth eq 'class_init';
    }

    $cout =~ s/^\s+$//mg;
    return $cout;
}

=item C<pmc_is_dynpmc>

Determines if a given PMC type is dynamically loaded or not.

=cut

sub pmc_is_dynpmc {

    # surely core PMCs aren't dynamic
    return exists( $pmc_types{ $_[1] } ) ? 0 : 1;
}

# XXX quick hack - to get MMD variants
sub get_super_mmds {
    my ( $self, $meth, $right, $func ) = @_;
    ## use Data::Dumper;
    ## printf "******* $meth_name **********\n";
    ## print Dumper($self);
    ## exit 0;
    my ( @mmds, $found );
    for my $super_mmd ( @{ $self->{super_mmd} } ) {
        my ( $super, $variants );
        $found = 0;
        @mmds  = ();
        while ( ( $super, $variants ) = each %{$super_mmd} ) {
            if ( $super eq 'meth' && $variants eq $meth ) {
                $found = 1;
            }
            elsif ( ref($variants) eq 'ARRAY' ) {
                for my $class ( @{$variants} ) {
                    next if $class eq 'DEFAULT';
                    my $r =
                        $class eq 'DEFAULT'
                        ? 'enum_type_PMC'
                        : "enum_class_$class";
                    my $super_name = "Parrot_${super}_$meth";
                    $super_name .= "_$class" if $class ne 'DEFAULT';
                    push @mmds, [ $func, 0, $r, $super_name ];
                }
            }
        }
        last if $found;
    }
    return $found ? @mmds : ();
}

=item C<find_mmd_methods()>

Returns three values:

The first is an arrayref of <[ mmd_number, left, right, implementation_func]>
suitable for initializing the MMD list.

The second is a arrayref listing dynamic PMCs which will need to be looked up.

The third is a list of C<[index, dynamic PMC]> pairs of right entries
in the MMD table that will need to be resolved at runtime.

=cut

sub find_mmd_methods {
    my $self      = shift;
    my $classname = $self->{class};
    my ( @mmds, @init_mmds, %init_mmds );
    foreach my $method ( @{ $self->{vtable}{methods} } ) {
        my $meth = $method->{meth};
        my $meth_name;
        if ( !$self->implements($meth) ) {
            my $class = $self->{super}{$meth};
            next
                if $class =~ /^[A-Z]/
                or $class eq 'default'
                or $class eq 'delegate';
            $meth_name = "Parrot_${class}_$meth";
        }
        else {
            $meth_name = "Parrot_${classname}_$meth";
        }
        next unless $method->{mmd} =~ /MMD_/;
        my ( $func, $left, $right );
        $func = $method->{mmd};

        # dynamic PMCs need the runtime type
        # which is passed in entry to class_init
        $left  = 0;                 # set to 'entry' below in initialization loop.
        $right = 'enum_type_PMC';
        $right = 'enum_type_INTVAL' if ( $func =~ s/_INT$// );
        $right = 'enum_type_FLOATVAL' if ( $func =~ s/_FLOAT$// );
        $right = 'enum_type_STRING' if ( $func =~ s/_STR$// );
        if ( exists $self->{super}{$meth} ) {
            push @mmds, $self->get_super_mmds( $meth, $right, $func );
        }
        push @mmds, [ $func, $left, $right, $meth_name ];
        foreach my $variant ( @{ $self->{mmd_variants}{$meth} } ) {
            if ( $self->pmc_is_dynpmc( $variant->[0] ) ) {
                $right = 0;
                push @init_mmds, [ $#mmds + 1, $variant->[0] ];
                $init_mmds{ $variant->[0] } = 1;
            }
            else {
                $right = "enum_class_$variant->[0]";
            }
            $meth_name = $variant->[1] . '_' . $variant->[0];
            push @mmds, [ $func, $left, $right, $meth_name ];
        }
        $self->{mmds} = @mmds;    # XXX?
    }
    return ( \@mmds, \@init_mmds, [ keys %init_mmds ] );
}

=item C<find_vtable_methods()>

Returns an arrayref containing the vtable methods in the order
they appear in the vtable.

=cut

sub find_vtable_methods {
    my $self      = shift;
    my $classname = $self->{class};
    my $variant   = $self->{variant} || "";
    my ( @meths, @mmds, @init_mmds, %init_mmds );
    foreach my $method ( @{ $self->{vtable}{methods} } ) {
        my $meth = $method->{meth};
        my $meth_name;
        if ( $self->implements($meth) ) {
            $meth_name = "Parrot_${classname}${variant}_$meth";
        }
        elsif ( exists $self->{super}{$meth} ) {
            my $class = $self->{super}{$meth};
            $meth_name = "Parrot_${class}_$meth";
        }
        else {
            $meth_name = "Parrot_default_$meth";
        }

        # normal vtable method}
        unless ( $method->{mmd} =~ /MMD_/ ) {
            push @meths, $meth_name;
        }
    }
    return \@meths;
}

=item C<vtable_decl($name)>

Returns the C code for the declaration of a vtable temporary named
C<$name> with the functions for this class.
=cut

sub vtable_decl {
    my ( $self, $name ) = @_;

    my $methods = $self->find_vtable_methods();

    my $cout = "";
    return "" if exists $self->{flags}{noinit};

    # TODO gen C line comment
    my $classname = $self->{class};
    my $vtbl_flag =
          $self->{flags}{const_too} ? 'VTABLE_HAS_CONST_TOO'
        : $self->{flags}{is_const}  ? 'VTABLE_IS_CONST_FLAG'
        :                             0;
    if ( exists $self->{flags}{need_ext} ) {
        $vtbl_flag .= '|VTABLE_PMC_NEEDS_EXT';
    }
    if ( exists $self->{flags}{singleton} ) {
        $vtbl_flag .= '|VTABLE_PMC_IS_SINGLETON';
    }
    if ( exists $self->{flags}{is_shared} ) {
        $vtbl_flag .= '|VTABLE_IS_SHARED_FLAG';
    }
    if ( exists $self->{flags}{is_ro} ) {
        $vtbl_flag .= '|VTABLE_IS_READONLY_FLAG';
    }
    if ( exists $self->{flags}{has_ro} ) {
        $vtbl_flag .= '|VTABLE_HAS_READONLY_FLAG';
    }

    my $enum_name = $self->{flags}{dynpmc} ? -1 : "enum_class_$classname";
    my $methlist = join( ",\n        ", @$methods );
    $cout .= <<ENDOFCODE;
    const VTABLE $name = {
        NULL, /* namespace */
        $enum_name, /* base_type */
        NULL, /* whoami */
        $vtbl_flag, /* flags */
        NULL,   /* does_str */
        NULL,   /* isa_str */
        NULL,   /* class */
        NULL,   /* mro */
        NULL,   /* ro_variant_vtable */
        $methlist
    };
ENDOFCODE
    return $cout;
}

=item C<init_func()>

Returns the C code for the PMC's initialization method, or an empty
string if the PMC has a C<no_init> flag.

=cut

sub init_func {
    my $self = shift;

    my $cout = "";
    return "" if exists $self->{flags}{noinit};
    my ( $mmds, $init_mmds, $dyn_mmds ) = $self->find_mmd_methods();
    my $vtable_decl = $self->vtable_decl('temp_base_vtable');

    my $classname = $self->{class};

    my $mmd_list =
        join( ",\n        ", map { "{ $_->[0], $_->[1], $_->[2], (funcptr_t) $_->[3] }" } @$mmds );
    my $isa = join( " ", $classname, @{ $self->{parents} } );
    $isa =~ s/\s?default$//;
    my $does = join( " ", keys( %{ $self->{flags}{does} } ) );
    my $n = exists $self->{has_method}{class_init} ? $self->{has_method}{class_init} : -1;
    my $class_init_code = $n >= 0 ? $self->{methods}[$n]{body} : "";
    $class_init_code =~ s/INTERP/interp/g;
    my $enum_name = $self->{flags}{dynpmc} ? -1 : "enum_class_$classname";

    my %extra_vt;

    if ( $self->{ro} ) {
        $extra_vt{ro} = $self->{ro};
    }

    $cout .= <<"EOC";
void
Parrot_${classname}_class_init(Parrot_Interp interp, int entry, int pass)
{
$vtable_decl
EOC

    for my $k ( keys %extra_vt ) {
        $cout .= $extra_vt{$k}->vtable_decl("temp_${k}_vtable");
    }

    my $const = ( $self->{flags}{dynpmc} ) ? " " : " const ";
    if ( scalar @$mmds ) {
        $cout .= <<"EOC";

   $const MMD_init _temp_mmd_init[] = {
        $mmd_list
    };
    /*  Dynamic PMCs need the runtime type
    which is passed in entry to class_init.
    */
EOC
    }

    $cout .= <<"EOC";
    if (pass == 0) {
EOC
    $cout .= <<"EOC";
        /*
         * create vtable - clone it - we have to set a few items
         */
        VTABLE *vt_clone =
            Parrot_clone_vtable(interp, &temp_base_vtable);
EOC
    for my $k ( keys %extra_vt ) {
        $cout .= <<"EOC";
        VTABLE *vt_${k}_clone =
            Parrot_clone_vtable(interp, &temp_${k}_vtable);
EOC
    }

    # init vtable slot
    if ( $self->{flags}{dynpmc} ) {
        $cout .= <<"EOC";
        vt_clone->base_type = entry;
        vt_clone->whoami = string_make(interp,
            "$classname", @{[length($classname)]}, "ascii",
            PObj_constant_FLAG|PObj_external_FLAG);
        vt_clone->isa_str = string_make(interp,
            "$isa", @{[length($isa)]}, "ascii",
            PObj_constant_FLAG|PObj_external_FLAG);
        vt_clone->does_str = string_make(interp,
            "$does", @{[length($does)]}, "ascii",
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
    for my $k ( keys %extra_vt ) {
        $cout .= <<"EOC";
        vt_${k}_clone->base_type = entry;
        vt_${k}_clone->whoami = vt_clone->whoami;
        vt_${k}_clone->isa_str = vt_clone->isa_str;
        vt_${k}_clone->does_str = vt_clone->does_str;
EOC
    }

    if ( $extra_vt{ro} ) {
        $cout .= <<"EOC";
        vt_clone->ro_variant_vtable = vt_ro_clone;
        vt_ro_clone->ro_variant_vtable = vt_clone;
EOC
    }

    $cout .= <<"EOC";
        interp->vtables[entry] = vt_clone;
EOC
    $cout .= <<"EOC";
    }
    else { /* pass */
EOC

    # To make use of the .HLL directive, register any mapping...
    if ( $self->{flags}{hll} && $self->{flags}{maps} ) {

        my $hll  = ( keys %{ $self->{flags}{hll} } )[0];
        $cout .= <<"EOC";

        {
            /* Register this PMC as a HLL mapping */
            INTVAL pmc_id = Parrot_get_HLL_id(
                interp, const_string(interp, "$hll")
            );
            if (pmc_id > 0)
EOC


        foreach my $map ( keys %{ $self->{flags}{maps} }) {

        $cout .= <<"EOC";
                Parrot_register_HLL_type(
                    interp, pmc_id, enum_class_$map, entry
                );
EOC
        }

        $cout .= <<"EOC";
        } /* Register */
EOC
    }

    $cout .= <<"EOC";
        /* setup MRO and _namespace */
        Parrot_create_mro(interp, entry);
EOC

    # declare each nci method for this class
    foreach my $method ( @{ $self->{methods} } ) {
        next unless $method->{loc} eq 'nci';
        my $proto = proto( $method->{type}, $method->{parameters} );
        my $symbol_name = defined $method->{symbol} ? $method->{symbol} : $method->{meth};
        if ( exists $method->{pre_block} ) {
            $cout .= <<"EOC";
        register_raw_nci_method_in_ns(interp, entry,
            F2DPTR(Parrot_${classname}_$method->{meth}), "$symbol_name");
EOC
        }
        else {
            $cout .= <<"EOC";
        register_nci_method(interp, entry,
                F2DPTR(Parrot_${classname}_$method->{meth}),
                "$symbol_name", "$proto");
EOC
        }
        if ( $method->{attrs}{write} ) {
            $cout .= <<"EOC";
        Parrot_mark_method_writes(interp, entry, "$symbol_name");
EOC
        }
    }

    # include any class specific init code from the .pmc file
    $cout .= <<"EOC";
        /* class_init */
EOC
    $cout .= "    $class_init_code\n" if $class_init_code;

    $cout .= <<"EOC";
        {
EOC

    # declare auxiliary variables for dyncpmc IDs
    foreach my $dynpmc (@$dyn_mmds) {
        next if $dynpmc eq $classname;
        $cout .= <<"EOC";
            int my_enum_class_$dynpmc = pmc_type(interp, string_from_const_cstring(interp, "$dynpmc", 0));
EOC
    }

    # init MMD "right" slots with the dynpmc types
    foreach my $entry (@$init_mmds) {
        if ( $entry->[1] eq $classname ) {
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
    foreach my $dynpmc (@$dyn_mmds) {
        next if $dynpmc eq $classname;
        $cout .= <<"EOC";
            assert(my_enum_class_$dynpmc != enum_class_default);
EOC
    }
    if ( scalar @$mmds ) {
        $cout .= <<"EOC";
#define N_MMD_INIT (sizeof(_temp_mmd_init)/sizeof(_temp_mmd_init[0]))
            Parrot_mmd_register_table(interp, entry,
                _temp_mmd_init, N_MMD_INIT);
EOC
    }

    $cout .= <<"EOC";
        }
    } /* pass */
} /* Parrot_${classname}_class_init */
EOC
    if ( $self->{flags}{dynpmc} ) {
        $cout .= dynext_load_code( $classname, $classname => {} );
    }

    $cout;
}

=item C<gen_c($out_name)>

Generates the C implementation file code for the PMC. C<$out_name> is the name
of the output file we are generating.

=cut

sub gen_c {
    my ( $self, $out_name ) = @_;

    my $cout = dont_edit( $self->{file} );
    if ( $self->{flags}{dynpmc} ) {
        $cout .= "#define PARROT_IN_EXTENSION\n";
    }
    $cout .= $self->line_directive( 1, $self->{file} ) . $self->{pre};
    $cout .= $self->line_directive_here( $cout, $out_name ) . $self->includes;
    my $l = count_newlines($cout);
    $cout .= $self->methods( $l, $out_name );
    if ( $self->{ro} ) {
        $cout .= $self->{ro}->methods( $l, $out_name );
    }
    $cout .= $self->init_func;
    if ( $self->{const} ) {
        $cout .= $self->{const}->methods( $l, $out_name );
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

sub hdecls {
    my $self = shift;

    my $hout;
    my $classname = $self->{class};

    # generate decls for all vtable methods in this PMC
    foreach my $method ( @{ $self->{vtable}{methods} } ) {
        if ( $self->implements( $method->{meth} ) ) {
            $hout .= $self->decl( $classname, $method, 1 );
        }
    }

    # generate decls for all nci methods in this PMC
    foreach my $method ( @{ $self->{methods} } ) {
        next unless $method->{loc} eq 'nci';
        $hout .= $self->decl( $classname, $method, 1 );
    }

    # class init decl
    $hout .= 'PARROT_DYNEXT_EXPORT ' if ( $self->{flags}->{dynpmc} );
    $hout           .= "void Parrot_${classname}_class_init(Parrot_Interp, int, int);\n";
    $self->{hdecls} .= $hout;
    $self->{hdecls};
}

=item C<gen_h($out_name)>

Generates the C header file code for the PMC. C<$out_name> is the name
of the output file we are generating.

=cut

sub gen_h {
    my ( $self, $out_name ) = @_;

    my $hout = dont_edit( $self->{file} );
    my $name = uc $self->{class};
    $hout .= <<"EOH";

#ifndef PARROT_PMC_${name}_H_GUARD
#define PARROT_PMC_${name}_H_GUARD

EOH

    $hout .= "#define PARROT_IN_EXTENSION\n" if ( $self->{flags}{dynpmc} );
    $hout .= $self->hdecls();
    $hout .= $self->{const}->hdecls()        if ( $self->{const} );
    $hout .= $self->{ro}->hdecls()           if ( $self->{ro} );
    $hout .= <<"EOH";

#endif /* PARROT_PMC_${name}_H_GUARD */

EOH
    $hout .= c_code_coda();
    $hout;
}

=item C<implements($method)>

True if this class generates code for the method C<$method>.

=cut

sub implements {
    my ( $self, $meth ) = @_;
    return 0 unless exists $self->{has_method}{$meth};
    my $n = $self->{has_method}{$meth};
    return $self->{methods}[$n]{'loc'} ne 'nci';
}

=item C<implements_vtable($method)>

True if this class generates code for VTABLE method C<$method>.

=cut

sub implements_vtable {
    my ( $self, $meth ) = @_;
    return 1 if exists $self->{has_method}{$meth};
    my $n = $self->{vtable}{has_method}{$meth};
    return $self->{vtable}{methods}[$n]{mmd} =~ /MMD/ ? 0 : 1;
}

sub is_vtable_method {
    my ( $self, $meth ) = @_;
    foreach my $entry ( @{ $self->{vtable}{methods} } ) {
        return 1 if $entry->{meth} eq $meth;
    }
    return 0;
}

=back

=cut

require Parrot::Pmc2c::default;
require Parrot::Pmc2c::delegate;
require Parrot::Pmc2c::deleg_pmc;
require Parrot::Pmc2c::Null;
require Parrot::Pmc2c::Ref;
require Parrot::Pmc2c::SharedRef;
require Parrot::Pmc2c::Standard;
require Parrot::Pmc2c::StandardConst;
require Parrot::Pmc2c::StandardRO;
require Parrot::Pmc2c::StmRef;

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

#! /usr/bin/perl -w
#
# pmc2c.pl
#
# Generate a C source and a header
# file from the methods defined in a .pmc file.
#

=head1 NAME

pmc2c.pl - PMC compiler

=head1 SYNOPSIS

perl pmc2c.pl [--no-lines] [--tree] foo.pmc [foo2.pmc...]
perl pmc2c.pl B<-f> method *.pmc

The first class.pmc should be the name of the class you wish to
create. Normally, the pmc2c.pl translator uses #line pragmas to tell
the C compiler where each function in the .pmc file begins (line
number). This allows the compiler to issue warnings and errors based
on the .pmc file instead of on the .c file which should not be edited.
However, there are times when this is not desirable and therefore the
--no-lines option is provided.

If --tree is set, the inheritance tree of given classes is printed, no
further processing is done. The common base class 'default' is not printed.

If B<-f> is set, the pmcs are printed, where this method is implemented.

=head1 DESCRIPTION

The pmc2c program's job is to take .pmc files and create .c files
which can be compiled for use with the Parrot interpreter.

First, the program determines the names of the .c and .h files from
the basename of the .pmc file (e.g. perlint.pmc -> perlint.c and
perlint.h). Next, the file is searched for /pmclass \w*/ which
attempts to find the class being declared. Once the class is found,
all of its superclasses are scanned and their methods added to the
methods of the current PMC. PMCs default to inheriting from 'default'.
Only single inheritance is supported. Once the superclass is
determined, it is processed and its method names are extracted and
saved. Next, each method body is processed with various directives
(see below) getting replaced by their appropriate values. Finally, the
.c and .h files are generated. The appropriate base class header files
are included. If the noinit flag was used, then no init function is
generated, otherwise one is generated which sets up the vtable and
enters it into the Parrot_base_vtables array. The .c file is generated
by appending the functions after the various directives have been
replaced.

=head2 PMC FILE SYNTAX

The basic syntax of a PMC file is

=over 4

=item 1.

A preamble, consisting of code to be copied directly to the .c file

=item 2.

The C<pmclass> declaration:

	pmclass PMCNAME [extends PMCPARENT] [flags] {

where C<flags> are:

=over 4

=item extends PMCPARENT

All methods not defined in PMCNAME are inherited from the PMCPARENT class.
If no parent class is defined, methods from F<default.pmc> are used.

=item abstract

This class can't be instantiated. Abstract classes are shown with lower
case class names in the class tree.

=item noinit

Used with B<abstract>: No class_init code is generated.

=item dynpmc

The class is a dynamic classes. These have a special class_init
routine suitable for dynamic loading at runtime. s. dynclasses/ for an
example.

=item const_too

Classes with this flag get 2 vtables and 2 enums, one with r/w set
methods one with r/o set methods.

=item need_ext

The class needs a PMC_EXT structure (its using e.g. PMC_data).

=item does interface

The class does the given interfaces (the collection of methods
which the class implements).

The default is "scalar". Other currently used interfaces are:

 array
 hash

=back

=item 3. 

A list of vtable method implementations

=item 4. 

The final close C<}>

=back

=head2 METHOD BODY SUBSTITUTIONS

The vtable method bodies can use the following substitutions:

=over 4

=item *

I<SELF> - Converted to the current PMC object of type PMC*.

=item *

I<INTERP> - Converted to the interpreter object.

=item *

I<Otherclass.SELF.method(a,b,c)> - calls the static vtable method 'method'
in OtherClass.

=item *

I<SELF.method(a,b,c)> - calls the vtable method 'method' using the
static type of SELF (in other words, calls another method defined in
the same file).

=item *

I<DYNSELF.method(a,b,c)> - calls the vtable method 'method' using the
dynamic type of SELF

=item *

I<DYNSELF(a,b,c)> - same as above, but calls the current method

=item *

I<OtherClass.SUPER(a,b,c)> - calls the overridden implementation of the current
method in OtherClass.

=item *

I<SUPER(a,b,c)> - calls the overridden implementation of the current
method in the nearest superclass, using the static type of SELF.

=item *

I<DYNSUPER(a,b,c)> - as above, but uses the actual dynamic type of SELF.

=back

=head1 INTERNAL METHODS

=cut

use FindBin;
use lib 'lib';
use lib "$FindBin::Bin/..";
use lib "$FindBin::Bin/../lib";
use Parrot::Vtable;
use Parrot::Pmc2c qw( dynext_load_code );
use strict;

my $default = parse_vtable("$FindBin::Bin/../vtable.tbl");
my ($print_tree, $print_meth);

# The signature regex is used to parse a function signature for
# example void func( int x ) { ... } after having applied the
# signature_re will have $1 eq "void", $2 eq "func" and $3 eq "int x".
# However, thoughout most of this code, $signature_re is surrounded by
# parens ($signature_re) making the numbers shift over one (i.e. $2 eq
# "void", $3 eq "func", $4 eq "int x")

my $signature_re = qr{
    ^
    (?:             #blank spaces and comments and spurious semicolons
      [;\n\s]*
      (?:/\*.*?\*/)?  # C-like comments
    )*

    (\w+\**)      #type
    \s+
    (\w+)         #method name
    \s*
    \(([^\(]*)\)  #parameters
}sx;

=head2 extract_balanced

This function's purpose is to extract the C code between the opening
and closing brace of a function definition. For example, the function

  void f( int x ) {
    if( x == 9 ) {
      printf( "Hello!" );
    }
    else {
      printf( "Goodbye!" );
    }
  }

would generate a return value of:
  q{    if( x == 9 ) {
          printf( "Hello!" );
        }
        else {
          printf( "Goodbye!" );
        }
  }

It will actually return a triple consisting of the above, the passed
in string with the above removed, and the current line number after
the above has been removed.

=cut

sub extract_balanced {
    my $balance = 0;
    my $lines = 0;
    for(shift) {
        s/^(\s+)//;
        $lines += count_newlines($1);
        /^\{/ or die "bad block open: ".substr($_,0,10),"..."; # }
        while(/(\{)|(\})/g) {
            if($1) {
                $balance++;
            } else { # $2
                --$balance or return (substr($_, 0, pos, ""),  $_, $lines);
            }
        }
        die "Badly balanced" if $balance;
    }
}

=head2 parse_superpmc

This function looks for a superclass declaration in
the current pmc class.  If none was found, it assumes
that default is the superclass.  It then reads in the
class definition for the superclass and remembers
the method names.  It returns an array ref to the
method names and the name of the superclass that
was analyzed.

=cut


sub parse_flags {
    my $c = shift;
    $$c =~ s/^(.*?^\s*)pmclass ([\w]*)//ms;
    my ($pre, $classname) = ($1, $2);

    my $superpmc = 'default';
    my ($saw_extends, $saw_does);
    my %flags;
    # look through the pmc declaration header for flags such as noinit
    while ($$c =~ s/^(\s*)(\w+)//s) {
	# $lineno += count_newlines($1);
	if ($saw_extends) {
	    $superpmc = $2;
	    $saw_extends = 0;
	} elsif ($saw_does) {
	    if ($flags{does}) {
		$flags{does} = "$flags{does} $2";
	    }
	    else {
		$flags{does} = $2;
	    }
	    $saw_does = 0;
	} elsif ($2 eq 'extends') {
	    $saw_extends = 1;
	} elsif ($2 eq 'does') {
	    $saw_does = 1;
	} else {
	    $flags{$2}++;
	}
    }
    ($pre, $classname, $superpmc, \%flags);
}

sub parse_superpmc {

  local $_ = shift;

  my (undef, $classname, $superpmc, $flags) = parse_flags(\$_);
  my ($classblock) = extract_balanced($_);
  $classblock = substr($classblock, 1,-1); # trim out the { }

  my @methods;

  while ($classblock =~ s/($signature_re)//) {
     my $methodname = $3;
     next if ($classblock =~ s/^(\s*=\s*default;?\s*)//s);
     push @methods, $methodname;
     (undef, $classblock) = extract_balanced($classblock);
  }

  return (\@methods, $superpmc, $flags);
}

=head2 superpmc_info

This function opens the file containing the superclass reads in the
data and calls parse_superpmc().

=cut

sub superpmc_info {
    my $pmc = shift;
    my $filename = "$FindBin::Bin/\L$pmc\E.pmc";
    print "Scanning $filename...\n" unless ($print_tree||$print_meth);
    local $/;
    if (!open(SUPERPMC, $filename)) {
	$filename =~ s/classes/dynclasses/;
        print "\tScanning $filename...\n" unless ($print_tree||$print_meth) ;
	open(SUPERPMC, $filename) or die "open superpmc file $filename: $!";
    };
    my $data = <SUPERPMC>;
    close SUPERPMC;
    return parse_superpmc($data);
}

=head2 scan_inheritance_tree

This function repeatedly calls superpmc_info passing in the current
class name. superpmc_info will return a tuple containing all of the
defined methods (not default) in that class as well as the name of the
superclass that was processed. This function stops when the default
superclass is processed. It returns a hash that maps the method name
to the most derived class it was defined in.

=cut

sub scan_inheritance_tree {
    my ($class) = @_;

    my $leafclass = $class;
    my $depth = 0;

    my %methods; # { methodname => class }
    my %super; # { methodname => class }
    my %parent_flags;
    while ($class ne 'default') {
        my ($methods, $super, $flags) = superpmc_info($class);
        foreach my $flag (keys (%$flags)) {
	    $parent_flags{$flag} = $$flags{$flag} if $flag =~ /need_ext|does/;
	}
        foreach my $method (@$methods) {
	    $methods{$method} ||= $class;
	    $super{$method} ||= $class unless $class eq $leafclass;
	    if ($print_meth && $print_meth eq $method) {
		print "    " x $depth++, $class, "\n";
	    }
        }
	if ($print_tree) {
		print "    " x $depth++, $class, "\n";
	}
        $class = $super;
    }

    # now loop through all of the methods in the default class and add
    # them if they have not already been added.
    foreach my $method (@{$default}) {
        $methods{$method->[1]} ||= 'default';
        $super{$method->[1]} ||= 'default';
    }

    return \%methods, \%super, \%parent_flags;
}

sub Usage {
    print STDERR <<_EOF_;
usage: $0 class.pmc [--no-lines] [--tree] [class2.pmc ...]
  --no-lines suppresses #line directives
_EOF_
    exit 1;
}

#
# Process command-line arguments:
#

my $suppress_lines;
Usage() unless @ARGV;
# TODO use getopt
if ($ARGV[0] eq '--no-lines') {
    $suppress_lines = 1;
    shift(@ARGV);
}

if ($ARGV[0] eq '--tree') {
    $print_tree = 1;
    shift(@ARGV);
}
if ($ARGV[0] eq '-f') {
    shift(@ARGV);
    $print_meth = shift(@ARGV);
}
while (my $file = shift @ARGV) {

  my $base = $file;
  $base =~ s/\.pmc$//;
  my $cfile = "$base.c";
  my $hfile = "pmc_$base.h";

  die "$0: Could not read class file '$file'!\n" unless -e $file;

  open (PMC, $file) || die "$0: Unable to open file '$file'\n";
  my @contents = <PMC>;
  my $contents = join('', @contents);
  close PMC;

  my ($coutput, $houtput) = filter($contents, $file, $cfile); # run the filter
  next if $print_tree || $print_meth;

  open (SOURCE, ">$cfile") || die "$0: Could not write file '$cfile'\n";
  print SOURCE $coutput;
  close SOURCE;

  open (SOURCE, ">$hfile") || die "$0: Could not write file '$hfile'\n";
  print SOURCE $houtput;
  close SOURCE;
}


=head2 count_newlines

return the number of newlines in the current string

=cut

sub count_newlines {
    return scalar(() = $_[0] =~ /\n/g);
}

sub full_arguments {
    my $args = shift;
    if ($args =~ /\S/) {
        return "INTERP, SELF, $args";
    } else {
        return "INTERP, SELF";
    }
}

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
    s/INTERP/interpreter/g;

    # now use macros for all rewritten stuff
    s/\b(?:\w+)->vtable->(\w+)\(/ VTABLE_$1(/g;

    return $_;
}

use vars qw(@consts %consts);

BEGIN {
    @consts = qw(STORE PUSH POP SHIFT UNSHIFT DELETE);
    @consts{@consts} = (1) x @consts;
};

sub is_const($$) {
    my ($meth, $section) = @_;
    exists $consts{$section} || $meth eq 'morph';
}

sub standard_body($$$$$$$) {
    my ($vtbl, $classname, $methodname, $OUT, $HOUT, $cfile, $body) = @_;
    my $type = $vtbl->[0];
    my $parameters = $vtbl->[2];
    $parameters = ", $parameters" if $parameters;
    my $retval = "($type) 0";
    my $ret = $type eq 'void' ? '' : "return $retval;" ;
    my $ln = 1 + ($OUT =~ tr/\n/\n/);
    my $line = $suppress_lines ? '' : "#line $ln \"$cfile\"\n";
    my $decl = "$type Parrot_${classname}_${methodname} (struct Parrot_Interp *interpreter, PMC* pmc$parameters)";
    $$HOUT .= "extern $decl;\n";
    return <<EOC;
$line
    $decl {
        $body
	$ret
    }
EOC
}

sub standard_ref_body($$$$$$) {
    my ($vtbl, $classname, $methodname, $OUT, $HOUT, $cfile) = @_;
    my $type = $vtbl->[0];
    my $parameters = $vtbl->[2];
    my $n=0;
    my @args = grep {$n++ & 1 ? $_ : 0} split / /, $parameters;
    my $arg = '';
    $arg = ", ". join(' ', @args) if @args;
    $parameters = ", $parameters" if $parameters;
    my $body = "VTABLE_$methodname(interpreter, PMC_ptr2p(pmc)$arg)";
    my $ret = $type eq 'void' ? "$body;" : "return $body;" ;
    my $ln = 1 + ($OUT =~ tr/\n/\n/);
    my $line = $suppress_lines ? '' : "#line $ln \"$cfile\"\n";
    my $decl = "$type Parrot_${classname}_${methodname} (struct Parrot_Interp *interpreter, PMC* pmc$parameters)";
    $$HOUT .= "extern $decl;\n";
    return <<EOC;
$line
    $decl {
	$ret
    }
EOC
}

sub class_trailer {
    my ($classname, $vtbl_flag, $methodlist, $isa, $does, $class_init_code) = @_;
    my $initname = "Parrot_$classname" . "_class_init";
    my $OUT = <<EOC;
void $initname (Interp * interp, int entry) {

    struct _vtable temp_base_vtable = {
        NULL,	/* package */
        enum_class_$classname,	/* base_type */
        NULL,	/* whoami */
        NULL,	/* method_table */
        $vtbl_flag, /* flags */
        NULL,   /* does_str */
        NULL,   /* isa_str */
        NULL, /* extra data */
        $$methodlist
        };

    /*
     * parrotio calls some class_init functions during its class_init
     * code, so some of the slots might already be allocated
     * class isa '$isa'
     */
    if (!Parrot_base_vtables[entry]) {
	temp_base_vtable.whoami = string_make(interp,
	   "$classname", @{[length($classname)]}, 0, PObj_constant_FLAG|PObj_external_FLAG , 0);
	temp_base_vtable.isa_str = string_make(interp,
	   "$isa", @{[length($isa)]}, 0, PObj_constant_FLAG|PObj_external_FLAG , 0);
	temp_base_vtable.does_str = string_make(interp,
	   "$does", @{[length($does)]}, 0, PObj_constant_FLAG|PObj_external_FLAG , 0);

	Parrot_base_vtables[entry] =
	   Parrot_clone_vtable(interp, &temp_base_vtable);
    }
    $class_init_code
}
EOC
    $OUT;
}

=head2 filter

The filter function choreographs the previous functions actions on the
pmcfile in question. It first scans the inheritance hierarchy to get
all of the methods and their corresponding class of definition. Next,
it skips over the extends clause and processes any flags (such as
noinit). Afterwards, it loops through each function declared and
replaces directives with the appropriate values. Finally, it generates
the .c and .h files for the .pmc file being analyzed.

=cut

my (%flags, %parent_flags);
sub filter {
    my ($contents, $pmcfile, $cfile) = @_;
    my $lineno = 1;

    my ($pre, $classname, $superpmc, $fl) = parse_flags(\$contents);
    %flags = %$fl;
    # $pre might be things like static functions, etc...

    $lineno += count_newlines($pre);

    # $methodloc is a hash reference methodname => defining class
    my ($methodloc, $supermethodloc, $pfl) = scan_inheritance_tree($classname);
    return if $print_tree || $print_meth;
    %parent_flags = %$pfl;
    # check flags of parent class
    if ($flags{does} && $parent_flags{does}) {
	$flags{does} = "$flags{does} $parent_flags{does}";
    }
    elsif ($parent_flags{does}) {
	$flags{does} = $parent_flags{does};
    }
    #
    # get the entire class definition
    my ($classblock, $post, $lines) = extract_balanced($contents);
    $lineno += $lines;
    $classblock = substr($classblock, 1,-1); # trim out the { }

    my @methods;

    my $OUT = '';
    my $HOUT = <<"EOC";
/*
 * !!!!!!!   DO NOT EDIT THIS FILE   !!!!!!!
 *
 * This file is generated automatically from '$pmcfile' by $0.
 *
 * Any changes made here will be lost!
 *
 */

EOC
  my %defaulted;
  my $class_init_code = '';

  my %methodbody;

  # start processing methods
  while ($classblock =~ s/($signature_re)//) {
     $lineno += count_newlines($1);
     my ($type, $methodname, $parameters) = ($2,$3,$4);

     # because we are going to prepend the self PMC and the
     # interpreter, we want to stick a comma before the parameters if
     # we have any.
     $parameters = ", $parameters" if $parameters =~ /\w/;

     # see if this is a default function. If so, remember it and carry on.
     if ($classblock =~ s/^(\s*=\s*default;?\s*)//s) {
        $lineno += count_newlines($1);
        $defaulted{$methodname}++;
        push @methods, $methodname;
        next;
     }

     my ($methodblock, $rema, $lines) = extract_balanced($classblock);
     $lineno += $lines;

     # class_init code goes at the end of Parrot_$Class_class_init
     # these isn't a method but class global init code
     # only INTERP is expanded
     if ($methodname =~ /class_init/) {
	 $methodblock =~ s/INTERP/interp/g;
	 $class_init_code .= $methodblock;
	 next;
     }

     $methodblock = rewrite_method($classname, $methodname,
                                   $superpmc, $supermethodloc,
                                   $methodblock);

     # now create the function prototype based on the class name,
     # method name, and parameters make it extern in the .h file and
     # add the actual code for the .c file
     my $decl = "$type Parrot_${classname}_${methodname} (struct Parrot_Interp *interpreter, PMC* pmc$parameters)";
     $HOUT .= "extern $decl;\n";

     $methodbody{ $methodname } =
		( $suppress_lines ? '' : "\n#line $lineno \"$pmcfile\"\n   " ) .
		$decl .
		$methodblock;

     $lineno += count_newlines($methodblock);
     # set the class block to the remaining code
     $classblock = $rema;
     push @methods, $methodname;
  };

  # generate the #include directives for each of the superclasses. We
  # get superclasses from the %methodloc hash, however, we have to
  # remove duplicates.
  my %visible_supers;
  @visible_supers{values %$methodloc} = (); # Remove duplicates

  my $includes = '';
  foreach my $class (keys %visible_supers) {
      $includes .= qq(#include "pmc_\L$class.h"\n);
  }


  $OUT = <<EOC . $OUT;
/*
 * !!!!!!!   DO NOT EDIT THIS FILE   !!!!!!!
 *
 * This file is generated automatically from '$pmcfile' by $0.
 *
 * Any changes made here will be lost!
 *
 */

$pre
${includes}

EOC

  # now lets set up the vtable for insertion into the Parrot core (if
  # necessary) after this insane line of code @methods will have the
  # correct function name for each of the methods listed in the
  # vtable.tbl file.

  @methods = ();
  my @cmethods;
  for (@$default)
  {
      my $methodname = $_->[1];
      my $isconst;
      if (!exists $methodbody{ $methodname } && $classname eq 'Ref') {
	  push @methods, "Parrot_Ref_$methodname";
      }
      else {
	  push @methods, "Parrot_$methodloc->{$methodname}_$methodname";
      }
      if ($flags{const_too}) {
	  if (is_const($methodname, $_->[3]) &&
	      exists $methodbody{ $methodname }) {
 	      $isconst = 1;
	      push @cmethods,
		    "Parrot_Const$methodloc->{$methodname}_$methodname";
	  }
	  else {
	      push @cmethods, "Parrot_$methodloc->{$methodname}_$methodname";
	  }

      }
      if (exists $methodbody{ $methodname }) {
	    $OUT .= $methodbody{ $methodname } . "\n\n";
	  if ($isconst) {
	      my $body = <<EOC;
	internal_exception(WRITE_TO_CONSTCLASS,
		"$methodname() in Const$classname");
EOC
	      if ($methodname eq 'morph') {
		  $body = <<EOC;
    if (Parrot_is_const_pmc(interpreter, pmc))
	internal_exception(WRITE_TO_CONSTCLASS,
		"$methodname() in Const$classname");
    else
        Parrot_${classname}_$methodname(interpreter, pmc, type);
EOC
	      }

	    $OUT .= standard_body($_, "Const$classname", $methodname,
		$OUT, \$HOUT, $cfile, $body);
	  }
      }
      elsif ($classname eq 'default') {
	# generate default body
	  my $body = <<EOC;
	internal_exception(ILL_INHERIT,
		"$methodname() not implemented in class '%s'",
		caller(interpreter, pmc));
EOC
	  $OUT .= standard_body($_, "$classname", $methodname,
		$OUT, \$HOUT, $cfile, $body);

      }
      elsif ($classname eq 'Ref') {
	  $OUT .= standard_ref_body($_, "$classname", $methodname,
		$OUT, \$HOUT, $cfile);
      }
  }

  my $isa = join(" ", grep { $_ ne 'default' } (keys %visible_supers));

  my $does = "scalar";
  if ($flags{does}) {
      $does = $flags{does};
  }

  # this collapses the array and makes sure the spacing is right for
  # the vtable
  my $methodlist = join (",\n        ", @methods);
  my $cmethodlist = join (",\n        ", @cmethods);
  my $initname = "Parrot_$classname" . "_class_init";

  unless (exists $flags{noinit}) {
      my $initline = 1+count_newlines($OUT)+1;
      $OUT .= qq(#line $initline "$cfile"\n) unless $suppress_lines;
      $HOUT .= <<EOH;
      void $initname (Interp *, int);
EOH
      my $vtbl_flag = exists $flags{const_too} ? 'VTABLE_HAS_CONST_TOO' : 0;
      if (exists $flags{need_ext}) {
	  $vtbl_flag .= '|VTABLE_PMC_NEEDS_EXT';
      }
      $OUT .= class_trailer($classname, $vtbl_flag, \$methodlist,
      $isa, $does, $class_init_code);


      if (exists $flags{const_too}) {
	  my $initline = 1+count_newlines($OUT)+1;
	  $initname = "Parrot_Const$classname" . "_class_init";
	  $OUT .= qq(#line $initline "$cfile"\n) unless $suppress_lines;
	  $HOUT .= <<EOH;
      void $initname (Interp *, int);
EOH
	  my $vtbl_flag = 'VTABLE_IS_CONST_FLAG';
	  if (exists $flags{need_ext}) {
	      $vtbl_flag .= '|VTABLE_PMC_NEEDS_EXT';
	  }
	  $OUT .= class_trailer("Const$classname", $vtbl_flag, \$cmethodlist,
	  $isa, $does, $class_init_code);
      }
  }
  if (exists $flags{dynpmc}) {
      $OUT .= dynext_load_code($classname, "$initname(interpreter, type);");
  }

  return ($OUT, $HOUT);
}

__END__

=head1 LICENSE

This program is free software. It is subject to the same license
as the Parrot interpreter.

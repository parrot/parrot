#! /usr/bin/perl -w
#
# ops2c.pl
#
# Generate a C source file from the methods defined in a .pmc file.
#

use FindBin;
use lib 'lib';
use lib "$FindBin::Bin/..";
use lib "$FindBin::Bin/../lib";
use Parrot::Vtable;
use strict;

my $default = parse_vtable("$FindBin::Bin/../vtable.tbl");
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

sub parse_superpmc {
  local $_ = shift;

  my ($classname) = s/(?:.*?)^\s*pmclass ([\w]*)//ms;

  my $superpmc = 'default';
  my $saw_extends;
  while (s/^(\s*)(\w+)//s) {
      if ($saw_extends) {
          $superpmc = $2;
          last;
      } elsif ($2 eq 'extends') {
          $saw_extends = 1;
      }
  }

  my ($classblock) = extract_balanced($_);
  $classblock = substr($classblock, 1,-1); # trim out the { }

  my @methods;

  while ($classblock =~ s/($signature_re)//) {
     my $methodname = $3;
     next if ($classblock =~ s/^(\s*=\s*default;?\s*)//s);
     push @methods, $methodname;
     (undef, $classblock) = extract_balanced($classblock);
  }

  return \@methods, $superpmc;
}

sub superpmc_info {
    my $pmc = shift;
    my $filename = "$FindBin::Bin/\L$pmc\E.pmc";
    print "Scanning $filename...\n";
    local $/;
    open(SUPERPMC, $filename) or die "open superpmc file $filename: $!";
    my $data = <SUPERPMC>;
    close SUPERPMC;
    return parse_superpmc($data);
}

sub scan_inheritance_tree {
    my ($class) = @_;

    my $leafclass = $class;

    my %methods; # { methodname => class }
    my %super; # { methodname => class }
    while ($class ne 'default') {
        my ($methods, $super) = superpmc_info($class);
        foreach my $method (@$methods) {
            $methods{$method} ||= $class;
            $super{$method} ||= $class unless $class eq $leafclass;
        }
        $class = $super;
    }

    foreach my $method (@{$default}) {
        $methods{$method->[1]} ||= 'default';
        $super{$method->[1]} ||= 'default';
    }

    return \%methods, \%super;
}

sub Usage {
    print STDERR <<_EOF_;
usage: $0 class.pmc [--no-lines] [class2.pmc ...]
  --no-lines suppresses #line directives
_EOF_
    exit 1;
}

#
# Process command-line arguments:
#

my $suppress_lines;
Usage() unless @ARGV;
if ($ARGV[0] eq '--no-lines') {
    $suppress_lines = 1;
    shift(@ARGV);
}

while (my $file = shift @ARGV) {

  my $base = $file;
  $base =~ s/\.pmc$//;
  my $cfile = "$base.c";
  my $hfile = "$base.h";

  die "$0: Could not read class file '$file'!\n" unless -e $file;

  open (PMC, $file) || die "$0: Unable to open file '$file'\n";
  my @contents = <PMC>;
  my $contents = join('', @contents);
  close PMC;

  my ($coutput, $houtput) = filter($contents, $file, $cfile); # run the filter

  open (SOURCE, ">$cfile") || die "$0: Could not write file '$cfile'\n";
  print SOURCE $coutput;
  close SOURCE;

  open (SOURCE, ">$hfile") || die "$0: Could not write file '$hfile'\n";
  print SOURCE $houtput;
  close SOURCE;
}

my %flags;

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

    # Rewrite SUPER(args...)
    s/SUPER\(\s*(.*?)\)/"$supermethod(".full_arguments($1).")"/eg;

    # Rewrite DYNSELF.other_method(args...)
    s/DYNSELF\.(\w+)\(\s*(.*?)\)/"pmc->vtable->$1(".full_arguments($2).")"/eg;

    # Rewrite DYNSELF(args...). See comments above.
    s/DYNSELF\(\s*(.*?)\)/"pmc->vtable->$method(".full_arguments($1).")"/eg;

    # Rewrite SELF.other_method(args...)
    s/SELF\.(\w+)\(\s*(.*?)\)/"Parrot_${class}_$1(".full_arguments($2).")"/eg;

    # Rewrite SELF -> pmc, INTERP -> interpreter
    s/SELF/pmc/g;
    s/INTERP/interpreter/g;

    return $_;
}

sub filter {
  my ($contents, $pmcfile, $cfile) = @_;
  my $lineno = 1;

  $contents =~ s/^(.*?^\s*)pmclass ([\w]*)//ms;
  my ($pre, $classname) = ($1, $2);
  $lineno += count_newlines($1);

  my ($methodloc, $supermethodloc) = scan_inheritance_tree($classname);

  my $saw_extends;
  my $superpmc = 'default';
  while ($contents =~ s/^(\s*)(\w+)//s) {
      $lineno += count_newlines($1);
      if ($saw_extends) {
          $superpmc = $2;
          $saw_extends = 0;
      } elsif ($2 eq 'extends') {
          $saw_extends = 1;
      } else {
          $flags{$2}++;
      }
  }

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

  while ($classblock =~ s/($signature_re)//) {
     $lineno += count_newlines($1);
     my ($type, $methodname, $parameters) = ($2,$3,$4);

     $parameters = ", $parameters" if $parameters =~ /\w/;
     if ($classblock =~ s/^(\s*=\s*default;?\s*)//s) {
        $lineno += count_newlines($1);
        $defaulted{$methodname}++;
        push @methods, $methodname;
        next;
     }

     my ($methodblock, $rema, $lines) = extract_balanced($classblock);
     $lineno += $lines;

     $methodblock = rewrite_method($classname, $methodname,
                                   $superpmc, $supermethodloc,
                                   $methodblock);
     my $decl = "$type Parrot_${classname}_${methodname} (struct Parrot_Interp *interpreter, PMC* pmc$parameters)";
     $OUT .= $decl;
     $HOUT .= "extern $decl;\n";
     $OUT .= "\n#line $lineno \"$pmcfile\"\n   " unless $suppress_lines;
     $OUT .= $methodblock;
     $OUT .= "\n\n";

     $lineno += count_newlines($methodblock);
     $classblock = $rema;
     push @methods, $methodname;
  };

  @methods = map { "Parrot_$methodloc->{$_->[1]}_$_->[1]" } @{$default};

  my $methodlist = join (",\n        ", @methods);
  my $initname = "Parrot_$classname" . "_class_init";

  my %visible_supers;
  @visible_supers{values %$methodloc} = ();

  my $includes = '';
  foreach my $class (keys %visible_supers) {
      $includes .= qq(#include "\L$class.h"\n);
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
static STRING* whoami;

EOC

  unless (exists $flags{noinit}) {
      my $initline = 1+count_newlines($OUT)+1;
      $OUT .= qq(#line $initline "$cfile"\n) unless $suppress_lines;
      $HOUT .= <<EOH;
void $initname (Interp *, int);
EOH
      $OUT .= <<EOC;

void $initname (Interp * interp, int entry) {

    struct _vtable temp_base_vtable = {
        NULL,
        enum_class_$classname,
        0, /* int_type - change me */
        0, /* float_type - change me */
        0, /* num_type - change me */
        0, /* string_type - change me */
        $methodlist
        };

   whoami = string_make(interp,
       "$classname", @{[length($classname)]}, 0, 0, 0);

   Parrot_base_vtables[entry] = temp_base_vtable;
}
EOC
  }

  return ($OUT, $HOUT);
}

__END__

=head1 NAME

pmc2c.pl - PMC compiler

=head1 SYNOPSIS

perl pmc2c.pl foo.pmc

=head1 DESCRIPTION

Compile the PMC file listed on the command line, producing
a corresponding .c file.

=head2 PMC FILE SYNTAX

The basic syntax of a PMC file is

=over 4

=item 1.

A preamble, consisting of code to be copied directly to the .c file

=item 2.

pmclass PMCNAME [extends PMCNAME] [abstract] [extension] [noinit] {

=item 3.

A list of vtable method implementations

=item 4.

The final close }

=back

=head2 METHOD BODY SUBSTITUTIONS

The vtable method bodies can use the following substitutions:

=over 4

=item *

I<SELF> - Converted to the current PMC object of type PMC*.

=item *

I<INTERP> - Converted to the interpreter object.

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

I<SUPER(a,b,c)> - calls the overridden implementation of the current
method in the nearest superclass, using the static type of SELF.

=item *

I<DYNSUPER(a,b,c)> - as above, but uses the actual dynamic type of SELF.

=back

=head1 LICENSE

This program is free software. It is subject to the same license
as the Parrot interpreter.

#! /usr/bin/perl -w
#
# ops2c.pl
#
# Generate a C source file from the methods defined in a .pmc file.
#

use strict;

sub extract_balanced {
    my $balance = 0;
    for(shift) {
        s/^\s+//;
        /^\{/ or die "bad block open: ".substr($_,0,10),"..."; # }
        while(/(\{)|(\})/g) {
            if($1) {
                $balance++;
            } else { # $2
                --$balance or return (substr($_, 0, pos, ""),  $_);
            }
        }
        die "Badly balanced" if $balance;
    }
}

sub Usage {
    print STDERR <<_EOF_;
usage: $0 class.pmc [class2.pmc ...]\n";
_EOF_
    exit 1;
}

#
# Process command-line argument:
#

Usage() unless @ARGV;  

while (my $file = shift @ARGV) {

  my $base = $file;
  $base =~ s/\.pmc$//;  
  my $cfile = "$base.c";

  die "$0: Could not read class file '$file'!\n" unless -e $file; 
  
  open (PMC, $file) || die "$0: Unable to open file '$file'\n";  
  my @contents = <PMC>;
  my $contents = join('', @contents);
  close PMC;
      
  my $coutput = filter($contents);     # run the filter

  open (SOURCE, ">$cfile") || die "$0: Could not write file '$cfile'\n";
  print SOURCE $coutput;  
  close SOURCE;
}

my %flags;

sub filter {
  my $contents = shift;
    
  $contents =~ s/^([^{]*)pmclass ([\w]*)//s; 
  my ($pre, $classname) = ($1, $2); 

  $flags{$1}++ while $contents =~ s/^\s*(\w+)//s;

  my ($classblock, $post) = extract_balanced($contents,);
  $classblock = substr($classblock, 2,-1); # trim out the { }

  my $signature_re = qr{
    ^
    (?:             #blank spaces and comments
      [\n\s]*
      (?:/\*.*?\*/)?  # C-like comments
    )*
  
    (\w+\**)      #type
    \s+
    (\w+)         #method name
    \s*    
    \(([^\(]*)\)  #parameters
  }sx;
  

  my @methods;

  my $OUT;
  my %default;

  while ($classblock =~ s/$signature_re//) {
     my ($type, $methodname, $parameters) = ($1,$2,$3);

     $parameters = ", $parameters" if $parameters =~ /\w/;
     if ($classblock =~ s/^\s*= default;?\s*//s) {
        $default{$methodname}++;
        push @methods, $methodname;
        next;
     }
     
     my ($methodblock, $rema) = extract_balanced($classblock);
  
     $methodblock =~ s/SELF/pmc/g;
     $methodblock =~ s/INTERP/interpreter/g;
    
     $OUT .= "$type Parrot_" . $classname. "_" . "$methodname (struct Parrot_Interp *interpreter, PMC* pmc$parameters)";      
     $OUT .= $methodblock;
     $OUT .= "\n\n";

     $classblock = $rema;
     push @methods, $methodname;
     };

  @methods = map {(exists $default{$_} ? "Parrot_default" : 
                                         "Parrot_$classname") 
                  ."_$_"} @methods;
  my $methodlist = join (",\n        ", @methods);
  my $initname = "Parrot_$classname" . "_class_init";
 
  if (keys %default) {
      $OUT = "#include \"default.h\"\n\n".$OUT;
  }

  $OUT = <<EOC . $OUT;
$pre

static STRING* whoami;

EOC

$OUT .= <<EOC unless exists $flags{noinit};

void $initname (void) {

    struct _vtable temp_base_vtable = {
        NULL,
        enum_class_$classname,
        0, /* int_type - change me */
        0, /* float_type - change me */
        0, /* num_type - change me */
        0, /* string_type - change me */
        $methodlist
        };
    
   whoami = string_make(NULL, /* DIRTY HACK */
       "$classname", 7, 0, 0, 0);

   Parrot_base_vtables[enum_class_$classname] = temp_base_vtable;
}
EOC

  return $OUT;
}
  


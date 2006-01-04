#!/usr/bin/perl

use strict;

=head1 NAME

gen_inline.pl

=head1 SYNOPSIS

 %perl languages/tcl/tools/gen_inline.pl lib/builtins/*.tmt > output.pir

=head1 DESCRIPTION

Use this script to generate PIR code based on a template describing how
the inlined tcl builtin works. Parameters specifying argument types and
subcommands can be specified, the build tool takes this and generates the
actual compiler for that command.

Many builtins need to use the same type of code, and do the same kind
of optimizations. By making the inline'd versions more declarative, this
lets us do this work B<once> instead of many times, which B<should> make it
easier to inline more builtins accurately.j

=cut

my $namespace = "_Tcl::builtins";

local undef $/;

FILE:
foreach my $file (@ARGV)
{
  open my $handle, "<", $file or die "can't open $file for reading";

  my $template; # perl variable containing the commands DS.
  my $contents; # raw contents of the .tmt file
  my @pir_code; # see comment below

=head2 Internal notes...

@pir_code internal variable

This is a bit complicated. We are munging a template file into PIR code
which in turn is generating more PIR code. We'll call the inner PIR C<INLINED>
and the outer PIR C<CALLER>.

@pir_code is an array of array refs. The first is a key, the second is data.

If the Key is C<INLINE>, then this will be concated to the C<INLINED> PIR. Magic
is done to expand {pir_variable} elements into the string to support the common
idiom of:

 pir_code .= "$P"
 $S0 = some_var
 pir_code .= $S0
 pir_code .= "= value\n"

Which can now be written as: 
 
 $P{some_var} = value

If the Key is C<VAR>, this represents a variable in the C<CALLER> scope, which
will be concated to the C<INLINED> PIR.

If the Key is C<WRAP>, this represents PIR code in the C<CALLER>.

As we process the template, we generate this array. The end result is PIR
.sub declaration (C<CALLER>) that in turn contains the inlined PIR which will
eventually be compiled (C<INLINED>).

=cut

  $contents = <$handle>;

  my $code = "\$template = $contents";
  eval "\$template = $contents";       # ewww...
  die "error processing $file: $@" if ($@);


  push @pir_code, [ WRAP => <<END_PIR];

.namespace [ "_Tcl::builtins"]

.sub '$template->{command}'
  .param int register_num
  .param pmc argv

  .local pmc compiler
  compiler = find_global '_Tcl', 'compile_dispatch'

  .local int argc
  .local string pir_code,temp_code
  pir_code = ''
  argc = argv
END_PIR

  my ($min_args,$max_args) = num_args($template);

  if ($max_args == $min_args)
   {

     push @pir_code, [ WRAP => <<END_PIR];
  if argc != $max_args goto bad_args
END_PIR

   }
   else
   {

     push @pir_code, [ WRAP => <<END_PIR];
  if argc < $min_args goto bad_args
  if argc > $max_args goto bad_args
END_PIR

   }

  # XXX We're including more here than we strictly need to. Check for which
  # arguments are required.

  push @pir_code, [ INLINE => <<END_PIR];
  .local pmc __read
  __read     = find_global '_Tcl', '__read'
  .local pmc __set
  __set      = find_global '_Tcl', '__set'
  .local pmc __integer
  __integer  = find_global '_Tcl', '__integer'
  .local pmc __list
  __list     = find_global '_Tcl', '__list'
END_PIR

   # Now, grab each arg off the list and compile it, handling defaults, etc.
   # XXX make this a sub when we add subcommands...
   my $ii = 0;
   foreach my $arg (@ {$template->{args}})
   {
     my $argument     = "argument_$arg->{name}";
     my $arg_register = "register_$arg->{name}";
     my $arg_default  = "default_$arg->{name}";
     my $arg_done     = "done_$arg->{name}";
     my $type         = "TclString";
     my $typequotes   = "'";

     push @pir_code, [ WRAP => <<END_PIR];
  .local pmc $argument
  .local int $arg_register
END_PIR

     if ($arg->{optional})
     {
       my $next_arg = $ii + 1;
       push @pir_code, [ WRAP => <<END_PIR];
  if argc < $next_arg goto $arg_default
END_PIR

     }

     push @pir_code, [ WRAP => <<END_PIR];
  $argument = argv[$ii]
END_PIR

     if ($arg->{type} eq "variable")
     {
       # Using variable means we have two registers we care about:
       # $arg_register is the register of the resulting value
       # $arg_register_varname is the register of the variable name.
        
       push @pir_code, [ WRAP => <<END_PIR];
  .local int ${arg_register}_varname
  (${arg_register}_varname,temp_code) = compiler(register_num, $argument)
  $arg_register = ${arg_register}_varname + 1
  register_num = $arg_register + 1
END_PIR
      push @pir_code, [ VAR => "temp_code" ];

      push @pir_code, [ INLINE => <<END_PIR];
  \$P{$arg_register} = __read(\$P{${arg_register}_varname})
END_PIR

      push @pir_code, [ WRAP => "goto $arg_done\n"] ;

     }
     elsif ($arg->{type} eq "list")
     {
       push @pir_code, [ WRAP => <<END_PIR];
  ($arg_register,temp_code) = compiler(register_num, $argument)
  register_num = $arg_register + 1
END_PIR

      push @pir_code, [ VAR => "temp_code" ];

      push @pir_code, [ INLINE => <<END_PIR];
  \$P{$arg_register} = __list(\$P{$arg_register})
END_PIR

      push @pir_code, [ WRAP => "goto $arg_done\n" ];
     }
     elsif ($arg->{type} eq "string")
     {
       push @pir_code, [ WRAP => <<END_PIR];
  ($arg_register,temp_code) = compiler(register_num, $argument)
  register_num = $arg_register + 1
END_PIR

      push @pir_code, [ VAR => "temp_code" ];

      push @pir_code, [ WRAP => "goto $arg_done\n" ];


     }
     elsif ($arg->{type} eq "integer")
     {
       $type = "TclInt";
       undef $typequotes;
       push @pir_code, [ WRAP => <<END_PIR];
  ($arg_register,temp_code) = compiler(register_num, $argument)
  register_num = $arg_register + 1
END_PIR

      push @pir_code, [ VAR => "temp_code" ];

      push @pir_code, [ INLINE => <<END_PIR];
  \$P{$arg_register} = __integer(\$P{$arg_register})
END_PIR

      push @pir_code, [ WRAP => "goto $arg_done\n" ];


     }
     else
     {
       die "Invalid argument type '$arg->{type}' specified in $file\n";
     }

     push @pir_code, [ WRAP => <<END_PIR];
$arg_default:
END_PIR

    if ($arg->{default})
    {
       push @pir_code, [ WRAP => <<END_PIR];
  $arg_register = register_num
  register_num = $arg_register + 1
END_PIR

       push @pir_code, [ INLINE => <<END_PIR];
  \$P{$arg_register} = new .$type
  \$P{$arg_register} = $typequotes$arg->{default}$typequotes
END_PIR

    }
    else
    {

     push @pir_code, [ WRAP => <<END_PIR];
# no default
END_PIR

    }

     push @pir_code, [ WRAP => <<END_PIR];
$arg_done:
END_PIR

     $ii++;
  }

  push @pir_code, [ WRAP => <<"END_PIR"];
  inc register_num
  # Begin template code
END_PIR

  push @pir_code, [ INLINE => $template->{code} ];

  push @pir_code, [ WRAP => <<"END_PIR"];
  # End template code
END_PIR

  push @pir_code, [ WRAP => <<END_PIR ];
  .return(register_num,pir_code)

bad_args:
  .throw('$template->{bad_args}')
.end

END_PIR


  # Now dump out the code we've been accumulating.
  foreach my $chunk (@pir_code)
  {
    if ($chunk->[0] eq "WRAP")
    {
      print $chunk->[1];
    }
    elsif ($chunk->[0] eq "INLINE")
    {
      foreach my $line (split/\n/, $chunk->[1])
      {
        $line =~ s/\\/\\\\/g;
        $line =~ s/"/\\"/g;
        $line =~ s/\\n/\\\\n/g;
        if ($line =~ s/(.*?){(.*?)}//) {
          print "  pir_code .= \"$1\"\n";
          print "  \$S0 = $2\n";
          print "  pir_code .= \$S0\n";
          redo; # keep processing this line until we've gotten all the elements
        }
        else {
          print "  pir_code .= \"$line\\n\"\n";
        }
      }
    }
    else # VAR
    {
      print "pir_code .= $chunk->[1]\n";
    }
  }
}

=head1 Utility Methods

=head2 (min,max) = num_args($template)

Given a template, figure out the minimum and maximum number of args required
for this builtin.

=cut

sub num_args {
  my ($template) = shift;

  my $args = $template->{args};

  my ($max,$min);
  $max = $min =  @$args;

  foreach my $arg (reverse @$args)
  {
    $min-- if ($arg->{optional});
  }
  return ($min,$max);
}

=head1 BUGS

Doesn't support subcommands. Or anything other than [incr], really.

=cut


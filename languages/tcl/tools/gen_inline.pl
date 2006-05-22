#!/usr/bin/perl -w

use strict;

=head1 NAME

gen_inline.pl

=head1 SYNOPSIS

 %perl languages/tcl/tools/gen_inline.pl lib/builtins/foo.tmt > lib/builtins/foo.pir

=head1 DESCRIPTION

Use this script to generate PIR code based on a template describing how
the inlined tcl builtin works. Parameters specifying argument types and
subcommands can be specified, the build tool takes this and generates the
actual compiler for that command.

Many builtins need to use the same type of code, and do the same kind
of optimizations. By making the inlined versions more declarative, this
lets us do this work B<once> instead of many times, which B<should> make it
easier to inline more builtins accurately.

Currently supports the following types of arguments: 
variable name, integer, channel, list, string, script, and expressions.

=head2 Internal notes...

If code is run through the C<inlined> subroutine, magic is done to expand
{pir_variable} elements into the string to support the common idiom of:

 pir_code .= "$P"
 $S0 = some_var
 pir_code .= $S0
 pir_code .= "= value\n"

Which can now be written as: 
 
 $P{some_var} = value

=cut

local undef $/;

my $file = shift @ARGV;

open my $handle, "<", $file
or die "can't open '$file' for reading";

my $contents = <$handle>;            # raw contents of the .tmt file
my $template = eval "{ $contents }"; # perl variable containing the commands DS.
die "error processing $file: $@" if $@;

my @args_opts = parse_usage( $template->{usage} );

my ( $min_args, $max_args ) = num_args(@args_opts);


print <<"END_PIR";

.HLL '_Tcl', ''
.namespace [ 'builtins' ]

.sub '$template->{command}'
  .param int register_num
  .param pmc argv

  .local pmc compiler
  .get_from_HLL(compiler, '_tcl', 'compile_dispatch')

  .local int argc
  .local string pir_code,temp_code
  pir_code = ''
  argc = argv
END_PIR


if ( $max_args == $min_args ) {
    print <<"END_PIR";
  if argc != $max_args goto bad_args
END_PIR

}
else {

    print <<"END_PIR";
  if argc < $min_args goto bad_args
END_PIR

  if ($max_args) {
    print <<"END_PIR";
  if argc > $max_args goto bad_args
END_PIR
  }
}

# XXX We're including more here than we need to. Check for which
# arguments are required - even better, push this out to the compiler.
# Eventually all these helpers should be inlined, but in the meantime,
# we could scan the compiled code for __foo( and pull in the global def
# as needed.

print inlined(<<"END_PIR");
  .local pmc __read
  .get_from_HLL(__read,'_tcl','__read')
  .local pmc __set
  .get_from_HLL(__set,'_tcl','__set')
  .local pmc __integer
  .get_from_HLL(__integer,'_tcl','__integer')
  .local pmc __list
  .get_from_HLL(__list,'_tcl','__list')
  .local pmc __channel
  .get_from_HLL(__channel,'_tcl','__channel')
END_PIR

print <<"END_PIR";
  .local pmc __script_compile
  .get_from_HLL(__script_compile, '_tcl', 'compile')
  .local pmc __expression_compile
  .get_from_HLL(__expression_compile, '_tcl', '__expression_compile')
END_PIR

# Now, grab each arg off the list and compile it, handling defaults, etc.
# XXX Refactor when we add subcommands
my $ii = 0;
foreach my $arg (@args_opts) {
    my $argument     = "argument_$arg->{name}";
    my $arg_register = "register_$arg->{name}";
    my $arg_default  = "default_$arg->{name}";
    my $arg_done     = "done_$arg->{name}";
    my $type         = "TclString";
    my $typequotes   = "'";

    my $type_handlers = {
        script => sub {
            print <<"END_PIR";
  .local string ${arg_register}_code
  ($arg_register,${arg_register}_code) = __script_compile(register_num, $argument)
  #XXX This wild increase in register numbers is to avoid a problem in 
  #    tcl command's compiler which, in one case, used \$P5 to calculate an
  #    argument, but then returned the result in \$P4. Register usage should be
  #    bounded between the value you pass in and the value you return. Using
  #    something outside that range is bad, mmkay? -coke
  register_num = $arg_register + 100 
END_PIR
        },
        
        expr => sub {
            print <<"END_PIR";
  .local string ${arg_register}_code
  ($arg_register,${arg_register}_code) = __expression_compile(register_num, $argument)
  register_num = $arg_register + 100
END_PIR
        },
        
        var     => sub {
            # Using 'variable' means we have two registers we care about:
            # $arg_register is the register of the resulting value
            # $arg_register_varname is the register of the variable name.

            print <<"END_PIR";
  .local int ${arg_register}_varname
  (${arg_register}_varname,temp_code) = compiler(register_num, $argument)
  $arg_register = ${arg_register}_varname + 1
  register_num = $arg_register + 1
  pir_code .= temp_code
END_PIR
            print inlined(<<"END_PIR");
  \$P{$arg_register} = __read(\$P{${arg_register}_varname})
END_PIR
        },
        
        channel => sub {
            print <<"END_PIR";
  ($arg_register,temp_code) = compiler(register_num, $argument)
  register_num = $arg_register + 1
  pir_code .= temp_code
END_PIR
            print inlined(<<"END_PIR");
  \$P{$arg_register} = __channel(\$P{$arg_register})
END_PIR
        },
        
        list    => sub {
            print <<"END_PIR";
  ($arg_register,temp_code) = compiler(register_num, $argument)
  register_num = $arg_register + 1
  pir_code .= temp_code
END_PIR
            print inlined(<<"END_PIR");
  \$P{$arg_register} = __list(\$P{$arg_register})
END_PIR
        },
        
        int     => sub {
            $type       = "TclInt";
            $typequotes = '';
            print <<"END_PIR";
  ($arg_register,temp_code) = compiler(register_num, $argument)
  register_num = $arg_register + 1
  pir_code .= temp_code
END_PIR
            print inlined(<<"END_PIR");
  \$P{$arg_register} = __integer(\$P{$arg_register})
END_PIR
        },
        
        string  => sub {
            print <<"END_PIR";
  ($arg_register,temp_code) = compiler(register_num, $argument)
  register_num = $arg_register + 1
  pir_code .= temp_code
END_PIR
        }
    };

    print <<"END_PIR";
  .local pmc $argument
  .local int $arg_register
END_PIR

    if ( $arg->{optional} ) {
        my $next_arg = $ii + 1;
        print <<"END_PIR";
  if argc < $next_arg goto $arg_default
END_PIR

    }

    print <<"END_PIR";
  $argument = argv[$ii]
END_PIR

    my $handler = $type_handlers->{ $arg->{type} };
    $handler->() if $handler;

    print <<"END_PIR";
  goto $arg_done
$arg_default:
END_PIR

    if ( defined $arg->{default} ) {
        print <<"END_PIR";
  $arg_register = register_num
  register_num = $arg_register + 1
END_PIR

        print inlined(<<"END_PIR");
  \$P{$arg_register} = new .$type
  \$P{$arg_register} = $typequotes$arg->{default}$typequotes
END_PIR

    }
    else {
        print "  #no default\n";
    }

    print <<"END_PIR";
$arg_done:
END_PIR

    $ii++;
}

print <<"END_PIR";
  inc register_num
  # Begin template code
END_PIR

print inlined( $template->{code} );

print <<"END_PIR";
  # End template code
  .return(register_num,pir_code)
bad_args:
END_PIR

if ( $template->{bad_args} ) {

    print inlined(<<"END_PIR");
.throw('$template->{bad_args}')
END_PIR

}
else {
    my $usage_str = create_usage(@args_opts);
    print <<"END_PIR";
  .throw('wrong # args: should be "$template->{command}$usage_str"')
END_PIR
}

print ".end\n";

=head1 Utility Methods

=head2 (min,max) = num_args($template)

Given an argset, figure out the minimum and maximum number of args required
for this builtin.

=cut

sub num_args {
    my @args = @_;

    my $min = my $max = @args;

    my $is_repeating; 

    foreach my $arg (@args) {
        $min-- if $arg->{optional};

        # XXX this isn't quite right. Need to be more clever with options.
        $max++ if $arg->{option} && $arg->{type};
        $is_repeating = $arg->{repeating};
    }

    $max = undef if $is_repeating;
    
    return $min, $max;
}

sub inlined {
    my $code = "";
    
    foreach my $line (split "\n", shift) {
        $line =~ s/\\/\\\\/g;
        $line =~ s/"/\\"/g;
        $line =~ s/\\n/\\\\n/g;
        if ( $line =~ s/(.*?){(.*?)}// ) {
            # register interpolation
             if ($1 ne "") {
                 $code .= "  pir_code .= \"$1\"\n";
             }
             $code .= "  \$S0 = $2\n";
             $code .= "  pir_code .= \$S0\n";
             redo
             ; # keep processing this line until we've gotten all the elements
        }
        else {
            $code .= "  pir_code .= \"$line\\n\"\n";
        }
    }

    return $code;
}

sub parse_usage {
    my $usage = shift;

    my @results;
    my $types = join "|", qw(int string var list channel script expr);

    while ($usage) {
        $usage =~ s/^ +//;
        next unless $usage;
        if (
            $usage =~ s{
      ^
      (\??)             # literal, optional ?

       (-?)             # option marker

      (\w+)             # name

      (?: : ($types) )? # optional type
      (?: = ([^?]*)  )? # optional default value
      (\+?)             # is this repeating?

      (\??)             # optional closing ?
    }{}x
          )
        {
            my $arg = {};
            
            $arg->{optional}    = !!$1;
            $arg->{option}      = !!$2;
            $arg->{name}        = $3;
            $arg->{type}        = $4 || ( $arg->{option} ? undef: "string" );
            $arg->{default}     = $5;
            $arg->{repeating}   = $6 eq "+";
            
            if ( $arg->{option} && !$arg->{optional} ) {
                die "Optionals need to be optional.\n";
            }
            
            push @results, $arg;
        }
        else {
            die "invalid usage '$usage'\n";
        }
    }

    return @results;
}

# the usage from the .tmt file is not the same as the generated error
# messages: construct a user-visible usage.

sub create_usage {
    my @args = @_;

    my @results;

    foreach my $arg (@args) {
        my $usage = $arg->{name};
        
        if ( $arg->{option} ) {
            $usage = "-$usage";
            if ( defined $arg->{type} ) {
                $usage = "$usage $arg->{type}";
            }
        }
        
        if ($arg->{repeating}) {
            if ($arg->{optional}) {
                $usage = "?$usage $usage ...?";
            } else {
                $usage = "$usage ?$usage ...?";
            }
        } else {
            $usage = "?$usage?" if $arg->{optional};
        }
        
        push @results, $usage;
    }

    my $result = join " ", @results;
    $result = " $result" if @results;
    return $result;
}

=head1 TODO

Doesn't support subcommands. 

=cut


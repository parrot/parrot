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
of optimizations. By making the inline'd versions more declarative, this
lets us do this work B<once> instead of many times, which B<should> make it
easier to inline more builtins accurately.j

Currently support options with no arguments, and the following types of
arguments: variable name, integer, channel, list, and string.

=cut

my $namespace = "_Tcl::builtins";    # The namespace all these commands live in

local undef $/;

my $file = shift @ARGV;

open my $handle, "<", $file or die "can't open $file for reading";

my $template;                        # perl variable containing the commands DS.
my $contents;                        # raw contents of the .tmt file
my @pir_code;                        # see comment below

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
eval "\$template = $contents";    # ewww...
die "error processing $file: $@" if ($@);

add_wrapped(<<END_PIR);

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

my @args_opts = parse_usage( $template->{usage} );

my ( $min_args, $max_args ) = num_args(@args_opts);

if ( $max_args == $min_args ) {
    add_wrapped(<<END_PIR);
  if argc != $max_args goto bad_args
END_PIR

}
else {

    add_wrapped(<<END_PIR);
  if argc < $min_args goto bad_args
  if argc > $max_args goto bad_args
END_PIR

}

# XXX We're including more here than we need to. Check for which
# arguments are required - even better, push this out to the compiler.
# Eventually all these helpers should be inlined, but in the meantime,
# we can scan the compiled code for __foo( and pull in the global def
# as needed.

add_inlined(<<END_PIR);
  .local pmc __read
  __read     = find_global '_Tcl', '__read'
  .local pmc __set
  __set      = find_global '_Tcl', '__set'
  .local pmc __integer
  __integer  = find_global '_Tcl', '__integer'
  .local pmc __list
  __list     = find_global '_Tcl', '__list'
  .local pmc __channel
  __channel  = find_global '_Tcl', '__channel'
END_PIR
add_wrapped(<<END_PIR);
  .local pmc __script_compile
  __script_compile = find_global '_Tcl', 'compile'
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
        script => {
            pre => sub {
                add_wrapped(<<END_PIR);
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
        },
        var => {
            pre => sub {

                # Using 'variable' means we have two registers we care about:
                # $arg_register is the register of the resulting value
                # $arg_register_varname is the register of the variable name.

                add_wrapped(<<END_PIR);
  .local int ${arg_register}_varname
  (${arg_register}_varname,temp_code) = compiler(register_num, $argument)
  $arg_register = ${arg_register}_varname + 1
  register_num = $arg_register + 1
END_PIR
  add_var('temp_code');
            },
            post => sub {
                add_inlined(<<END_PIR);
  \$P{$arg_register} = __read(\$P{${arg_register}_varname})
END_PIR
              }
        },
        channel => {
            pre => sub {
                add_wrapped(<<END_PIR);
  ($arg_register,temp_code) = compiler(register_num, $argument)
  register_num = $arg_register + 1
END_PIR
  add_var('temp_code');
            },
            post => sub {
                add_inlined(<<END_PIR);
  \$P{$arg_register} = __channel(\$P{$arg_register})
END_PIR
              }
        },
        list => {
            pre => sub {
                add_wrapped(<<END_PIR);
  ($arg_register,temp_code) = compiler(register_num, $argument)
  register_num = $arg_register + 1
END_PIR
  add_var('temp_code');
            },
            post => sub {
                add_inlined(<<END_PIR);
  \$P{$arg_register} = __list(\$P{$arg_register})
END_PIR
              }
        },
        int => {
            pre => sub {
                $type       = "TclInt";
                $typequotes = '';
                add_wrapped(<<END_PIR);
  ($arg_register,temp_code) = compiler(register_num, $argument)
  register_num = $arg_register + 1
END_PIR
  add_var('temp_code');
            },
            post => sub {
                add_inlined(<<END_PIR);
  \$P{$arg_register} = __integer(\$P{$arg_register})
END_PIR
              }
        },
        string => {
            pre => sub {
                add_wrapped(<<END_PIR);
  ($arg_register,temp_code) = compiler(register_num, $argument)
  register_num = $arg_register + 1
END_PIR
  add_var('temp_code');
            },
        }
    };

    add_wrapped(<<END_PIR);
  .local pmc $argument
  .local int $arg_register
END_PIR

    if ( $arg->{optional} ) {
        my $next_arg = $ii + 1;
        add_wrapped(<<END_PIR);
  if argc < $next_arg goto $arg_default
END_PIR

    }

    add_wrapped(<<END_PIR);
  $argument = argv[$ii]
END_PIR

    my $pre  = $type_handlers->{ $arg->{type} }->{pre};
    my $post = $type_handlers->{ $arg->{type} }->{post};

    if ($pre)  { $pre->()  }
    if ($post) { $post->() }

    add_wrapped(<<END_PIR);
  goto $arg_done
$arg_default:
END_PIR

    if ( defined $arg->{default} ) {
        add_wrapped(<<END_PIR);
  $arg_register = register_num
  register_num = $arg_register + 1
END_PIR

        add_inlined(<<END_PIR);
  \$P{$arg_register} = new .$type
  \$P{$arg_register} = $typequotes$arg->{default}$typequotes
END_PIR

    }
    else {
        add_wrapped("  #no default\n");
    }

    add_wrapped(<<END_PIR);
$arg_done:
END_PIR

    $ii++;
}

add_wrapped(<<END_PIR);
  inc register_num
  # Begin template code
END_PIR

add_inlined( $template->{code} );

add_wrapped(<<"END_PIR");
  # End template code
END_PIR

add_wrapped(<<"END_PIR");
.return(register_num,pir_code)
bad_args:
END_PIR

if ( $template->{bad_args} ) {

    add_inlined(<<END_PIR);
.throw('$template->{bad_args}')
END_PIR

}
else {
    my $usage_str = create_usage(@args_opts);
    add_wrapped(<<END_PIR);
  .throw('wrong # args: should be "$template->{command}$usage_str"')
END_PIR
}

add_wrapped(".end\n");

# Now dump out the code we've been accumulating.
foreach my $chunk (@pir_code) {
    if ( $chunk->[0] eq "WRAP" ) {
        print $chunk->[1];
    }
    elsif ( $chunk->[0] eq "INLINE" ) {
        foreach my $line ( split /\n/, $chunk->[1] ) {
            $line =~ s/\\/\\\\/g;
            $line =~ s/"/\\"/g;
            $line =~ s/\\n/\\\\n/g;
            if ( $line =~ s/(.*?){(.*?)}// ) {
                # register interpolation
                if ($1 ne "") {
                  print "  pir_code .= \"$1\"\n";
                }
                print "  \$S0 = $2\n";
                print "  pir_code .= \$S0\n";
                redo
                  ; # keep processing this line until we've gotten all the elements
            }
            else {
                print "  pir_code .= \"$line\\n\"\n";
            }
        }
    }
    else            # VAR
    {
        print "  pir_code .= $chunk->[1]\n";
    }
}

=head1 Utility Methods

=head2 (min,max) = num_args($template)

Given an argset, figure out the minimum and maximum number of args required
for this builtin.

=cut

sub num_args {
    my @args = @_;

    my ( $max, $min );
    $min = $max = @args;

    foreach my $arg (@args) {
        $min-- if ( $arg->{optional} );

        # XXX this isn't quite right. Need to be more clever with options.
        $max++ if ( $arg->{option} && $arg->{type} );
    }

    return ( $min, $max );
}

sub parse_usage {
    my $usage = shift;

    my @results;

    while ($usage) {
        my $arg;
        $usage =~ s/^ +//;
        next unless $usage;
        if (
            $usage =~ s{
      ^
      (\??)     # literal, optional ?
      (-?)      # option marker
      (\w+)     # name
      (?:
        :       # literal :
        (int | string | var | list | channel | script)
      )?
      (?:
        =
        ([^?]*)  # default value
      )?
      (?:\1)
    }{}x
          )
        {
            $arg->{optional} = ( $1 ? 1 : 0 );
            $arg->{option}   = ( $2 ? 1 : 0 );
            $arg->{name}     = $3;
            $arg->{type} = ( $4 ? $4 : ( $arg->{option} ? undef: "string" ) );
            $arg->{default} = ( defined($5) ? $5 : undef );
            if ( $arg->{option} && !$arg->{optional} ) {
                die "Optionals need to be optional.\n";
            }
        }
        else {
            die "invalid usage '$usage'\n";
        }
        push @results, $arg;
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
            if ( defined( $arg->{type} ) ) {
                $usage = "$usage $arg->{type}";
            }
        }
        $usage = "?$usage?" if ( $arg->{optional} );
        push @results, $usage;
    }

    my $result = join( " ", @results );
    $result = " $result" if @results;
    return $result;
}

sub add_inlined { push @pir_code, [ INLINE => $_ ] for @_; }
sub add_wrapped { push @pir_code, [ WRAP   => $_ ] for @_; }
sub add_var     { push @pir_code, [ VAR    => $_ ] for @_; }

=head1 TODO

Doesn't support subcommands. 

=cut


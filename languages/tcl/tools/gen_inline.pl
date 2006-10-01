#! perl
use strict;
use warnings;

=head1 NAME

gen_inline.pl

=head1 SYNOPSIS

 %perl languages/tcl/tools/gen_inline.pl src/builtins/foo.tmt
                                              > src/builtins/foo.pir

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

=cut

# helper conversion subroutines
our %conversions = (

    # type     subroutine
    bool    => '__boolean',
    channel => '__channel',
    expr    => '__expr',
    int     => '__integer',
    list    => '__list',
    script  => '__script',
    var     => '__read',
);

my $file = open_tmt( shift @ARGV );
my ( $cmd, @args ) = extract_info($file);

print ".HLL '_Tcl', ''\n";
print ".namespace [ 'builtins' ]\n";
print inlined_header( $cmd, @args );
print arg_check(@args);
print inlined_helpers(@args);
print inlined_arguments(@args);
print inlined_body( $file, @args );
print inlined_badargs( $cmd, @args );
print footer();

print ".HLL 'Tcl', 'tcl_group'\n";
print ".namespace\n";
print header( $cmd, @args );
print arg_check(@args);
print helpers(@args);
print arguments(@args);
print body( $file, @args );
print badargs( $cmd, @args );
print footer();

sub open_tmt {
    my ($filename) = @_;

    open my $fh, '<', $filename
        or die "can't open '$filename' for reading";

    my @file = <$fh>;

    return \@file;
}

sub extract_info {
    my ($file) = @_;

    my $spec = shift @$file;
    die "Invalid args: '$spec'\n"
        unless $spec =~ /\[ (\w+) (?: \s+ (.+?) )? \]/x;

    my $cmd  = $1;
    my $args = $2;

    return $cmd, parse_usage($args);
}

sub parse_usage {
    my $usage = shift;

    my @results;
    my $types = join '|', keys %conversions;
    my $type  = qr{
        (\??)             # literal, optional ?

        (-?)              # option marker

        (\w+)             # name

        ( (?: : (?:$types))* ) # optional types
        (?: = ([^?]*)  )?      # optional default value

        (\+?)             # is this repeating?

        (\??)             # optional closing ?
    }xo;

    while ($usage) {
        $usage =~ s/^\s+//;
        next unless $usage;
        die "invalid usage: '$usage'\n"
            unless $usage =~ s/^$type//;

        my $arg = {};

        $arg->{optional}  = !!$1;
        $arg->{option}    = !!$2;
        $arg->{name}      = $3;
        $arg->{type}      = [ grep length, split( ':', $4 ) ];
        $arg->{default}   = $5;
        $arg->{repeating} = $6 eq '+';

        $arg->{type} = ['string']
            if not @{ $arg->{type} };

        die "Optionals need to be optional.\n"
            if $arg->{option}
            and not $arg->{optional};

        push @results, $arg;
    }

    return @results;
}

sub inlined_header {
    my ( $cmd, @args ) = @_;

    my $code = <<"END_PIR";
    
.sub '$cmd'
  .param int register
  .param pmc raw_argv
  .param pmc argv

  .local int argc
  .local string pir
  pir = ''
  argc = elements argv
  # the number for the loops
  .local int loop_num
  loop_num = register

END_PIR

    return $code;
}

sub header {
    my ( $cmd, @args ) = @_;

    my $code = <<"END_PIR";
        
.sub '&$cmd'
  .param pmc argv :slurpy
        
  .local int argc
  argc = elements argv
END_PIR

    return $code;
}

sub arg_check {
    my (@args) = @_;

    my ( $min, $max ) = num_args(@args);
    my $code = '';

    if ( $max == $min ) {
        $code .= "  if argc != $max goto bad_args\n";
    }
    else {
        $code .= "  if argc < $min goto bad_args\n";

        $code .= "  if argc > $max goto bad_args\n"
            if $max;
    }

    return $code;
}

sub inlined_helpers {
    my (@args) = @_;

    # types present in this command
    my %types = ();
    for my $arg (@args) {
        $types{$_} = 1 for @{ $arg->{type} };
    }

    # add code to get subs for needed conversions
    my $code = "  # get necessary conversion subs\n";
    for my $type ( keys %types ) {
        next unless my $help = $conversions{$type};

        $code .= emit("  .local pmc $help");
        $code .= emit("  $help = get_root_global ['_tcl'], '$help'");
    }

    return $code;
}

sub helpers {
    my (@args) = @_;

    # types present in this command
    my %types = ();
    for my $arg (@args) {
        $types{$_} = 1 for @{ $arg->{type} };
    }

    # add code to get subs for needed conversions
    my $code = "  # get necessary conversion subs\n";
    for my $type ( keys %types ) {
        next unless my $help = $conversions{$type};

        $code .= "  .local pmc $help \n";
        $code .= "  $help = get_root_global ['_tcl'], '$help' \n";
    }

    return $code;
}

sub inline {
    my $line = shift;
    return "  pir .= \"$line\"\n";
}

sub inlined_arguments {
    my (@args) = @_;

    my $code = '';
    for my $i ( 0 .. $#args ) {
        my $arg  = $args[$i];
        my $name = $arg->{name};

        $code .= emit( "  .local pmc a_${name}_%0", 'loop_num' );

        # do we need to use a default?
        $code .= "  if argc < " . ( $i + 1 ) . " goto default_$name \n"
            if $arg->{optional};

        # the actual thing to be compiled
        $code .= " .local string r_$name \n";
        $code .= " r_$name = argv[$i] \n";
        $code .= emit( "a_${name}_%0 = %1", 'loop_num', "r_$name" );

        # convert the argument, if necessary
        for my $type ( @{ $arg->{type} } ) {
            my $convert = $conversions{$type};

            $code .= emit( "a_${name}_%0 = $convert(a_${name}_%0)", 'loop_num' )
                if $convert;
        }

        # default value, if necessary
        if ( defined $arg->{default} ) {
            my $is_int = $arg->{type}[-1] eq 'int';
            my $type  = $is_int ? 'TclInt' : 'TclString';
            my $quote = $is_int ? ''       : "'";
            my $default = $arg->{default};

            $code .= "  goto done_$name \n";
            $code .= "default_$name: \n";
            $code .= emit( "a_${name}_%0 = new .$type", 'loop_num' );
            $code .= emit( "a_${name}_%0 = $quote$default$quote", 'loop_num' );
            $code .= "done_$name: \n";
        }
        elsif ( $arg->{optional} ) {
            $code .= "  goto done_$name \n";
            $code .= "default_$name: \n";
            $code .= emit( "null a_${name}_%0", 'loop_num' );
            $code .= "done_$name: \n";
        }

    }

    return $code;
}

sub arguments {
    my (@args) = @_;

    my $code = '';
    for my $i ( 0 .. $#args ) {
        my $arg  = $args[$i];
        my $name = $arg->{name};

        $code .= "  .local pmc a_$name \n";

        # do we need to use a default?
        $code .= "  if argc < " . ( $i + 1 ) . " goto default_$name \n"
            if $arg->{optional};

        # the actual thing to be compiled
        $code .= "  a_$name = argv[$i] \n";

        # convert the argument, if necessary
        for my $type ( @{ $arg->{type} } ) {
            my $convert = $conversions{$type};

            $code .= "  a_$name = $convert(a_$name) \n"
                if $convert;
        }

        # default value, if necessary
        if ( defined $arg->{default} ) {
            my $is_int = $arg->{type}[-1] eq 'int';
            my $type  = $is_int ? 'TclInt' : 'TclString';
            my $quote = $is_int ? ''       : "'";
            my $default = $arg->{default};

            $code .= "  goto done_$name \n";
            $code .= "default_$name: \n";
            $code .= "  a_$name = new .$type \n";
            $code .= "  a_$name = $quote$default$quote \n";
            $code .= "done_$name: \n";
        }
        elsif ( $arg->{optional} ) {
            $code .= "  goto done_$name \n";
            $code .= "default_$name: \n";
            $code .= "  null a_$name \n";
            $code .= "done_$name: \n";
        }
    }

    return $code;
}

sub emit {
    my ( $code, @args ) = @_;

    chomp $code;

    my $pir = '';
    while ( $code =~ s/^([^%]*)%(\d+)// ) {
        $pir .= inline($1) if $1;
        $pir .= "  \$S0 = $args[$2] \n";
        $pir .= "  pir .= \$S0 \n";
    }

    # catch anything at the end
    $pir .= $code ? inline("$code\\n") : inline("\\n");

    return $pir;
}

sub inlined_body {
    my ( $file, @args ) = @_;

    my %args = map { $_->{name} => $_ } @args;
    my $code = emit('.local pmc temp');

    # locals inside this code
    my %locals;
    for my $orig (@$file) {
        my $line = $orig;

        # rename labels
        if ( $line =~ /^\s* (\w+) \s* : \s*$/mx ) {
            $code .= emit( $1 . "_%0:", 'loop_num' );
            next;
        }

        # rename locals (during declaration)
        if ( $line =~ /^\s* \.local \s+ (\w+) \s+ (.+)$/mx ) {
            my @vars = split /\s*,\s*/, $2;

            $locals{$_} = 1 for @vars;
            $code .= inline("  .local $1 ");
            $code .= emit( join( ',', map { $_ . "_%0" } @vars ), 'loop_num' );

            next;
        }

        # comments
        $line =~ s/#.*$//m;

        # gotos and exceptions
        $line =~ s/(goto|push_eh) \s+ (\w+)/$1 $2_%0/gx;

        # locals
        if (%locals) {
            my $locals = join '|', keys %locals;
            $line =~ s/\b($locals)\b(?!['"])/$1_%0/g;    #'
        }

        # args
        while ( $line =~ s/\$(?!(?:P|S|N|I)\d+|R\b)(\w+)/a_${1}_%0/ ) {
            my $name = $1;
            my $arg  = $args{$name};

            if ( $arg->{type}[-1] eq 'script' or $arg->{type}[-1] eq 'expr' ) {
                $code .= emit( "temp = a_${name}_%0()", 'loop_num' );

                # if that's all there is, remove it
                $line        =~ s/^\s*a_${name}_%0\s*$//m
                    or $line =~ s/a_${name}_%0/temp/;
            }
        }

        # $R
        $line =~ s/\$R\b/\$P%1/g;

        $code .= emit( $line, 'loop_num', 'register' );
    }

    $code .= "  .return(register, pir) \n";

    return $code;
}

sub body {
    my ( $file, @args ) = @_;

    my %args = map { $_->{name} => $_ } @args;

    # the number for the loops
    my $code = "  .local pmc R \n" . "  .local pmc temp \n";

    for my $orig (@$file) {
        my $line = $orig;

        # args
        while ( $line =~ s/\$(?!(?:P|S|N|I)\d+|R\b)(\w+)/a_$1/ ) {
            my $name = $1;
            my $arg  = $args{$name};

            if ( $arg->{type}[-1] eq 'script' or $arg->{type}[-1] eq 'expr' ) {
                $code .= "temp = a_$name() \n";

                # if that's all there is, remove it
                $line =~ s/^\s*a_$name\s*$//m or $line =~ s/a_$name/temp/;
            }
        }

        # $R
        $line =~ s/\$R\b/R/g;

        $code .= $line;
    }

    $code .= "  .return(R) \n";

    return $code;
}

sub inlined_badargs {
    my ( $cmd, @args ) = @_;

    my $usage = create_usage(@args);
    my $code  =
          "bad_args: \n"
        . "  .return(register, \"  tcl_error 'wrong # args: should be "
        . "\\\"$cmd$usage\\\"' \\n\") \n";

    return $code;
}

sub badargs {
    my ( $cmd, @args ) = @_;

    my $usage = create_usage(@args);
    my $code  = "bad_args: \n" . "  tcl_error 'wrong # args: should be \"$cmd$usage\"'\n";

    return $code;
}

sub create_usage {
    my @args = @_;

    my @results;

    foreach my $arg (@args) {
        my $usage = $arg->{name};

        if ( $arg->{repeating} ) {
            if ( $arg->{optional} ) {
                $usage = "?$usage $usage ...?";
            }
            else {
                $usage = "$usage ?$usage ...?";
            }
        }
        else {
            $usage = "?$usage?" if $arg->{optional};
        }

        push @results, $usage;
    }

    my $result = join ' ', @results;
    $result = " $result" if @results;
    return $result;
}

sub footer {
    return ".end\n";
}

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

        $is_repeating = $arg->{repeating};
    }

    $max = undef if $is_repeating;

    return $min, $max;
}

=head1 TODO

Doesn't support subcommands. 

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

#! /usr/bin/perl -w
#
# pmc2c2.pl
#
# Generate a C source and a header
# file from the methods defined in a .pmc file.
#

=head1 NAME

pmc2c2.pl - V2 PMC compiler

=head1 SYNOPSIS

=over 4

=item perl classes/pmc2c2.pl --dump classes/foo.pmc ...

Create F<classes/foo.dump>

=item perl pmc2c2.pl --vtable

Create F<vtable.dump>

=item perl classes/pmc2c2.pl --tree classes/*.pmc

Print class tree of given pmcs.

=item perl classes/pmc2c2.pl -c classes/foo.pmc ...

Create classes/foo.c and pmc_foo.h from classes/foo.dump

=back

=head1 OPTIONS

=over 4

=item --debug

Increase debug level

=item --verbose

Increase verbose level

=item --no-lines

Omit source line info

=item --no-body

Emit an empty body in the dump. This may be useful for debugging.

=back

=head1 INTERNALS

Please run e.g.

  pmc2c2.pl --c --deb --deb sarray.pmc | less

to see internal data structures.

=head1 AUTHOR

Leopold Toetsch.

Many thanks to the author of pmc2c.pl, many useful code pieces got reused.

=cut

use FindBin;
use lib 'lib';
use lib "$FindBin::Bin/..";
use lib "$FindBin::Bin/../lib";
use Parrot::Vtable;
use Parrot::Pmc2c;
use strict;
use Data::Dumper;
use Getopt::Long;
my %opt;

main();

sub dump_default {
    my $file = "$FindBin::Bin/../vtable.tbl";
    my $default = parse_vtable($file);
    my $dump;
    ($dump = $file) =~ s/\.\w+$/\.dump/;
    print "Writing $dump\n" if $opt{verbose};
    open(VTD, ">$dump") or die "Can't write $dump";
    my %vt;
    $vt{flags} = {};
    $vt{pre} = '';
    $vt{post} = '';
    my %meth_hash;
    my $i = 0;
    foreach my $entry (@$default) {
        $meth_hash{$entry->[1]} = $i++;
        push ( @{$vt{methods}},
        {
            parameters => $entry->[2],
            meth =>       $entry->[1],
            type =>       $entry->[0],
            section =>    $entry->[3]
        });
    }
    $vt{'has_method'} = \%meth_hash;
    my $Dumper = Data::Dumper->new([\%vt], [qw(class)]);
    $Dumper->Indent(3);
    print VTD $Dumper->Dump();
    close VTD;
}

sub count_newlines {
    return scalar(() = $_[0] =~ /\n/g);
}

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

sub parse_flags {
    my $c = shift;
    $$c =~ s/^(.*?^\s*)pmclass ([\w]*)//ms;
    my ($pre, $classname) = ($1, $2);
    my %has_value = ( does => 1, extends => 1 );

    my %flags;
    # look through the pmc declaration header for flags such as noinit
    while ($$c =~ s/^(?:\s*)(\w+)//s) {
	if ($has_value{$1}) {
	    my $what = $1;
	    if (s/^(?:\s+)(\w+)//s) {
		$flags{$what}{$1} = 1;
	    }
	    else {
		die "Parser error: no value for '$what'";
	    }
	}
	else {
	    $flags{$1} = 1;
	}
    }
    # setup some defaults
    if ($classname eq 'OrderedHash') {
        #$flags{extends}{PerlHash} = 1;
    }
    if ($classname ne 'default') {
	$flags{extends}{default} = 1 unless $flags{extends};
	$flags{does}{scalar} = 1 unless $flags{does};
    }
    ($pre, $classname, \%flags);
}

sub parse_pmc {

  local $_ = shift;
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

  my ($pre, $classname, $flags) = parse_flags(\$_);
  my $lineno = 1;
  $lineno += count_newlines($pre);
  my ($classblock, $post, $lines) = extract_balanced($_);
  $classblock = substr($classblock, 1,-1); # trim out the { }

  my (@methods, %meth_hash);

  while ($classblock =~ s/($signature_re)//) {
     $lineno += count_newlines($1);
     my ($type, $methodname, $parameters) = ($2,$3,$4);
     my ($methodblock, $rema, $lines) = extract_balanced($classblock);
     $lineno += $lines;
     $methodblock = "" if $opt{nobody};
     # name => method idx mapping
     $meth_hash{$methodname} = scalar @methods;
     push @methods,
	{ 'meth' => $methodname,
	  'body' => $methodblock,
	  'line' => $lineno,
	  'type' => $type,
	  'parameters' => $parameters
      };
     $classblock = $rema;
     $lineno += count_newlines($methodblock);
  }

  return ( $classname, {
	       'pre'   => $pre,
	       'flags' => $flags,
	       'methods' => \@methods,
	       'post' => $post,
	       'class' => $classname,
               'has_method' => \%meth_hash
	   }
       );
}

# make a linear list of class->{parents} array
sub gen_parent_list {
    my ($this, $all) = @_;
    my @todo = ($this);
    my $class = $all->{$this};
    while (@todo) {
        my $n = shift @todo;
        my $sub = $all->{$n};
        next if $n eq 'default';
        foreach my $parent (keys %{$sub->{flags}{extends}}) {
            next if exists $class->{has_parent}{$parent};
            if (!$all->{$parent}) {
                my $pf = lc $parent;
                $all->{$parent} = read_dump("classes/$pf.pmc");
            }
            $class->{has_parent}{$parent} = { %{$all->{$parent}{has_method} }};
            push(@todo, $parent);
            push(@{ $class->{parents} }, $parent);
        }
    }
}


sub dump_1_pmc {
    my $file = shift;
    $file =~ s/\.\w+$/.pmc/;
    print "Reading $file\n" if $opt{verbose};
    open F, "<$file" or die "Can't read '$file'";
    local $/;
    my $contents = <F>;
    close F;
    return parse_pmc($contents);
}

sub gen_super_meths {
    my ($self, $vt) = @_;
    # look through all meths in class and locate the nearest parent
    foreach my $entry (@{ $vt->{methods} } ) {
        my $meth = $entry->{meth};
        next if exists $self->{super}{$meth};
        foreach my $pname (@{ $self->{parents} } ) {
            if (exists $self->{has_parent}{$pname}{$meth} ) {
                $self->{super}{$meth} = $pname;
                last;
            }
        }
        unless (exists $self->{super}{$meth}) {
            $self->{super}{$meth} = 'default';
        }
    }
}

sub add_defaulted {
    my ($class, $vt) = @_;
    my $i = @{ $class->{methods} };
    foreach my $e ( @{$vt->{methods}} ) {
        my $meth = $e->{meth};
        $class->{super}{$meth} = 'default';
    }
}

sub dump_pmc {
    my @files = @_;
    my %all;
    # help these dumb 'shells' that are no shells
    @files = glob $files[0] if $files[0] eq '*.pmc';
    foreach my $file (@files) {
	my ($class, $res) = dump_1_pmc($file);
        $res->{file} = $file;
        $all{$class} = $res;
    }

    my $vt = read_dump("vtable.pmc");
    if (!$all{default}) {
        $all{default} = read_dump("classes/default.pmc");
    }
    add_defaulted($all{default}, $vt);

    foreach my $name (keys %all) {
        my $dump;
        my $file = $all{$name}->{file};
        ($dump = $file) =~ s/\.\w+$/\.dump/;
        gen_parent_list($name, \%all);
        my $class = $all{$name};
        gen_super_meths($class, $vt);
        my $Dumper = Data::Dumper->new([$class], [qw(class)]);
        $Dumper->Indent(1);
        print "Writing $dump\n" if $opt{verbose};
        open PMD, ">$dump" or die "Can't write '$dump";
        print PMD $Dumper->Dump;
        close PMD;
    }
}

sub read_dump {
    my $file = shift;
    my $dump;
    ($dump = $file) =~ s/\.\w+$/.dump/;
    unless ( -e $dump) {
        if ($dump =~ m!^classes/!) {
            $dump =~ s!^classes/!!;
        }
        elsif ($dump =~ m!^vtable!) {
            $dump = "../vtable.dump";
        }
        unless ( -e $dump) {
            $dump = "../classes/$dump";
        }
    }
    print "Reading $dump\n" if $opt{verbose};

    open D, "<$dump" or die "Can't read '$dump'";
    local $/;
    my $contents = <D>;
    close D;
    my $class;
    # $class => { ... };
    eval $contents;
    die $@ if $@;
    $class;
}

sub print_tree {
    my ($depth, @files) = @_;
    foreach my $file (@files) {
	my $class = read_dump($file);
	my $name = $class->{class};
	print "    " x $depth, $name, "\n";
	foreach my $parent (keys %{$class->{flags}{extends}}) {
	    my $pmc = "classes/" . lc($parent) . ".pmc";
	    print_tree($depth + 1, $pmc);
	}
    }
}

sub gen_c {
    my (@files) = @_;
    foreach my $file (@files) {
	my $class = read_dump($file);
        # finally append vtable.dump
        $class->{vtable} = read_dump("vtable.pmc");
	my $generator = Parrot::Pmc2c->new($class, \%opt);
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

sub main {
    my ($default, $dump, $gen_c, $result, $tree, $debug, $verbose, $nobody, $nolines);
    $result = GetOptions(
	"vtable"        => \$default,
	"dump"          => \$dump,
	"c|gen-c"       => \$gen_c,
	"tree"          => \$tree,
	"no-body"       => \$nobody,
	"no-lines"      => \$nolines,
	"debug+"        => \$debug,
	"verbose+"      => \$verbose,
    );
    $opt{debug} = $debug || 0;
    $opt{verbose} = $verbose || 0;
    $opt{nobody} = $nobody || 0;
    $opt{nolines} = $nolines || 0;

    $default and do {
	dump_default();
	exit;
    };
    $dump and do {
	dump_pmc(@ARGV);
	exit;
    };
    $tree and do {
	print_tree(0, @ARGV);
	exit;
    };
    $gen_c and do {
	gen_c(@ARGV);
	exit;
    };
}

# vim: expandtab shiftwidth=4:

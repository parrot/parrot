package P6CTest;

use strict;
use Getopt::Long;
use FindBin;
use lib "$FindBin::Bin/..";   # To get P6C modules
use Test::Builder;
require Test::More;

require Exporter;
use vars qw(@ISA @EXPORT);
@ISA = qw(Exporter);
@EXPORT = qw(check_parse);

my $parser;
my $parser_grammar;
my $test = new Test::Builder();

##################################
sub import {
    my($class) = shift;

    my $caller_pkg = caller;
    $test->exported_to($caller_pkg);
    $test->plan(@_);

    # Load the required modules at runtime.
    require P6C::Nodes; P6C::Nodes->import();
    require P6C::Tree; P6C::Tree->import(); 
    require P6C::Parser; P6C::Parser->import();

    # Build subs to minimize typing ... I'm lazy :-)
    foreach (keys %{*P6C::{HASH}}) {
        next if /^_/;
        next if !/(.*)::$/;
	my $tree_type = $1;
	eval "sub $tree_type {new P6C::$tree_type(\@_)}";
	push(@EXPORT, $tree_type);
    }

    P6CTest->export_to_level(1);

    # Handle command line args
    my %opt;
    GetOptions(\%opt,qw(grammar:s help)) and !$opt{help}
        or die "Usage: $0 [options] [--force] [--grammar NAME] [--help]";

    if ($opt{force}) {
	$parser_grammar = "P6C::Parser";
    } else {
	$parser_grammar = $opt{grammar} || "Perl6grammar";
    }
    eval "require $parser_grammar";
}

##################################
sub check_parse {
    my($args) = @_;
    my $name = $args->{name} || "Parse Test";
    my $pgm = $args->{pgm};
    my $pgm_data = $args->{pgm_data};
    my $exp = $args->{exp};

    if (!$parser) {
        # XXX - figure out why we can't do this work in import() above
        $parser = new $parser_grammar();
        $test->BAILOUT("Could not create parser $parser_grammar") if (!$parser);
    }

    # Get the programs to parse.
    my $pgms;
    my @names;
    if ($pgm) {
        $pgms = ref($pgm) eq "ARRAY" ? $pgm : [$pgm];
    } else {
        die "no pgm or pgm_data defined" if (!$pgm_data);

        if (ref(\$pgm_data) eq "GLOB") {
            local $/ = undef;
            $pgm_data = <$pgm_data>;
        }

        $pgms = [];
        _split_data($pgm_data, $pgms, \@names);
    }
    if (@$pgms == 1) {
        @names = ($name);
    } else {
        @names = map {"$name (".($names[$_-1] or "pgm $_").")"} (1..@$pgms);
    }

    # And then parse the programs
    $exp = _clean($exp) if ($exp);
    my $i = 0;
    foreach (@$pgms) {
        my $results = $parser->prog($_);
        my $tname = $names[$i];

	if ($results) {
            $results = $results->tree();
            if ($exp) {
                Test::More::is_deeply(_clean($results), $exp, $tname);
            } else {
	        $test->ok(1, $tname);
            }
	} else {
	    $test->ok(0, $tname);
            $test->diag("could not parse program");
	    print STDERR <<END;
######################################################################
$_
######################################################################
END
	}
        $i++;
    }
}

##################################
sub _split_data {
    my($data, $pgms, $names) = @_;

    $data = "$data\n";        # Add an extra \n for \Z below (this gets stripped)

    while ($data =~ m{
            \G
            \s*               # Ignore leading space

            (                 # Program header
               ^======        # Header starts with ====== at beginning of line.
               .*
            )
            \n

            (                 # Program body
               (.|\n)*?
               (?=^======|\Z) # Body ends with start of next header or end of data
            )

    }xmg) {
        my($header, $body) = ($1, $2);

        $header =~ /^[=\s]*(.*?)[=\s]*$/;   # Find test name in line
        my $name = $1;

        push @$pgms, $body;
        push @$names, $name;
    }
}

##################################
my %BOOLS = map {$_ => 1} qw(
    P6C::variable::global
    P6C::variable::implicit
    P6C::variable::topical
    P6C::incr::post
);
    
sub _clean {
    my($node) = @_;

    my $t = ref($node);
    if ($t) {
        if ($t eq "ARRAY") {
            for(my $i=0; $i<@$node; $i++) {
                $node->[$i] = _clean($node->[$i]);
            }
        } else {
            while (my($k,$v) = each %$node) {
                if ($BOOLS{$k} && !ref($v)) {
                    $v = $v ? 1 : undef;
                } else {
                    $v = _clean($v);
                }
                $node->{$k} = $v;
            }
        }
    }

    $node;
}

1;

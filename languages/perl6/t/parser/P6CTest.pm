package P6CTest;

use strict;
use Getopt::Long;
use FindBin;
use lib "$FindBin::Bin/../..";   # To get P6C modules
use Test::Builder;
use IO::File;
require Test::More;

use Data::Dumper;
$Data::Dumper::Terse = 1;
$Data::Dumper::Indent = 1;

require Exporter;
use vars qw(@ISA @EXPORT);
@ISA = qw(Exporter);
@EXPORT = qw(plan check_parse is_deeply contents log_it time_it);

use vars qw($parser_grammar);
$parser_grammar = undef;

my $do_dump;
my $parser;
my $verbose;
my $timeit;
my $test = new Test::Builder();

sub time_it;

##################################
sub import {
    my($class, %plans) = @_;

    # Handle command line args
    my %opt;
    GetOptions(\%opt,qw(force grammar:s help timeit dump verbose)) and !$opt{help}
        or die "Usage: $0 [--force] [--grammar NAME] [--timeit]".
	                 "[--dump] [--verbose] [--help]";

    if ($opt{force}) {
	$parser_grammar = "P6C::Parser";
    } else {
	$parser_grammar = $opt{grammar} || "Perl6grammar";
    }
    $do_dump = $opt{dump};
    $verbose = $opt{verbose};
    $timeit = $opt{timeit};

    # Load the required modules at runtime.
    time_it "Loading P6C::Nodes", sub {
        eval "use P6C::Nodes";
    };
    time_it "Loading P6C::Tree", sub {
        eval "use P6C::Tree";
    };
    time_it "Loading P6C::Parser", sub {
        eval "use P6C::Parser";
    };

    # Build subs to minimize typing ... I'm lazy :-)
    foreach (keys %{*P6C::{HASH}}) {
        next if /^_/;
        next if !/(.*)::$/;
	my $tree_type = $1;
	eval "sub $tree_type {new P6C::$tree_type(\@_)}";
	push(@EXPORT, $tree_type);
    }
    P6CTest->export_to_level(1);

    if (!$do_dump) {
        time_it "Loading $parser_grammar", sub {
            eval "use $parser_grammar";
	    die "Couldn't load $parser_grammar: $@" if ($@);
	};

        my $caller_pkg = caller;
        $test->exported_to($caller_pkg);
        plan(%plans) if (%plans);
    }
}

##################################
sub plan {
    $test->plan(@_);
}

##################################
sub log_it {
    return if (!$verbose);

    my $s = select(STDOUT);
    {
        local $| = 0;
        print @_;
    }
    select($s);
}

##################################
sub check_parse {
    my($args) = @_;
    my $name = $args->{name} || "Parse Test";
    my $pgm = $args->{pgm};
    my $pgm_files = $args->{pgm_files};
    my $exp = $args->{exp};
    my $exp_files = $args->{exp_files};
    my $exp_errs = $args->{exp_errs};
    my $skip = $args->{skip};

    die $skip if $skip;

    $pgm = contents($pgm);
    $exp = contents($exp, 1);

    # XXX - figure out why we can't do this work in import() above
    if (!$parser && !$do_dump) {
        time_it "Creating $parser_grammar", sub {
            $parser = new $parser_grammar();
	};
        $test->BAILOUT("Could not create parser $parser_grammar") if (!$parser);
    }

    # Clean up the expected data, if there is any.
    $exp = _clean($exp) if ($exp);

    # Now parse the programs and verify their output
    if ($pgm) {
        my $pgms = ref($pgm) eq "ARRAY" ? $pgm : [$pgm];
	my $i = 1;
	foreach my $pgm (@$pgms) {
            my $tname = (@$pgms == 1) ? $name : "$name (pgm $i)";
	    _parse_and_check($pgm, $tname, $exp, $exp_errs);
	    $i++;
	}
    } else {
	die "Neither pgm nor pgm_files defined" if (!@$pgm_files);

	foreach my $pgm_file (@$pgm_files) {
	    my $pgm = contents($pgm_file);

            my $exp_file = $pgm_file;
            $exp_file =~ s/\..*?$/.exp/i;
	    $exp_file = undef if ($exp_file eq $pgm_file);
	    my $exp = contents($exp_file, 1) if ($exp_file && -f $exp_file);
            $exp = _clean($exp) if ($exp);

	    my $got_file;
	    if ($exp) {
	        $got_file = $exp_file;
                $got_file =~ s/\..*?$/.got/i;
	    }

	    _parse_and_check($pgm, "$name ($pgm_file)", $exp, $exp_errs, $got_file);
	}
    }
}

##################################
sub _parse_and_check {
    my($pgm, $tname, $exp, $exp_errs, $got_file) = @_;

    if ($do_dump) {
        my $contents = _dump($tname, $pgm);
	$contents =~ s/\n/\n\t/g;
        print STDOUT "{\n\t$contents\n}\n";

    } else {
	my $results;
	my @errs;
	my $err_handler = sub {
	    my($msg, $line) = @_;
	    push(@errs, [$msg, $line]);
	};
	my $old_err_handler = $parser->set_error_handler($err_handler);

        time_it "Parsing '$tname'", sub {
            $results = $parser->prog($pgm);
	};

	$parser->set_error_handler($old_err_handler);

	if ($results) {
            time_it "Building tree from parse of '$tname'", sub {
                $results = $results->tree();
	    };

	    if ($got_file) {
                my $f = new IO::File(">$got_file") or
		        die "Can't open file '$got_file' for writing: $!";
		print $f Dumper($results);
		$f->close();
	    }

            if ($exp) {
                Test::More::is_deeply(_clean($results), $exp, $tname);
            } else {
	        $test->ok(1, $tname);
            }
	} else {
	    log_it "Comparing trees";
	    if ($exp_errs) {
                Test::More::is_deeply(\@errs, $exp_errs, $tname);
	    } else {
	        $test->ok(0, $tname);
                $test->diag("could not parse program");
                print STDERR _dump($tname, $pgm);
	    }
	}
    }
}

##################################
sub contents {
    my($contents, $eval_it) = @_;

    return $contents if (!defined $contents);

    local $/ = undef;
    my $file_contents = $contents;
    my $what;

    if (ref(\$contents) eq "GLOB") {
        $file_contents = <$contents>;
	$what = "<file handle>";
    } elsif ($contents !~ /\n/ && -f $contents) {
        log_it "# Reading $contents\n";
        my $f = new IO::File("<$contents") || die "Can't open file '$contents': $!";
        $file_contents = <$f>;
	$f->close();
	$what = "file '$contents'";
    }

    if (defined $what && $eval_it) {
        $file_contents = eval $file_contents;
	die "Error eval'ing $what: $@" if ($@);
    }

    return $file_contents;
}

##################################
sub _dump {
    my($tname, $code) = @_;
    my $sep = "#" x 20;
    my $header = "$sep $tname $sep";
    my $trailer = "#" x length($header);
    return "$header\n$code\n$trailer\n";
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

##########################################
sub time_it {
    my($what, $code) = @_;

    log_it "# $what ...";
    if ($timeit) {
        require Time::HiRes;


        my $t0 = [Time::HiRes::gettimeofday()];
        &$code();
        my $t1 = Time::HiRes::tv_interval($t0);

        my $msecs = int($t1*1000.0+0.5);
        my $secs = int($msecs / 1000);
        $msecs = $msecs % 1000;

        log_it sprintf(" took %d.%03d secs\n", $secs, $msecs);
    } else {
        &$code();
	print " ..done\n";
    }
}

1;

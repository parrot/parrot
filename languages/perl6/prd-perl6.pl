
use lib 'P6C/../../regex/lib';
use lib '../../lib';

use Getopt::Long;
use strict;
use P6C::Tree;
use P6C::Parser;
use P6C::IMCC ':external';

######################################################################
# Interaction
my %o;
(GetOptions(\%o,qw(imc silent
		   hitem usere trace score raw
		   batch:s rule=s grammar=s force help))
 && !$o{help})
    || die <<END;
Usage: $0 [options]
    Output options:
	--silent	don't do any output (not too useful)
	--imc		emit IMC code
	--raw		raw parse tree

    Parse::RecDescent control:
	--trace		set \$::RD_TRACE
	--hitem		keep track of \%item hash
	--trace		insert tracing code
	--usere

    Misc:
	--batch		read batch on STDIN, write to STDOUT
	--batch NAME read batch from NAME, write to STDOUT
	--rule NAME	start with rule NAME (default = 'prog')
	--grammar NAME	use precompiled grammar NAME (default = Perl6grammar)
	--force		Rebuild grammar even if it exists.
	--help		yep.

    In interactive mode, output is terminated by a blank line.
END

$::RD_TRACE = $o{trace};
$::RD_NO_HITEM = !$o{hitem};
$::RD_NO_TRACE = !$o{trace};
$::USERE = $o{usere};
$::rule = $o{rule} || 'prog';
$o{grammar} ||= 'Perl6grammar';

if ($o{imc}) {
    eval 'use P6C::IMCC qw(:external)';
    die $@ if $@;
} else {
    eval <<'END';
    use Data::Dumper;
    $Data::Dumper::Terse = 1;
    $Data::Dumper::Indent = 1;
END
}

my $parser;

if (!$o{force} && eval("require $o{grammar}")) {
    $parser = eval "new $o{grammar}" or die "$o{grammar}: $@";
} else {
    warn $@ if $@;
    print STDERR "Constructing parser for $o{grammar}...";
    if ($o{grammar}) {
	P6C::Parser->Precompile($o{grammar});
	eval "require $o{grammar}" or die $@;
	$parser = $o{grammar}->new;
    } else {
	$parser = P6C::Parser->new();
    }
    print STDERR "done\n";
}

sub output_tree {
    my $x = shift;
    if ($o{raw}) {
	print Dumper($x);
	return;
    }
    $x = $x->tree;
    if ($o{imc}) {
	P6C::IMCC::add_function('main');
	P6C::IMCC::set_function('main');
        P6C::IMCC::set_function_params(P6C::closure::default_signature());
	compile($x);
	emit();
    } else {
	print Dumper($x);
    }
}

P6C::IMCC::init();

my $in = '';
if (defined $o{batch}) {
    local $/ = undef;
    if($o{batch}) {
      open IN, "$o{batch}";
      $in = <IN>;
    } else {
      $in = <STDIN>;
    }
    my $result = $parser->$::rule($in);
    exit if $o{silent};
    output_tree($result);
    exit;
}

# Delay loading Term::ReadLine if we don't need it.
eval <<'END';
use Term::ReadLine;

my $term = new Term::ReadLine $0 or die $!;
my $prompt = '> ';

while (defined(my $l = $term->readline($prompt))) {
    if ($in =~ /^:(.*)/) {
	print eval $1, "\n";
	$in = '';
	next;
    }
    unless ($l =~ /^$/) {
	$in .= "$l\n";
	$prompt = '? ';
	next;
    }
    print "as $::rule:\n";
    my $result = $parser->$::rule($in);
    print STDERR "done\n";
    if ($result) {
	output_tree($result);
    } else {
	print "parse error\n";
    }
    print "\n";
    $in = '';
    $prompt = '> ';
}
END
die $@ if $@;

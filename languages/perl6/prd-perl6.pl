use Getopt::Long;
use strict;
use P6C::Tree;
use P6C::Parser;

######################################################################
# Interaction
my %o;
(GetOptions(\%o,qw(imc silent
		   trace no-hitem
		   batch rule=s grammar=s force help))
 && !$o{help})
    || die <<END;
Usage: $0 [options]
    Output options:
	--silent	don't do any output (not too useful)
	--imc		emit IMC code

    Parse::RecDescent control:
	--trace		set \$::RD_TRACE
	--no-hitem	don't keep track of \%item hash

    Misc:
	--batch		read batch on STDIN, write to STDOUT
	--rule NAME	start with rule NAME (default = 'prog')
	--grammar NAME	use precompiled grammar NAME (default = Perl6grammar)
	--force		Rebuild grammar even if it exists.
	--help		yep.

    In interactive mode, output is terminated by a blank line.
END

$::RD_TRACE = $o{trace};
$::RD_NO_HITEM = $o{"no-hitem"};
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
    my $x = shift->tree;
    if ($o{imc}) {
	use P6C::IMCC ':external';
	init();
	if (!$o{batch}) {
	    P6C::IMCC::add_function('main');
	    P6C::IMCC::set_function('main');
	}
	compile($x);
	emit();
    } else {
	print Dumper($x);
    }
}

my $in = '';
if ($o{batch}) {
    local $/ = undef;
    $in = <STDIN>;
    my $result = $parser->$::rule($in);
    print STDERR "done\n";
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

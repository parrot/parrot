package P6C::IMCC::guard;
use SelfLoader;
use P6C::IMCC ':all';
use P6C::IMCC::prefix 'common_while';
require Exporter;
use vars qw(@ISA @EXPORT_OK);
@ISA = qw(Exporter);
@EXPORT_OK = qw(guard_if guard_while);

sub guard_if ;
sub guard_while ;

1;

__DATA__

sub guard_if {
    my $x = shift;
    my $test = $x->test->val;
    my $end = genlabel 'guard_if';
    my $ret;
    $ret = newtmp 'PerlUndef' unless $x->{ctx}->type eq 'void';
    if ($x->name eq 'unless') {
	code(<<END);
	if $test goto $end
END
    } else {
	my $foo = genlabel;
	code(<<END);
	unless $test goto $end
END
    }
    if (defined $ret) {
	$ret = $x->expr->val;
    } else {
	$x->expr->val;
    }
    code(<<END);
$end:
END
    return $ret;
}

sub guard_while {
    my $x = shift;
    return common_while($x->name, sub { $x->test->val }, sub { $x->expr->val },
			$x->{ctx});
}


package P6C::IMCC::guard;
use SelfLoader;
use P6C::IMCC ':all';
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
    if ($x->name eq 'unless') {
	code(<<END);
	if $test goto $end
END
    } else {
	my $foo = genlabel;
	code(<<END);
	if $test goto $foo
	goto $end
$foo:
END
    }
    $x->expr->val;
    code(<<END);
$end:
END
    return undef;
}

sub guard_while {
    my $x = shift;
    use P6C::IMCC::prefix 'common_while';
    common_while($x->name, sub { $x->test->val }, sub { $x->expr->val });
}


use strict;

package A;
sub fib {
    my $self = shift;
    my $n = shift;
    return $n if ($n < 2);
    return $self->fibA($n-1) + $self->fibB($n-2);
}
sub fibA {
    my $self = shift;
    my $n = shift;
    return $n if ($n < 2);
    return $self->fib($n-1) + $self->fibB($n-2);
}
package B;
@B::ISA=qw(A);
sub new { bless {}, $_[0] }
sub fibB {
    my $self = shift;
    my $n = shift;
    return $n if ($n < 2);
    return $self->fib($n-1) + $self->fibA($n-2);
}

package main;

my $N = shift || 28;

my $b = B->new();

print "fib($N) = ", $b->fib($N), "\n";


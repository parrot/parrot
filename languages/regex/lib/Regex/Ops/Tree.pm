package Regex::Ops::Tree;
use base 'Exporter';
use strict;

use vars qw(@RegexOps @EXPORT);
@EXPORT = qw(rop);

my %TreeOps =
  (
    alternate => [ [ '' ], "Match R or S at the same point?" ],
    atend => [ [ '' ], "At the end of the input?" ],
    classmatch => [ [ '_onematch' ], "Match a character class" ],
    group => [ [ '_onearg' ], "Capture a group" ],
    match => [ [ '_onematch' ], "Match a single codepoint" ],
    multi_match => [ [ '' ], "Match m..n repetitions of R" ],
    scan => [ [ '_onearg' ], "Scan through input until R matches" ],
  );

# Set up the inheritance hierarchy for all of the various tree ops
while (my ($name, $info) = each %TreeOps) {
    my ($isa, ) = @$info;
    my $stem = "Regex::Ops::Tree::" . $name . "::ISA";
    {
        no strict 'refs';
        my @isa = map { length($_) ? "Regex::Ops::Tree::$_" : "Regex::Ops::Tree" } @$isa;
        @{ *{$stem}{ARRAY} } = @isa;
    };
}

# Construct a new op
sub op {
    my ($class, $name, $args, %opts) = @_;

    $class = ref($class) if ref $class;
    $class = "Regex::Ops::Tree::$name";
    my $self = bless { name => $name,
                       args => $args || [],
                       %opts }, $class;

    return $self->init();
}

# Default initialization, to be overridden in subclasses.
sub init { return shift(); };

# Exportable convenience function
sub rop {
    return __PACKAGE__->op(@_);
}

use vars qw(%MARKERS);
sub mark {
    my $name = shift || '';
    my $number = ++$MARKERS{$name};
    $number = '' if ($number == 1) && ($name ne '');
    return bless([ 'label', "\@$name$number" ], 'asm_op');
}

############################################################################
# OPTIMIZATION INFORMATION
#
# Everything below here is only for computing information that may be
# useful in optimizing generated regular expressions. It is not needed
# for basic compilation.
############################################################################

sub order_startset {
    my $start = shift;

    # Must maintain invariant that '' comes first, if it exists.
    my @null;
    push(@null, '') if exists $start->{''};
    delete $start->{''};
    return (@null, keys %$start);
}

# Defaults
sub minlen { die }
sub maxlen { die }
sub startset { die }
sub hasback { 0 }
sub dfa_safe { 0 }

# Superclass for ops like scan(R) that contain a single subexpression.
# By default, all calls are propagated to the subexpression.
package Regex::Ops::Tree::_onearg;
use vars qw(@ISA); @ISA = qw(Regex::Ops::Tree);
sub minlen { my ($op) = @_; $op->{args}->[0]->minlen() }
sub maxlen { my ($op) = @_; $op->{args}->[0]->maxlen() }
sub startset { my ($op) = @_; $op->{args}->[0]->startset() }
sub hasback { my ($op) = @_; $op->{args}->[0]->hasback() }
sub dfa_safe { my ($op) = @_; $op->{args}->[0]->dfa_safe() }

# Superclass for ops that match a single input atom (eg a character or
# character class.)
package Regex::Ops::Tree::_onematch;
use vars qw(@ISA); @ISA = qw(Regex::Ops::Tree);

sub minlen { 1 }
sub maxlen { 1 }
sub dfa_safe { 1 }

# R*, R+, R?, nongreedy variants of those
package Regex::Ops::Tree::multi_match;
use vars qw(@ISA); @ISA = qw(Regex::Ops::Tree);

sub minlen {
    my $op = shift;
    return 0 if $op->{args}->[0] <= 0;
    return $op->{args}->[0] * $op->{args}->[3]->minlen();
}

sub maxlen {
    my $op = shift;
    my $sublen = $op->{args}->[3]->maxlen();
    if ($op->{args}->[1] == -1) {
        return $sublen == 0 ? 0 : -1;
    } else {
        return $op->{args}->[1] * $sublen;
    }
}

sub startset {
    my $op = shift;
    my @sub = $op->{args}->[3]->startset();
    if (@sub && $sub[0] ne '') {
        if ($op->minlen() == 0) {
            return ('', @sub);
        } else {
            return @sub;
        }
    } else {
        return @sub;
    }
}

# Sequences of regexes like RS
package Regex::Ops::Tree::seq;
use vars qw(@ISA); @ISA = qw(Regex::Ops::Tree);

sub init {
    my ($self) = @_;

    if (@{ $self->{args} } == 0) {
        delete $self->{name};
        delete $self->{args};
        return $self->op('nop', [], %$self);
    } elsif (@{ $self->{args} } == 1 && 2 == keys %$self) {
        return $self->{args}->[0];
    } else {
        return $self;
    }
}

sub minlen {
    my $op = shift;
    my $minlen = 0;
    $minlen += $_->minlen() foreach @{ $op->{args} };
    return $minlen;
}

sub maxlen {
    my $op = shift;
    my $maxlen = 0;
    $maxlen += $_->maxlen() foreach @{ $op->{args} };
    return $maxlen;
}

sub startset {
    my $op = shift;
    my %start;
    foreach (@{ $op->{args} }) {
        my @next = $_->startset();
        @start{@next} = ();
        # Stop unless NULLABLE.
        last unless (@next && $next[0] eq '');
    }

    return Regex::Ops::Tree::order_startset(\%start);
}

sub dfa_safe {
    my $op = shift;
    foreach (@{ $op->{args} }) {
        return 0 unless $_->dfa_safe();
    }
    return 1;
}

# R|S
package Regex::Ops::Tree::alternate;
use vars qw(@ISA); @ISA = qw(Regex::Ops::Tree);

sub minlen {
    my $op = shift;
    my $min;
    foreach (@{ $op->{args} }) {
        my $len = $_->minlen();
        $min = $len if (! defined $min) || ($min > $len);
    }
    return $min || 0;
}

sub maxlen {
    my $op = shift;
    my $max = 0;
    foreach (@{ $op->{args} }) {
        my $len = $_->maxlen();
        $max = $len if $max < $len;
    }
    return $max || 0;
}

sub startset {
    my $op = shift;
    my %start;
    foreach (@{ $op->{args} }) {
        @start{$_->startset()} = ();
    }
    return Regex::Ops::Tree::order_startset(\%start);
}

# Returns true if at most one subexpression can ever hold at a given
# point in the input string. (Return value is conservative: this will
# return false if it is not sure.)
sub disjoint {
    my $op = shift;

    # For now, return true iff all subexpressions' startsets contain
    # only integers (no character classes or weirder things), and all
    # of those integers are different.
    my %start;
    foreach my $subop (@{ $op->{args} }) {
        my @subop_startset = $subop->startset();
        return 0 if grep { ref($_) || $_ !~ /^\d+$/ } @subop_startset;
        foreach (@subop_startset) {
            return 0 if exists($start{$_});
        }
    }

    return 1;
}

sub dfa_safe {
    my $op = shift;

    my $dfa_safe_subexprs = 1;
    foreach (@{ $op->{args} }) {
        $dfa_safe_subexprs = 0, last if ! $_->dfa_safe();
    }

    return 1 if $dfa_safe_subexprs && $op->disjoint();

    # Insert better tests here

    return 0;
}

# $ (not R$, just $)
package Regex::Ops::Tree::atend;
use vars qw(@ISA); @ISA = qw(Regex::Ops::Tree);

sub minlen { 0 }
sub maxlen { 0 }
sub startset { return () }
sub hasback { 0 }
sub dfa_safe { 1 }

########################################################################
# Rendering - only used for debugging for now
########################################################################

package Regex::Ops::Tree; # Won't get used much

sub Regex::Ops::Tree::needparen { 0 }

# Nonportable
sub isplain {
    my $ord = shift;
    return 1 if $ord >= ord('a') && $ord <= ord('z');
    return 1 if $ord >= ord('A') && $ord <= ord('Z');
    return 1 if $ord >= ord('0') && $ord <= ord('9');
    return 1 if $ord =~ /^[~!@#%&_'":;>,<]$/;
#    return 1 if $ord =~ /^[`~!@#$%^&*()\-_+{}\[\]\\|'":;\/?.>,<]$/;
    return 0;
}

sub Regex::Ops::Tree::match::render {
    my $op = shift;
    my $atom = $op->{args}->[0];
    if ($atom =~ /^\d+$/) {
        return chr($atom) if isplain($atom);
        return sprintf("\\x%02x", $atom); # Nonportable
    } else {
        die;
    }
}

sub Regex::Ops::Tree::charclass::render {
    die;
}

sub Regex::Ops::Tree::alternate::needparen { 1 }
sub Regex::Ops::Tree::alternate::render {
    my $op = shift;
    my $str = '';
    foreach my $case (@{ $op->{args} }) {
        $str .= "|" unless length($str) == 0;
        my $R = $case->render();
        $str .= $case->needparen() ? "(?:$R)" : $R;
    }

    return $str;
}

sub Regex::Ops::Tree::multi_match::needparen { 1 }
sub Regex::Ops::Tree::multi_match::render {
    my $op = shift;
    my ($min, $max, $greedy, $R) = @{ $op->{args} };
    my $base = $R->render();
    $base = "(?:$base)" if $R->needparen();
    if ($min == 0 && $max == 1) {
        $base .= "?";
    } elsif ($min == 0 && $max == -1) {
        $base .= "*";
    } elsif ($min == 1 && $max == -1) {
        $base .= "+";
    } elsif ($max == -1) {
        $base .= "{$min,}";
    } else {
        $base .= "{$min,$max}";
    }

    $base .= "?" unless $greedy;
    return $base;
}

sub Regex::Ops::Tree::group::needparen { 0 }
sub Regex::Ops::Tree::group::render {
    my $op = shift;
    my $R = $op->{args}->[0];
    my $str = $R->render();
    # Strip off (?:) from the subexpression if possible, so we can
    # render things as (R) instead of ((?:R))
    if ($str =~ /^\(\?\:(.*)\)$/) {
        $str = $1;
    }
    return "($str)";
}

# FIXME: We actually need to render the _absence_ of this op differently!
sub Regex::Ops::Tree::scan::needparen { 0 }
sub Regex::Ops::Tree::scan::render { $_[0]->{args}->[0]->render() }

sub Regex::Ops::Tree::atend::needparen { 0 }
sub Regex::Ops::Tree::atend::render { '$' }

sub Regex::Ops::Tree::seq::needparen { 0 }
sub Regex::Ops::Tree::seq::render {
    my $op = shift;
    return join('', map { $_->render() } @{ $op->{args} });
}

1;

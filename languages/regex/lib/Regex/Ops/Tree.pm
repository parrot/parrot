package Regex::Ops::Tree;
use base 'Exporter';
use strict;

use vars qw(@RegexOps @EXPORT);
@EXPORT = qw(rop);

my %SPECIAL;

my %CLASS;

sub op {
    my ($class, $name, $args, %opts) = @_;

    $class = ref($class) if ref $class;
    $class = "Regex::Ops::Tree::$name";
    my $self = bless { name => $name,
                       args => $args || [],
                       %opts }, $class;

    return $self->init();
}

sub init {
    my $self = shift;

    my $finish = $SPECIAL{ $self->{name} };
    return $finish ? $finish->($self) : $self;
}

sub rop {
    return __PACKAGE__->op(@_);
}

%RegexOps =
  ( atend => [ [ '_onearg' ] ],
    multi_match => [ [ '' ] ],
    bytematch => [ [ '_onematch' ] ],
    classmatch => [ [ '_onematch' ] ],
  );

while (my ($name, $info) = each %RegexOps) {
    my ($isa, ) = @$info;
    my $var = '@' . "Regex::Ops::Tree::" . $name . "::ISA";
    {
        no strict 'refs';
        @$var = map { length ? "Regex::Ops::Tree::$_" : "Regex::Ops::Tree" } @$isa;
    };
}



#  @RegexOps =
#    ( [ "atend()" => "return whether at end of input string" ],
#      [ "advance(n)" => "advance input <n> chars" ],
#      [ "try(R)" ],
#      [ "onfail(R)" ],
#      [ "bytematch(b)" => "return if start of input is b, advance 1 char" ],
#      [ "classmatch(charclass)" => "return if start of input is charclass, advance 1" ],
#      [ "start(n)" => "mark start of n-th paren match" ],
#      [ "end(n)" => "mark end of n-th paren match" ],
#      [ "goto(label)" => "unconditional jump to label" ],
#      [ "label(name)" => "declare a label" ],
#      [ "incr(name)" => "???" ],
#      [ "assign(name, val)" => "???" ],
#      [ "test(a, condition, b, label)" => "if (A) CONDITION (B) goto LABEL" ],
#      [ "accept(R)" => "try R, accept immediately if it matches" ],
#      [ "fail()" ],
#      [ "nop()" ],
#  );

sub rop_seq {
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

$SPECIAL{seq} = \&rop_seq;

use vars qw(%MARKERS);
sub mark {
    my $name = shift || '';
    my $number = ++$MARKERS{$name};
    $number = '' if ($number == 1) && ($name ne '');
    return bless([ 'label', "\@$name$number" ], 'asm_op');
}

# Defaults
sub minlen { die }
sub maxlen { die }
sub startset { die }
sub hasback { 0 }

package Regex::Ops::Tree::_onearg;
sub minlen { my ($op) = @_; $op->{args}->[0]->minlen() }
sub maxlen { my ($op) = @_; $op->{args}->[0]->maxlen() }
sub startset { my ($op) = @_; $op->{args}->[0]->startset() }
sub hasback { my ($op) = @_; $op->{args}->[0]->hasback() }

package Regex::Ops::Tree::multi_match;

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

package Regex::Ops::Tree::_onematch;

sub minlen { 1 }
sub maxlen { 1 }

package Regex::Ops::Tree::seq;

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

    # Must maintain invariant that '' comes first, if it exists.
    my @null;
    push(@null, '') if exists $start{''};
    delete $start{''};
    return (@null, keys %start);
}

1;

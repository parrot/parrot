package Regex::PreOptimize;
use Regex::Ops::Tree qw(rop);
use strict;

sub new {
    my ($proto, %opts) = @_;
    my $self = bless \%opts, (ref($proto) || $proto);
    $self->init();
    return $self;
}

sub init {
}

# R (seq, R, S, ...) : R followed by S followed by...
# R (scan, R) : scan for R at every position
# R (test, op1, check, op2, dest)
# R (alternate, R, S)
# R (multi_match, min, max, greedy, R)

sub pre_rewrite_optimize {
    my ($self, $t) = @_;
    return $t if ! ref $t;
    my $type = $t->{name};
    if ($type eq 'seq') {
        # R.(S.T) => R.S.T
        # Or parenthetically, seq(R,seq(\alpha)) => seq(R, \alpha)
        #
	my @pre_pieces = map { $self->pre_rewrite_optimize($_) } @{ $t->{args} };
	my @pieces;
	foreach (@pre_pieces) {
	    if (ref $_ && $_->{name} eq 'seq') {
		push @pieces, @{$_->{args}};
	    } else {
		push @pieces, $_;
	    }
	}
	return rop('seq', \@pieces);
    } elsif ($type eq 'alternate') {
	# Pull out common prefixes, and convert alternation with null
	# expressions to optional matches:
        #
        # aR|aS => a(R|S)
        # R|    => R?
        # |R    => R??
        #
	my ($R, $S) = ($self->pre_rewrite_optimize($t->{args}->[0]),
		       $self->pre_rewrite_optimize($t->{args}->[1]));
	my ($R0, @Rrest);
	my ($S0, @Srest);
        @{$t->{args}} = ($R, $S);
	return $t if ! ref $R;
	return $t if ! ref $S;

	if ($R->{name} eq 'seq') {
            my ($R0, @Rrest) = @{ $R->{args} };
	} else {
	    $R0 = $R;
	}

	if ($S->{name} eq 'seq') {
            my ($S0, @Srest) = @{ $S->{args} };
	} else {
	    $S0 = $S;
	}

	return $t unless matchsame($R0, $S0);

	my $Rrest = rop('seq', \@Rrest);
	my $Srest = rop('seq', \@Srest);
	my $alt;
	if (@Rrest == 0) {
	    # (|S) --> S??
	    $alt = rop('multi_match', [ 0, 1, 0, $Srest ]);
	} elsif (@Srest == 0) {
	    # (R|) --> R?
	    $alt = rop('multi_match', [0, 1, 1, $Rrest]);
	} else {
	    $alt = rop('alternate', [ $Rrest, $Srest ]);
	}
	return $self->pre_rewrite_optimize(rop('seq', [ $R0, $alt ]));
    } else {
        # Find all subtrees, and recurse through them.
        foreach my $arg (@{ $t->{args} }) {
            if (UNIVERSAL::isa($arg, 'Regex::Ops::Tree')) {
                # $arg is a reference variable, remember.
                $arg = $self->pre_rewrite_optimize($arg);
            }
        }
        return $t;
    }
}

# Note: the following fails to rewrite
#   aR|[a]S
# to
#   a(R|S)
#
sub matchsame {
    my ($R, $S) = @_;
    return 0 if ! ref $R;
    return 0 if ! ref $S;
    return 0 if $R->{name} ne $S->{name};
    my $type = $R->{name};
    if ($type eq 'match') {
	return $R->{args}[0] == $S->{args}[0];
    } elsif ($type eq 'classmatch') {
	return $R->{args}[0] eq $S->{args}[0];
    } elsif ($type eq 'start' || $type eq 'end') {
	return 0;
    } else {
        my @Rargs = @{ $R->{args} };
        my @Sargs = @{ $S->{args} };
	return 0 if (@Rargs != @Sargs);
	for (0..$#Rargs) { return 0 if $Rargs[$_] ne $Sargs[$_] };
	return 1;
    }
}

1;

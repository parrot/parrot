package Regex::PreOptimize;
use strict;

sub new {
    my ($proto, %opts) = @_;
    my $self = bless \%opts, (ref($proto) || $proto);
    $self->init();
    return $self;
}

sub init {
}

# R (accept, R) : try R, accept immediately if it matches
# R (seq, R, S, ...) : return R && S && ...
# R (scan, R) : scan for R at every position
# R (test, op1, check, op2, dest)
# R (alternate, R, S)
# R (multi_match, min, max, greedy, R)

sub pre_rewrite_optimize {
    my ($self, $t) = @_;
    return $t if ! ref $t;
    my $type = $t->[0];
    if ($type eq 'terminate'
	|| $type eq 'accept'
	|| $type eq 'scan'
	|| $type eq 'fork'
	|| $type eq 'reverse_fork')
    {
        # Recurse into subtree
	$t->[1] = $self->pre_rewrite_optimize($t->[1]);
	return $t;
    } elsif ($type eq 'seq') {
        # R.(S.T) => R.S.T
        # Or parenthetically, seq(R,seq(\alpha)) => seq(R, \alpha)
        #
	my @pre_pieces = map { $self->pre_rewrite_optimize($_) } @$t;
	shift(@pre_pieces);

	my @pieces;
	foreach (@pre_pieces) {
	    if (ref $_ && $_->[0] eq 'seq') {
		push @pieces, @{$_}[1..$#$_];
	    } else {
		push @pieces, $_;
	    }
	}
	return op_seq(@pieces);
    } elsif ($type eq 'alternate') {
	# Pull out common prefixes, and convert alternation with null
	# expressions to optional matches:
        #
        # aR|aS => a(R|S)
        # R|    => R?
        # |R    => R??
        #
	my ($R, $S) = ($self->pre_rewrite_optimize($t->[1]),
		       $self->pre_rewrite_optimize($t->[2]));
	my ($R0, @Rrest);
	my ($S0, @Srest);
	@{$t}[1,2] = ($R, $S);
	return $t if ! ref $R;
	return $t if ! ref $S;

	if ($R->[0] eq 'seq') {
	    $R0 = $R->[1];
	    @Rrest = @{$R}[2..$#$R];
	} else {
	    $R0 = $R;
	}

	if ($S->[0] eq 'seq') {
	    $S0 = $S->[1];
	    @Srest = @{$S}[2..$#$S];
	} else {
	    $S0 = $S;
	}

	return $t unless matchsame($R0, $S0);

	my $Rrest = op_seq(@Rrest);
	my $Srest = op_seq(@Srest);
	my $alt;
	if (@Rrest == 0) {
	    # (|S) --> S??
	    $alt = op_multi_match(0, 1, 0, $Srest);
	} elsif (@Srest == 0) {
	    # (R|) --> R?
	    $alt = op_multi_match(0, 1, 1, $Rrest);
	} else {
	    $alt = op_alternate($Rrest, $Srest);
	}
	return $self->pre_rewrite_optimize(['seq', $R0, $alt ]);
    } else {
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
    return 0 if $R->[0] ne $S->[0];
    my $type = $R->[0];
    if ($type eq 'bytematch') {
	return $R->[1] eq $S->[1];
    } elsif ($type eq 'classmatch') {
	return $R->[1] eq $S->[1];
    } elsif ($type eq 'start' || $type eq 'end') {
	return 0;
    } else {
	return 0 if (@$R != @$S);
	for (0..$#$R) { return 0 if $R->[$_] ne $S->[$_]; };
	return 1;
    }
}

use vars qw($AUTOLOAD);
sub AUTOLOAD {
    if (my ($cmd) = $AUTOLOAD =~ /op_([^:]*)$/) {
	return Regex::Grammar::register($cmd, @_);
    } else {
	die "What is `$AUTOLOAD'???";
    }
}

sub DESTROY {
}

1;

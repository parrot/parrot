package Regex::Optimize;
use Regex::Rewrite;
use strict;

sub new {
    my ($proto, %opts) = @_;
    my $self = bless \%opts, (ref($proto) || $proto);
    $self->init();
    return $self;
}

sub init {
}

my $newlabelctr = 1;
sub mklabelnum {
    return '@L' . $newlabelctr++;
}

sub mklabel {
    return [ 'label', mklabelnum() ];
}

sub label_indices {
    my ($self, $op) = @_;
    my @indices;
    for my $i (1..$#$op) {
        push(@indices, $i) if ref($op->[$i]) && $op->[$i]->[0] eq 'label';
    }
    return @indices;
}

sub combineLabels {
    my $self = shift;
    my @names = map { $_->[1] =~ /(\w+)/; $1 } @_;
    my %names;
    @names{@names} = ();
    my $label = mklabelnum();
    $self->{_label_comments}{$label} = join(", ", keys %names);
    return $label;
}

sub optimize {
    my $self = shift;

    my @equivs;
    my @output;

    # Merge adjacent (equivalent) labels, renaming them
    for my $stmt (@_) {
	if (ref $stmt && $stmt->[0] eq 'label') {
	    push @equivs, $stmt;
	} else {
	    if (@equivs) {
		my $megalabel = $self->combineLabels(@equivs);
		$_->[1] = $megalabel foreach (@equivs);
		push @output, $equivs[0];
		@equivs = ();
	    }
	    push @output, $stmt;
	}
    }
    die "The final 'terminate' is supposed to make this impossible!"
      if @equivs;

    # Jump threading: replace
    #
    #  goto @1
    #  ...
    #  @1: goto @2
    #
    # with
    #
    #  goto @2
    #  ...
    #  @1: goto @2
    #

    # First, convert all statements to the form
    #  { label => optional_label, code => original_statement }
    my $curlabel;
    my @output2;
    my %labels;
    foreach my $stmt (@output) {
	if (ref $stmt && $stmt->[0] eq 'label') {
	    $curlabel = $stmt;
	} else {
	    push @output2, { label => $curlabel, code => $stmt };
	    $labels{$curlabel->[1]} = $output2[-1] if $curlabel;
	    undef $curlabel;
	}
    }

    # Second, scan for label references and follow goto's until the
    # final destination of each is reached, then replace the original
    # reference.

    foreach my $stmt (@output2) {
	my ($label, $actual) = @$stmt{'label','code'};

        # Find statements that can branch to a label
        my @labels;
        @labels = $self->label_indices($actual) if ref $actual;

	if (@labels) {
            foreach my $pos (@labels) {
                my $dest = $actual->[$pos];
                while (1) {
                    my $dest_stmt = $labels{$dest->[1]};
                    last if ! ref $dest_stmt->{code};
                    last if $dest_stmt->{code}->[0] ne 'goto';
                    $dest = $dest_stmt->{code}->[1];
                }
                $stmt->{code}->[$pos] = $dest;
            }
	}
    }

    # At this point, every basic block but the first begins with a
    # labelled statement. Next, do a reachability analysis to find
    # unreachable basic blocks. We'll store a 'reachable' flag in the
    # 3rd element of the labels.

    # But first, make *all* basic blocks begin with a label.
    if (! $output2[0]->{label}) {
	$output2[0]->{label} = mklabel();
    }

    # Stick in a next_stmt ref in every statement to make it easier to
    # move around.
    my $next;
    for my $stmt (reverse @output2) {
	$stmt->{'next'} = $next;
	$next = $stmt;
    }

    # Push first statement on the queue
    my @Q = ($output2[0]);

    $DB::single = 1;
  BBLOCK:
    while (@Q) {
	my $stmt = shift(@Q);
	next if $stmt->{label}->[2]; # Already reached here
	$stmt->{label}->[2] = 1;

	# Loop over the basic block starting at $stmt
	my $prev;
	do {
	    if (ref $stmt->{code}) {
                my @labels = $self->label_indices($stmt->{code});
                foreach my $pos (@labels) {
                    push @Q, $labels{$stmt->{code}->[$pos]->[1]};
                }
                if ($stmt->{code}->[0] =~ /^(?:goto|fail)$/) {
                    next BBLOCK;
                }
            }
	    $prev = $stmt;
	    $stmt = $stmt->{next};
	} while ($stmt && ! $stmt->{label});

	# Fallthrough reachable
	push @Q, $stmt if $stmt;
    }

    # Eliminate unreachable code
    my @output3; # Really should do @output = (), but I hate doing a
                 # compiler's work for it.
    my $keeping = 1;
    foreach my $stmt (@output2) {
	if ($stmt->{label}) {
	    $keeping = $stmt->{label}->[2]; # Keep if reachable
	}
	push @output3, $stmt if $keeping;
    }

    # Reset the 'next' pointers
    undef $next;
    for my $stmt (reverse @output3) {
	$stmt->{next} = $next;
	$next = $stmt;
    }

    # Eliminate gotos to the following address
    my @output4;
    foreach my $stmt (@output3) {
	if (ref $stmt->{code} && $stmt->{code}->[0] eq 'goto') {
	    if ($stmt->{next}->{label}
                && $stmt->{code}->[1] == $stmt->{next}->{label})
            {
		# If the label of the goto is the label of the following
		# block of code:
		next;
	    }
	}
	push @output4, $stmt;
    }

    # Delete labels that are not the destination of any jump (these
    # are the ones that were marked reachable because the previous
    # basic block fell through to them.)
    my %AMDEST; # { label name => boolean }
    foreach (@output4) {
        my $code = $_->{code};
        foreach (map { $code->[$_] } $self->label_indices($code)) {
            $AMDEST{$_->[1]} = 1;
        }
    }
    foreach (@output4) {
        delete $_->{label} if ($_->{label} && ! $AMDEST{$_->{label}->[1]});
    }

    return (
            bless($self->{_label_comments}, 'LABEL_COMMENTS'),
            map { ($_->{label} ? ($_->{label}) : ()), $_->{code} } @output4
           );
}

1;

package Regex::Optimize;
use Regex::Rewrite;
use Regex::Ops::List;
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
    Regex::Ops::List->mark(mklabelnum());
}

sub label_indices {
    my ($self, $op) = @_;
    my @indices;
    for my $i (0..$#{ $op->{args} }) {
        push(@indices, $i) if ref($op->{args}->[$i])
                              && $op->{args}->[$i]->{name} eq 'LABEL';
    }
    return @indices;
}

sub combineLabels {
    my $self = shift;
    my @names = map { $_->{label} =~ /(\w+)/; $1 } @_;
    my %names;
    @names{@names} = ();
    my $label = mklabelnum();
    $self->{_label_comments}{$label} = join(", ", keys %names);
    return $label;
}

sub optimize {
    my $self = shift;

    # @_ : (ops)
    my @equivs; # (labels)
    my @output; # (ops)

    # Merge adjacent (equivalent) labels, renaming them
    for my $stmt (@_) {
	if (ref $stmt && $stmt->{name} eq 'LABEL') {
	    push @equivs, $stmt;
	} else {
	    if (@equivs) {
		my $megalabel = $self->combineLabels(@equivs);
		$_->{label} = $megalabel foreach (@equivs);
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
    #  { label => optional_label, code => original_op }
    my $curlabel;
    my @output2; # { label => ?label, code => op } : tagged_op
    my %labels; # { label string => tagged_op }
    foreach my $stmt (@output) {
	if ($stmt->{name} eq 'LABEL') {
	    $curlabel = $stmt;
	} else {
	    push @output2, { label => $curlabel, code => $stmt };
	    $labels{$curlabel->{label}} = $output2[-1] if $curlabel;
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

        foreach my $pos (@labels) {
            my $dest = $actual->{args}->[$pos];
            while (1) {
                my $dest_stmt = $labels{$dest->{label}}
                  or die "untargeted label $dest->{label}";
                last if $dest_stmt->{code}->{name} ne 'goto';
                $dest = $dest_stmt->{code}->{args}->[0];
            }
            $actual->{args}->[$pos] = $dest;
        }
    }

    # At this point, every basic block but the first begins with a
    # labelled statement. Next, do a reachability analysis to find
    # unreachable basic blocks. We'll store a 'reachable' flag in the
    # 3rd element of the labels.

    # But first, make *all* basic blocks begin with a label.
    $output2[0]->{label} ||= mklabel();

    # Stick in a next_stmt ref in every statement to make it easier to
    # move around.
    my $next;
    for my $stmt (reverse @output2) {
	$stmt->{'next'} = $next;
	$next = $stmt;
    }

    # Push first statement on the queue
    my @Q = ($output2[0]);

  BBLOCK:
    while (my $stmt = shift(@Q)) {
	next if $stmt->{label}->{reachable}; # Already reached here
	$stmt->{label}->{reachable} = 1;

	# Loop over the basic block starting at $stmt
	my $prev;
	do {
	    if (ref $stmt->{code}) {
                my @labels = $self->label_indices($stmt->{code});
                foreach my $pos (@labels) {
                    push @Q, $labels{$stmt->{code}->{args}->[$pos]->{label}};
                }
                if ($stmt->{code}->{name} =~ /^(?:goto|fail)$/) {
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
	    $keeping = $stmt->{label}->{reachable}; # Keep if reachable
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
	if (ref $stmt->{code} && $stmt->{code}->{name} eq 'goto') {
	    if ($stmt->{next}->{label}
                && $stmt->{code}->{args}->[0] == $stmt->{next}->{label})
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
        foreach (map { $code->{args}->[$_] } $self->label_indices($code)) {
            $AMDEST{$_->{label}} = 1;
        }
    }
    foreach (@output4) {
        delete $_->{label} if ($_->{label} && ! $AMDEST{$_->{label}->{label}});
    }

    return (
            bless($self->{_label_comments}, 'LABEL_COMMENTS'),
            map { ($_->{label} ? ($_->{label}) : ()), $_->{code} } @output4
           );
}

1;

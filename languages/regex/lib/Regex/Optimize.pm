=head1 PACKAGE

Regex::Optimize

=head1 ABSTRACT

Optimize a sequence of list ops.

=head1 INTERNAL ROUTINES

=over 4

=cut

package Regex::Optimize;

use Regex::Ops::List;
use Regex::State;
use strict;
require 'Regex.pm';

sub new {
    my ($proto, %options) = @_;
    my $self = bless \%options, (ref($proto) || $proto);
    $self->init();
    return $self;
}

sub init {
    my $self = shift;
    $self->{state} ||= Regex->global_state();
}

sub mklabel {
    my ($self) = @_;
    return $self->{state}->genlabel("L");
}

sub is_label {
    return UNIVERSAL::isa(shift(), 'Regex::Ops::Label');
}

=item method label_indices(op)

Figure out which arguments of an op are labels, and return an array of
their indices.

=cut

sub label_indices {
    my ($self, $op) = @_;
    my @indices;
    for my $i (0..$#{ $op->{args} }) {
        my $arg = $op->{args}->[$i];
        push(@indices, $i) if is_label($arg);
    }
    return @indices;
}

=item method combineLabels(label1, label2, ...)

Creates a new label to represent a group of label objects. Also
remembers what the original names are so a comment giving them can be
generated later.

=cut

sub combineLabels {
    my $self = shift;
    my @names = map { $_->{label} =~ /(\w+)/; $1 } @_;
    my %names;
    @names{@names} = ();
    my $label = $self->mklabel();
    $self->{_label_comments}{$label->{label}} = join(", ", keys %names);
    return $label->{label};
}

=item method optimize(ops...)

 1. Merge equivalent labels
 2. Jump threading: Replace goto X; ...; X: goto Y; with goto Y.
 3. Eliminate unreachable code.
 4. Eliminate jumps to the following address.
 5. Eliminate unused labels.

TODO:

 1. I would like to optimize

     B1: sub x, 1
         goto S0
     B2: sub x, 1
         goto B1
     B3: sub x, 1
         goto B2

 to

     B1: sub x, 1
         goto S0
     B2: sub x, 2
         goto S0
     B3: sub x, 3
         goto S0

since this commonly occurs in regex code, due to sequence of
single-character matches (eg /a[bB]c/).

But perhaps this should be handled in the Tree -> List rewrite??

=cut

sub optimize {
    my ($self, $ops, $ctx) = @_;
    die "Wrong #args" if @_ != 3;

    my @equivs; # (labels)
    my @output; # (ops)

    # Merge adjacent (equivalent) labels, renaming them
    for my $stmt (@$ops) {
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
    # and construct a mapping from label names to destination tagged_op
    my $curlabel;
    my @output2; # ( { label => ?label, code => op } : tagged_op )
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
        # $stmt : { label => ?label, code => op }
	my ($label, $actual) = @$stmt{'label','code'};

        # Find statements that can branch to a label
        my @labels;
        @labels = $self->label_indices($actual) if ref $actual;

        foreach my $pos (@labels) {
            my $dest = $actual->{args}->[$pos];
            while (1) {
                my $dest_stmt = $labels{$dest->{label}}; # tagged_op
                if (! $dest_stmt) {
                    if ($ctx->{external_labels}{$dest->{label}}) {
                        # Mark external label as reachable
                        $dest->{reachable} = 1;
                        last; # Stop tracing through jumps
                    } else {
                        die "untargeted label $dest->{label}";
                    }
                }
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
    $output2[0]->{label} ||= $self->{state}->genlabel("beginning");

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
                    pop @Q if ! defined $Q[-1]; # External label
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

sub dbg_render {
    if (UNIVERSAL::isa($_[0], 'Regex::Ops::List')) {
        map {
            if ($_->{name} eq 'LABEL') {
                "$_->{label}: ";
            } else {
                $_->{name} . " " . join(", ", map { ref($_) ? $_->{label} : $_ } @{ $_->{args} || [] });
            }
        } @_;
    } else {
        map {
            my $str;
            if ($_->{label}) {
                $str .= "**" if $_->{label}{reachable};
                $str .= "$_->{label}->{label}: ";
            }
            $str .= $_->{code}{name} . " " . join(", ", map { ref($_) ? $_->{label} : $_ } @{ $_->{code}{args} || [] });
            $str;
        } @_;
    }
}

1;

=back

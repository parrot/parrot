package P6C::IMCC::ExtRegex::TreeOps;
use base 'Regex::Ops::Tree';

=head1 NAME

P6C::IMCC::ExtRegex::TreeOps - A few additional Regex::Ops::Tree ops
for implementing Perl6-flavor rules.

=head1 OPS

All of these ops inherit from P6C::IMCC::ExtRegex::TreeOps::_runtime,
which gives the optimization values for the ops: they can be any
length, cannot be converted to a DFA, etc.

=over 4

=item B<code>

A wad of Perl6 code.

=item B<array_literal>

A Perl6 array literal (duh!)

=item B<string>

A Perl6 string value. Is this used? Ah, who cares.

=back

=cut

use strict;

@P6C::IMCC::ExtRegex::TreeOps::code::ISA =
  qw(P6C::IMCC::ExtRegex::TreeOps::_runtime);
@P6C::IMCC::ExtRegex::TreeOps::array_literal::ISA =
  qw(P6C::IMCC::ExtRegex::TreeOps::_runtime);
@P6C::IMCC::ExtRegex::TreeOps::string::ISA =
  qw(P6C::IMCC::ExtRegex::TreeOps::_runtime);

@P6C::IMCC::ExtRegex::TreeOps::_runtime::ISA =
  qw(P6C::IMCC::ExtRegex::TreeOps);

sub op {
    my ($class, $name, $args, %opts) = @_;
    no strict 'refs';
    my $isa = __PACKAGE__ . "::" . $name . "::ISA";
    if (@$isa) {
        return $class->SUPER::op($name, $args, %opts);
    } else {
        return Regex::Ops::Tree->SUPER::op($name, $args, %opts);
    }
}

package P6C::IMCC::ExtRegex::TreeOps::_runtime;
use Carp qw(confess);
sub minlen { 0 }
sub maxlen { undef; }
sub startset { confess "unimplemented" }
sub hasback { 1 }
sub dfa_safe { 0 }

sub render { die "unimplemented" };

1;

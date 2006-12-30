#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id: pmc2c.t 14964 2006-10-18 18:20:48Z particle $
# 01-pmc2cutils.t

BEGIN {
    use FindBin qw($Bin);
    use Cwd qw(cwd realpath);
    realpath($Bin) =~ m{^(.*\/parrot)\/[^/]*\/[^/]*\/[^/]*$};
    $topdir = $1;
    if (defined $topdir) {
        print "\nOK:  Parrot top directory located\n";
    } else {
        die "Unable to locate top-level Parrot directory";
    }
    unshift @INC, qq{$topdir/lib};
}
use strict;
use warnings;
use Test::More tests => 28;

use_ok( 'Parrot::Pmc2c::Utils' );

my (%opt, @include, @args);
my $self;

$self = Parrot::Pmc2c::Utils->new( {
    include => \@include,
    opt     => \%opt,
    args    => [ @args ],
} );
isa_ok($self, q{Parrot::Pmc2c::Utils});
can_ok($self, q{get_included_paths});
can_ok($self, q{find_file});
can_ok($self, q{dump_vtable});
can_ok($self, q{open_file});
can_ok($self, q{print_tree});
can_ok($self, q{read_dump});
can_ok($self, q{gen_c});
can_ok($self, q{extract_balanced});
can_ok($self, q{parse_flags});
can_ok($self, q{parse_method_attrs});
can_ok($self, q{inherit_attrs});
can_ok($self, q{parse_pmc});
can_ok($self, q{gen_parent_list});
can_ok($self, q{find_and_parse_pmc});
can_ok($self, q{gen_super_meths});
can_ok($self, q{add_defaulted});
can_ok($self, q{dump_is_newer});
can_ok($self, q{dump_pmc});

eval {
  $self = Parrot::Pmc2c::Utils->new( [
      include => \@include,
      opt     => \%opt,
      args    => [ @args ],
  ] );
};
like($@, qr/Must pass a hash ref to Parrot::Pmc2c::Utils::new/,
    "Constructor correctly failed due to lack of hash ref as argument");

eval {
  $self = Parrot::Pmc2c::Utils->new( {
      opt     => \%opt,
      args    => [ @args ],
  } );
};
like($@, qr/Must have key 'include' which is a reference to an array of directories/,
    "Constructor correctly failed due to lack of 'include' key");

eval {
  $self = Parrot::Pmc2c::Utils->new( {
      include => {},
      opt     => \%opt,
      args    => [ @args ],
  } );
};
like($@, qr/Must have key 'include' which is a reference to an array of directories/,
    "Constructor correctly failed due to 'include' key's value not being array ref");

eval {
  $self = Parrot::Pmc2c::Utils->new( {
      include => \@include,
      args    => [ @args ],
  } );
};
like($@, qr/Must have key 'opt' which is a reference to a hash of option values/,
    "Constructor correctly failed due to lack of 'opt' key");

eval {
  $self = Parrot::Pmc2c::Utils->new( {
      include => \@include,
      opt     => [],
      args    => [ @args ],
  } );
};
like($@, qr/Must have key 'opt' which is a reference to a hash of option values/,
    "Constructor correctly failed due to 'opt' key's lack of hash ref as argument");

eval {
  $self = Parrot::Pmc2c::Utils->new( {
      include => \@include,
      opt     => \%opt,
  } );
};
like($@, qr/Must have key 'args' which is a reference to a list of the remaining arguments/,
    "Constructor correctly failed due to lack of 'args' key");

eval {
  $self = Parrot::Pmc2c::Utils->new( {
      include => \@include,
      opt     => \%opt,
      args    => {},
  } );
};
like($@, qr/Must have key 'args' which is a reference to a list of the remaining arguments/,
    "Constructor correctly failed because 'args' key had wrong type for value");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

01-pmc2cutils.t - test Parrot::Pmc2c::Utils basic functionality

=head1 SYNOPSIS

    % prove t/tools/pmc2cutils/01-pmc2cutils.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of 
F<lib/Parrot/Pmc2c/Utils.pm>.  By doing so, they test the functionality 
of the F<pmc2c.pl> utility.  That functionality has largely been extracted 
into the methods of F<Utils.pm>.

F<01-pmc2cutils.t> consists solely of:

=over 4

=item 1

calls to C<Test::More::isa_ok()> and C<can_ok()> on the 
constructor and publicly available methods of Parrot::Pmc2c::Utils; and 

=item 2

tests of how the constructor handles bad arguments.

=back

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Pmc2c, F<pmc2c.pl>.

=cut


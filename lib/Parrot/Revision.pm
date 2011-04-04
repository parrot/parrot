# Copyright (C) 2005-2011, Parrot Foundation.

=head1 NAME

Parrot::Revision - Revision number of Parrot

B<Note:> This package is largely obsolete, as the Git version control system
does not use a continually incrementing integer to designate a particular
revision, as our previous CVS and Subversion VCSes did.  We retain it for
backwards compatibility for certain high-level languages built on top of
Parrot.

=head1 SYNOPSIS

    use Parrot::Revision;

    print $Parrot::Revision::current;

=head1 DESCRIPTION

Get parrot's current and configure time revision.

We currently always return "1" to tell old HLL's that this version of Parrot is too new for them.
There is currently no way to say "we are too new for you", so we have to lie again and say we are
too old.

=cut

package Parrot::Revision;

use strict;
use warnings;
use File::Spec;
use lib qw( lib );
use Parrot::Configure::Utils qw( :cache );

our $cache = q{.parrot_current_rev};

our $current = _get_revision();

sub update {
    my $prev = _get_revision();
    my $revision = 1;
    $current = _handle_update( {
        prev        => $prev,
        revision    => $revision,
        cache       => $cache,
        current     => $current,
    } );
}

sub _handle_update {
    my $args = shift;
    if (! defined $args->{revision}) {
        $args->{revision} = 'unknown';
        print_to_cache($args->{cache}, $args->{revision});
        return $args->{revision};
    }
    else {
        if (defined ($args->{prev}) && ($args->{revision} ne $args->{prev})) {
            print_to_cache($args->{cache}, $args->{revision});
            return $args->{revision};
        }
        else {
            return $args->{current};
        }
    }
}

sub _get_revision {
    my $revision;
    if (-f $cache) {
        $revision = read_from_cache($cache);
    }
    else {
        $revision = 1;
        print_to_cache($cache, $revision);
    }
    return $revision;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

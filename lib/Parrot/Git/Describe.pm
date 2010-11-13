# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

Parrot::Git::Describe - Git describe string of Parrot

=head1 SYNOPSIS

    use Parrot::Git::Describe;

    print $Parrot::Git::Describe::current;

=head1 DESCRIPTION

Get Parrot's current and configure time "git describe" string, which is the out of

    git describe --tags

=cut

package Parrot::Git::Describe;

use strict;
use warnings;
use File::Spec;

our $cache = q{.parrot_current_git_describe};

our $current = _get_git_describe();

sub update {
    my $prev         = _get_git_describe();
    my $git_describe = 1;

    $current = _handle_update( {
        prev         => $prev,
        git_describe => $git_describe,
        cache        => $cache,
        current      => $current,
    } );
}

sub _handle_update {
    my $args = shift;
    if (! defined $args->{git_describe}) {
        $args->{git_describe} = 'unknown';
        _print_to_cache($args->{cache}, $args->{git_describe});
        return $args->{git_describe};
    }
    else {
        if (defined ($args->{prev}) && ($args->{git_describe} ne $args->{prev})) {
            _print_to_cache($args->{cache}, $args->{git_describe});
            return $args->{git_describe};
        }
        else {
            return $args->{current};
        }
    }
}

sub _print_to_cache {
    my ($cache, $git_describe) = @_;
    open my $FH, ">", $cache
        or die "Unable to open handle to $cache for writing: $!";
    print {$FH} "$git_describe\n";
    close $FH or die "Unable to close handle to $cache after writing: $!";
}

sub _get_git_describe {
    my $git_describe;
    if (-f $cache) {
        open my $FH, '<', $cache
            or die "Unable to open $cache for reading: $!";
        chomp($git_describe = <$FH>);
        close $FH or die "Unable to close $cache after reading: $!";
    }
    else {
        $git_describe = `git describe --tags`;
        chomp( $git_describe );
        _print_to_cache($cache, $git_describe);
    }
    return $git_describe;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

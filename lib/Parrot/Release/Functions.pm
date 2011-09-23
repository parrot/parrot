package Parrot::Release::Functions;
# Copyright (C) 2011, Parrot Foundation.
use strict;
use warnings;
use Carp;
use autodie;
use base qw( Exporter );
our @EXPORT_OK = qw(
    get_old_and_new_versions
    get_simple_files
    bump_gen_code_version
    get_generated_files
    simple_update_version
);

#################### DOCUMENTATION ####################

=head1 NAME

Parrot::Release::Functions - Functions used during the Parrot release process

=head1 SYNOPSIS

    use Parrot::Release::Functions qw(
        bump_gen_code_version
    );

=head1 DESCRIPTION

This package exports, on demand only, non-object-oriented subroutines used
during the release process.

=head1 SUBROUTINES

=cut

=head2 C<get_old_and_new_versions()>

=over 4

=item * Purpose

Get the current version number from F<VERSION> and validate the format of the
new version number.

=item * Arguments

    ($old_version, $new_version) =
        get_old_and_new_versions('new.version.number');

=item * Return Value

Implicitly returns true value upon success.

=back

=cut

sub get_old_and_new_versions {
    croak "get_old_and_new_versions(): Must supply a single argument: new version number"
        unless @_ == 1;
    croak "Cannot locate VERSION file" unless (-f 'VERSION');
    
    my $new_version = shift(@_);
    open my $version_fh, '<', 'VERSION';
    my $old_version = <$version_fh>;
    chomp $old_version;
    close $version_fh;
    
    croak "'$new_version' is not a proper version number; must be n.n.n"
        unless $new_version =~ m/^\d+\.\d+\.\d+$/;
    return ( $old_version, $new_version );
}

=head2 C<get_simple_files()>

=over 4

=item * Purpose

Get a list of source code files in which the version number must be
incremented.

=item * Arguments

None.

=item * Purpose

Returns a list of source code files in which the version number must be
incremented.

=back

=cut

sub get_simple_files {
    return (
        'VERSION',
        'MANIFEST.generated',
        'README',
    );
}

=head2 C<simple_update_version()>

=over 4

=item * Purpose

Increments the version number within a given file.

=item * Arguments

    simple_update_version($filename, $old_version, $new_version);

=item * Return Value

Implicitly returns true value upon success.

=back

=cut

sub simple_update_version {
    my ($f, $old_version, $new_version) = @_;
    my $new = "$f.tmp";
    open my $IN, '<', $f or croak "Unable to open $f for reading";
    open my $OUT, '>', $new or croak "Unable to open $new for writing";
    while (<$IN>) {
        chomp;
        s/$old_version/$new_version/g;
        print $OUT "$_\n";
    }
    close $OUT or croak "Unable to close $new after writing";
    close $IN or croak "Unable to close $f after reading";
    rename $new => $f or croak "Unable to rename $new to $f";
}

=head2 C<get_generated_files()>

=over 4

=item * Purpose

Get a list of files generated during configuration or build in which the
version number must be incremented.

=item * Arguments

None.

=item * Purpose

Returns a list of files generated during configuration or build in which the
version number must be incremented.

=back

=cut

sub get_generated_files {
    return (
        'include/parrot/oplib/core_ops.h',
        'src/ops/core_ops.c',
    );
}

=head2 C<bump_gen_code_version()>

=over 4

=item * Purpose

Increments the version number within a given file.  This function is used for
files generated during configuration or build.

=item * Arguments

    bump_gen_code_version($filename, $old_version, $new_version);

=item * Return Value

Implicitly returns true value upon success.

=back

=cut

sub bump_gen_code_version {

    my ($filename, $old_version, $new_version) = @_;
    my $old_h_version = join("_", split(/\./, $old_version));
    my @new_version   = split(/\./, $new_version);
    my $new_h_version = join("_", @new_version);

    open my $gen_c_in, '<', "$filename";
    open my $gen_c_out, '>', "$filename.tmp";
    while(<$gen_c_in>) {
        s/$old_h_version/$new_h_version/g;
        s?\d+,    /\* major_version \*/?$new_version[0],    /* major_version */?;
        s?\d+,    /\* minor_version \*/?$new_version[1],    /* minor_version */?;
        s?\d+,    /\* patch_version \*/?$new_version[2],    /* patch_version */?;
        print $gen_c_out $_;
    }
    close $gen_c_in;
    close $gen_c_out;
    rename "$filename.tmp", $filename;
}

1;

=head1 SEE ALSO

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

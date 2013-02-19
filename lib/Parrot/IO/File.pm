# Copyright (C) 2004-2012, Parrot Foundation.

=head1 NAME

Parrot::IO::File - File

=head1 SYNOPSIS

    use Parrot::IO::File;

=head1 DESCRIPTION

Use this to query and manipulate files and their contents.

=head2 Class Methods

=over

=cut

package Parrot::IO::File;

use strict;
use warnings;

use base qw( Parrot::IO::Path );

use FileHandle;
use File::Spec ();
use Parrot::IO::Directory;

# [GH #820] Win32 stat() for mtime is broken. Try to use Win32::UTCFileTime
BEGIN {
    if ($^O eq 'MSWin32') {
        eval { require Win32::UTCFileTime; }
          and Win32::UTCFileTime::import(':globally');
    }
}

=item C<tmp_file($path)>

Returns the file for C<$path> relative to the default temporary
directory.

=cut

sub tmp_file {
    my $self = shift;

    return $self->new( File::Spec->catfile( File::Spec->tmpdir, @_ ) );
}

=item C<new($path)>

Returns the instance for C<$path>.

=cut

sub new {
    my $self = shift;
    my $path = shift;

    return unless defined $path and !-d $path;

    return $self->SUPER::new($path);
}

=back

=head2 Instance Methods

=over 4

=item C<create_path()>

This is called from C<new()> to create the path if necessary.

=cut

sub create_path {
    my $self = shift;

    return unless $self->SUPER::create_path;

    # Just to touch the file.
    # Make sure write() doesn't dismiss this as a noop.
    $self->write('') unless -e $self->path;

    return -f $self->path;
}

=item C<parent($path)>

Returns the file's parent directory.

=cut

sub parent {
    my $self = shift;
    my $path = shift;

    return Parrot::IO::Directory->new( $self->parent_path );
}

=item C<read()>

This reads the contents of the file and returns it as an array or string
depending on the context in which the method is called.

    $contents = $file->read;
    @lines = $file->read;

=cut

sub read {
    my $self = shift;
    my $fh   = FileHandle->new( $self->path )
        or die 'Failed to open ' . $self->path . ": $!";
    my @lines = <$fh>;

    $fh->close;

    return wantarray ? @lines : join '', @lines;
}

=item C<write(@lines)>

Writes the specified lines to the file.

=cut

sub write {
    my $self = shift;

    return unless @_;

    my $fh = FileHandle->new( '>' . $self->path )
        or die 'Failed to open ' . $self->path . ": $!";

    print $fh @_;

    $fh->close;
}

=item C<append(@lines)>

Writes the specified lines to the file.

=cut

sub append {
    my $self = shift;

    return unless @_;

    my $fh = FileHandle->new( '>>' . $self->path )
        or die 'Failed to open ' . $self->path . ": $!";

    print $fh @_;

    $fh->close;
}

=item C<is_executable()>

This tells you whether the file is executable.

=cut

sub is_executable {
    my $self = shift;

    return $self->stat->mode & 0111;
}

=item C<modified_since($time)>

Use this to find out whether the file has been modified since the
specified time. C<$time> is a number of non-leap seconds since the
epoch.

=cut

sub modified_since {
    my $self = shift;
    my $time = shift;

    return $self->stat->mtime > $time;
}

=item C<is_hidden()>

Returns whether the file is "hidden", i.e. its name starts with a dot.

=cut

sub is_hidden {
    my $self = shift;

    return $self->name =~ /^\./;
}

=item C<is_generated()>

Returns whether the file is generated.

=cut

sub is_generated {
    my $self = shift;

    # CFLAGS
    # libparrot.def
    # Makefile
    # myconfig

    # include/parrot/config.h
    # include/parrot/core_pmcs.h
    # include/parrot/feature.h

    # runtime/parrot/include/* (all?)

    # lib/Parrot/Config.pm

    return 1
        if $self->suffix =~ /^(?:dump|html|flag|o)$/
            or $self->name =~
/^(?:perl6-config|libparrot.def|CFLAGS|myconfig|(?:core_pmcs|exec_(?:cpu|dep)|fingerprint|jit_(?:cpu|emit)|nci|platform(?:_interface)?)\.[ch]|(?:charclass|feature)\.h)$/
            or $self->parent->name eq 'ops' and $self->suffix =~ /^(?:c|pod)$/;

    return 0;
}

=item C<delete()>

Deletes the file, removes the instance from the cache, and undefines it.

Raises an exception if the delete fails.

=cut

sub delete {

    # Use $_[0] so that we can undef the instance in SUPER::delete().

    unlink( $_[0]->path ) or die 'Failed to unlink ' . $_[0]->path . ": $!";

    $_[0]->SUPER::delete;
}

=back

=head1 SEE ALSO

=over 4

=item C<Parrot::IO::Directory>

=item C<Parrot::IO::Path>

=back

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

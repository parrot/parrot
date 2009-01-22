# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

package Parrot::Configure::Step::Methods;
use strict;
use warnings;
use Carp;

=head1 NAME

Parrot::Configure::Step::Methods - Methods for selected configuration steps

=head1 DESCRIPTION

The Parrot::Configure::Step::Methods module provides methods inherited by
Parrot::Configure::Step which are used internally by the C<runstep()> method
of more than one configuration step class but which are not intended for
general use in all configuration step classes.

The methods in this module should not be considered
part of the public interface of Parrot::Configure::Step.  They merely refactor
code which at one point was repeated in multiple configuration step classes
and which need access to the data in the Parrot::Configure::Step object.

Since the methods are not part of the public interface, their names should
begin with an underscore 'C<_>'.

=head1 METHODS

=head2 C<_handle_darwin_for_fink()>

    $self->_handle_darwin_for_fink($conf, $libs, $osname, $file);

Currently used in configuration step classes auto::gmp, auto::readline and
auto::gdbm.

Modifies settings for C<linkflags>, C<ldflags> and C<ccflags> in the
Parrot::Configure object's data structure.

=cut

sub _handle_darwin_for_fink {
    my ($self, $conf, $osname, $file) = @_;
    if ( $osname =~ /darwin/ ) {
        my $fink_lib_dir        = $conf->data->get('fink_lib_dir');
        my $fink_include_dir    = $conf->data->get('fink_include_dir');
        if ( (defined $fink_lib_dir) && (defined $fink_include_dir) ) {
            if ( -f "$fink_include_dir/$file" ) {
                my %intended = (
                    linkflags => "-L$fink_lib_dir",
                    ldflags   => "-L$fink_lib_dir",
                    ccflags   => "-I$fink_include_dir",
                );
                _add_flags_not_yet_seen($conf, \%intended);
            }
        }
    }
    return 1;
}

=head2 C<_handle_darwin_for_macports()>

    $self->_handle_darwin_for_macports($conf, $libs, $osname, $file);

Currently used in configuration step classes auto::gmp, auto::readline and
auto::opengl.

Modifies settings for C<linkflags>, C<ldflags> and C<ccflags> in the
Parrot::Configure object's data structure.

Potentially expandable to cover all BSD-ports systems -- but as yet there has
been no demand.

=cut

sub _handle_darwin_for_macports {
    my ($self, $conf, $osname, $file) = @_;
    if ( $osname =~ /darwin/ ) {
#        my $ports_root          = $conf->data->get( 'ports_base_dir' );
        my $ports_lib_dir       = $conf->data->get( 'ports_lib_dir' );
        my $ports_include_dir   = $conf->data->get( 'ports_include_dir' );
        if ( defined $ports_lib_dir && defined $ports_include_dir ) {
            if ( -f qq{$ports_include_dir/$file} ) {
                my %intended = (
                    linkflags => "-L$ports_lib_dir",
                    ldflags   => "-L$ports_lib_dir",
                    ccflags   => "-I$ports_include_dir",
                );
                _add_flags_not_yet_seen($conf, \%intended);
            }
        }
    }
    return 1;
}

=head2 C<_select_lib()>

    $self->_select_lib( {
        conf            => $conf,
        osname          => $osname,
        cc              => $cc,
        win32_gcc       => '-lalpha32 -lalpha32 -lopenalpha32',
        win32_nongcc    => 'alpha.lib',
        cygwin          => '-lalpha32 -lXalpha32', # optional
        darwin          => 'alphadarwin.lib',
        default         => '-lalpha',
    } );

B<Purpose>:  In a number of configuration step classes, the class's
C<runstep()> method adds libraries to the single whitespace-delimited string found in
the Parrot::Configure object's C<libs> attribute.  The libraries to be added
are either OS-specific or OS/C-compiler-specific.  This method enables the
developer of a configuration step class to define a default value for such a
flag -- usually the value that is appropriate to Unix-like systems -- and,
optionally, to define non-default values for certain OSes or OS/C-compiler
combinations.  We currently support settings for:

=over 4

=item * MSWin32 with F<gcc> as the C-compiler.

=item * MSWin32 with any C-compiler other than F<gcc>.

=item * Cygwin to override Mingw.

=item * Darwin.

=back

B<Arguments>: Reference to a hash.  Four of the hash's key-value pairs are
required:

=over 4

=item * C<conf>

The Parrot::Configure object.  Supplied within C<runstep()>.

=item * C<osname>

The name of the operating system.  Supplied within C<runstep()>.

=item * C<cc>

The name of the C-compiler.  Supplied within C<runstep()>.

=item * C<default>

Libraries to be added where no OS-specific or OS/C-compiler-specific libraries
are to be added.  Single whitespace-delimited string.

=back

These optional settings are currently supported and, if provided, will
supersede the value in C<default>.

=over 4

=item * C<win32_gcc>

Libraries to be added where OS is mswin32 or cygwin and C-compiler is F<gcc>.
Single whitespace-delimited string.

=item * C<win32_nongcc>

Libraries to be added where OS is mswin32 and C-compiler is not F<gcc>.
Single whitespace-delimited string.

=item * C<cygwin>

Optional libraries to be added where OS is cygwin. This overrides C<win32_gcc>
if defined.
Single whitespace-delimited string.

=item * C<darwin>

Libraries to be added where OS is Darwin.  Do not supply a value if the value
you need is the same as C<default>.  Single whitespace-delimited string.

=back

B<Return Value>:  Returns true value upon success.

=cut

sub _select_lib {
    my $self = shift;
    my $args = shift;
    croak "_select_lib() takes hashref: $!" unless ref($args) eq 'HASH';
    my $platform =
           $args->{osname} =~ /cygwin/i      ? 'cygwin'
        :(($args->{osname} =~ /mswin32/i ||
           $args->{osname} =~ /cygwin/i) &&
           $args->{cc} =~ /^gcc/i)          ? 'win32_gcc'
        :  $args->{osname} =~ /mswin32/i    ? 'win32_nongcc'
        :  $args->{osname} =~ /darwin/i     ? 'darwin'
        :                                     'default';
    my $libs = defined($args->{$platform})
        ? $args->{$platform}
        : $args->{default};
    return $libs;
}

sub _add_flags_not_yet_seen {
    my ($conf, $intended) = @_;
    foreach my $flag (keys %{ $intended }) {
        my $flagstr = $conf->data->get($flag);
        my @elements = split /\s+/, $flagstr;
        my %seen = map {$_, 1} @elements;
        $conf->data->add( ' ', $flag => $intended->{$flag} )
            unless $seen{$intended->{$flag}};
    }
}


=head1 SEE ALSO

Parrot::Configure::Step.

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

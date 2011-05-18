# Copyright (C) 2008, Parrot Foundation.


=head1 NAME

config/auto/opengl.pm - Probe for OpenGL, GLU, and GLUT libraries


=head1 DESCRIPTION

Determines whether the platform supports OpenGL, GLU and GLUT.  The optimal
result at this time is to find OpenGL 3.2, GLU 1.3, and GLUT API version 4.

You will typically need to install the headers and libraries required for
compiling OpenGL/GLU/GLUT applications as a separate step in addition to
the base development tools for your platform.  The following sections detail
the steps needed to add OpenGL support for each platform for which we have
received this information -- details for additional platforms are welcome!

=head2 Mac OS X

You will need to install the F<OpenGL Framework> and the F<GLUT Framework>.
With these in place, everything else should be autodetected.  Mac OS X uses
a proprietary GLUT variant that supports more functions than standard
GLUT 3.7, but fewer than F<freeglut>.


=head2 Linux

Linux distributions typically use F<freeglut>
(L<http://freeglut.sourceforge.net/>) for GLUT support, and F<Mesa>
(L<http://www.mesa3d.org/>) for GLU support.  Either the Mesa headers
(for open source drivers) or the vendor headers (for closed source drivers)
can be used for core OpenGL/GLX support.  Here are the package names for
various distributions; installing each of these will typically pull in a
number of prerequisites as well:


=head3 Debian/Ubuntu/etc.

=over 4

=item GLUT

F<freeglut3-dev>

=item GLU

F<libglu1-mesa-dev>

=item OpenGL/GLX (open source drivers)

F<libgl1-mesa-dev>

=item OpenGL/GLX (NVIDIA drivers)

F<nvidia-glx-dev>

=back


=head3 Fedora/RedHat/CentOS/etc.

=over 4

=item GLUT

F<freeglut-devel>

=item GLU

F<mesa-libGLU-devel>

=item OpenGL/GLX (open source drivers)

F<mesa-libGL-devel>

=item OpenGL/GLX (NVIDIA drivers)

F<nvidia-devel> (?)

=back


=head2 Windows

On Windows, Parrot supports four different compiler environments, each of
which has different requirements for OpenGL support.  Generally you should not
attempt to mix the Cygwin variants (installing some X OpenGL libs and some
w32api OpenGL libs) as this will almost certainly result in runtime errors
like this one:

    freeglut ERROR: Function <glutDisplayFunc> called without first calling 'glutInit'.


=head3 MSVC

=over 4

=item OpenGL/GLU/WGL

F<Windows SDK for Windows Server 2008 and .NET Framework 3.5>

=item GLUT

F<GLUT for Win32> (L<http://www.xmission.com/~nate/glut.html>)

=back


=head3 MinGW

GLUT 3.7.6,
see L<http://www.transmissionzero.co.uk/computing/using-glut-with-mingw/>.


=head3 Cygwin/X

Requires an X server and F<libglut-devel>, F<libGL-devel>, F<libGLU-devel>,
F<freeglut> and its dependencies.

This is tried first.


=head3 Cygwin/w32api

Requires the F<opengl> and F<w32api> packages.

Cygwin/w32api for native opengl support is only tried if
F</usr/include/GL> does not exist.  The problem is that the OpenGL header files
are used to create the OpenGL function list, and not the libraries themselves.
If the F</usr/include/GL> headers are found these are used, even if the w32api
GLUT libraries are defined.


=cut


package auto::opengl;

use strict;
use warnings;
use File::Spec;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Does your platform support OpenGL};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $without = $conf->options->get( qw| without-opengl | );

    return $self->_handle_no_opengl($conf) if $without;

    # opengl depends on thunks which depend on pcre
    return $self->_handle_no_opengl($conf) unless $conf->data->get('HAS_PCRE');

    my $osname = $conf->data->get('osname');

    my $extra_libs = $self->_select_lib( {
            conf            => $conf,
            osname          => $osname,
            cc              => $conf->data->get('cc'),
            ($^O eq 'cygwin') ?  # Cygwin/X is used when /usr/include/GL is found
             (-d '/usr/include/GL'
                ? (cygwin => '-lglut -L/usr/X11R6/lib -lGLU -lGL')
                : (cygwin => '-lglut32 -lglu32 -lopengl32'))
             : (),
            win32_gcc       => '-lglut32 -lglu32 -lopengl32',
            win32_nongcc    => 'opengl32.lib glu32.lib glut32.lib',
            darwin          => '-framework OpenGL -framework GLUT',
            default         => '-lglut -lGLU -lGL',
    } );

    $conf->cc_gen('config/auto/opengl/opengl_c.in');
    my $has_glut = 0;
    eval { $conf->cc_build( q{}, $extra_libs ) };
    if ( $@ ) {
        return $self->_handle_no_opengl($conf);
    }
    else {
        my $test = $conf->cc_run();
        return _handle_glut($conf, $extra_libs, $self->_evaluate_cc_run($conf, $test));
    }
}

sub _evaluate_cc_run {
    my ($self, $conf, $test) = @_;
    my ($glut_api_version, $glut_brand) = split ' ', $test;

    $conf->debug(" (yes, $glut_brand API version $glut_api_version) ");
    $self->set_result("yes, $glut_brand $glut_api_version");

    return ($glut_api_version, $glut_brand);
}

sub _handle_glut {
    my ($conf, $libs, $glut_api_version, $glut_brand) = @_;

    $conf->data->set(
        # Completely cargo culted
        opengl     => 'define',
        has_opengl => 1,
        HAS_OPENGL => 1,
        opengl_lib => $libs,

        glut       => 'define',
        glut_brand => $glut_brand,
        has_glut   => $glut_api_version,
        HAS_GLUT   => $glut_api_version,
    );

    return 1;
}

sub _handle_no_opengl {
    my ($self, $conf) = @_;

    $conf->data->set(
        has_opengl => 0,
        HAS_OPENGL => 0,
        opengl_lib => '',

        has_glut   => 0,
        HAS_GLUT   => 0,
    );

    $self->set_result('no');

    return 1;
}


1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

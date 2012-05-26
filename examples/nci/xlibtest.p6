# Copyright (C) 2008-2009, Parrot Foundation.

use v6;

=pod

=head1 NAME

xlibtest.p6 - A test of Xlib.pir usage from rakudo

=head1 DESCRIPTION

This program is a test of Xlib.pir usage from rakudo.

=head1 SYNOPSYS

To run this file, execute the following command from the
current directory:

../../perl6  xlibtest.p6

(You must have the perl6 executable already builded).

Press Esc key to exit the program.

=cut

use Xlib:from<parrot>;

# Event types
constant KeyPress      =  2;
constant ButtonPress   =  4;
constant ButtonRelease =  5;
constant MotionNotify  =  6;
constant Expose        = 12;
constant DestroyNotify = 17;
constant ClientMessage = 33;

say 'Hello';

say 'Display: ', Xlib::DisplayName();

my $display = Xlib::OpenDisplay('');

say 'Default screen: ', $display.DefaultScreen();

$display.hello();

my $white  = $display.WhitePixel(0);
my $root   = $display.RootWindow();
my $window = $display.CreateSimpleWindow($root, 0, 0, 600, 400, 0, 0, $white);
$window.StoreName("Hello, perl6");
$window.SelectInput(163919);
$window.Map();

# Get Escape keycode
my $keysym = Xlib::StringToKeysym('Escape');
my $code_escape = $display.KeysymToKeycode($keysym);

my $event = Xlib::newEvent();

my $type = 0;

my $lastx = 0;
my $lasty = 0;
my $pressed = 0;
my @listline;
my @line;

while $type != DestroyNotify {
    $display.NextEvent($event);
    $type = $event.type();
    given $type {
        when ButtonPress {
            my $x = $event.x();
            my $y = $event.y();
            $window.DrawPoint($x, $y);
            $lastx = $x;
            $lasty = $y;
            $pressed = 1;
        }
        when ButtonRelease {
            my @newline = @line;
            @listline.push(\@newline);
            @line = ();
            $pressed = 0;
        }
        when MotionNotify {
            if $pressed {
                my $x = $event.x();
                my $y = $event.y();
                if $x != $lastx || $y != $lasty {
                    $window.DrawLine($lastx, $lasty, $x, $y);
                    $lastx = $x;
                    $lasty = $y;
                    @line.push($x, $y);
                }
            }
        }
        when Expose {
            #say 'Exposed. Lines: ', +@listline;
            for @listline -> $l {
                #say 'Points ', $l.elems;
                if $l.elems  > 0 {
                    my $lx = $l[0];
                    my $ly = $l[1]; 
                    #say $lx, ' ', $ly;
                    $window.DrawPoint($lx, $ly);

                    loop (my $i = 2; $i < $l.elems ; $i += 2) {
                        my $x = $l[$i];
                        my $y = $l[$i+1];
                        $window.DrawLine($lx, $ly, $x, $y);
                        $lx = $x;
                        $ly = $y;
                        #say $lx, ' ', $ly;
                    }
                }
            }
        }
        when KeyPress {
            my $code = $event.keycode();
            if ($code == $code_escape) {
                $window.Unmap();
                $window.Destroy();
            }
        }
        when ClientMessage {
            $window.Unmap();
            $window.Destroy();
        }
    }
}

$display.Close();

say 'Bye';

#-----------------------------------------------------------------------
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:

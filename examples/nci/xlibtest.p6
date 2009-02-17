# Copyright (C) 2008, Parrot Foundation.
# $Id$

use v6;

=begin pod

=head1 TITLE

xlibtest.p6 - A test of Xlib.pir usage from rakudo

=head1 SYNOPSYS

To run this file, execute the following command from the
current directory:

../../perl6  xlibtest.p6

(You must have the perl6 executable already builded).

Press Esc key to exit the program.

=end pod

use Xlib;

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

while ($type != 17) {
    $display.NextEvent($event);
    $type = $event.type();
    if ($type == 4) {
        my $x = $event.x();
        my $y = $event.y();
        $window.DrawPoint($x, $y);
        $lastx = $x;
        $lasty = $y;
        $pressed = 1;
    }
    if ($type == 5) {
        my @newline = @line;
        @listline.push(\@newline);
        @line = ();
        $pressed = 0;
    }
    if ($type == 6 && $pressed) {
        my $x = $event.x();
        my $y = $event.y();
        if (($x != $lastx) || ($y != $lasty)) {
            $window.DrawLine($lastx, $lasty, $x, $y);
            $lastx = $x;
            $lasty = $y;
            @line.push($x, $y);
        }
    }
    if ($type == 12) {
        #say 'Exposed. Lines: ', +@listline;
        for @listline -> $l {
            #say 'Points ', $l.elems;
            if ($l.elems  > 0) {
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
    if ($type == 2) {
        my $code = $event.keycode();
        if ($code == $code_escape) {
            $window.Unmap();
            $window.Destroy();
        }
    }
    if ($type == 33) {
        $window.Unmap();
        $window.Destroy();
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

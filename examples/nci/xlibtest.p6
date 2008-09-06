# Copyright (C) 2008, The Perl Foundation.
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

Press any key to exit the program.

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
$window.SelectInput(32847);
$window.Map();

my $event = Xlib::newEvent();

my $type = 0;

my $x = 0;
my $y = 0;
my $lastx = 0;
my $lasty = 0;
my $lx;
my $ly;
my $pressed = 0;
my $m;
my @listline;
my @line;

while ($type != 2) {
    $display.NextEvent($event);
    $type = $event.type();
    if ($type == 4) {
        $x = $event.x();
        $y = $event.y();
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
        $x = $event.x();
        $y = $event.y();
        $window.DrawLine($lastx, $lasty, $x, $y);
        $lastx = $x;
        $lasty = $y;
        {
        my $x1 = $x; my $y1 = $y;
        @line.push($x1);
        @line.push($y1);
        }
    }
    if ($type == 12) {
        $m = +@listline;
        say 'Lines: ', +@listline;
        for @listline -> $l {
            say 'Exposed ', $l.elems;
            if ($l.elems  > 0) {
                $lx = $l[0];
                $ly = $l[1]; 
                say $lx, ' ', $ly;
                $window.DrawPoint($lx, $ly);

                loop (my $i = 2; $i < $l.elems ; $i += 2) {
                    $x = $l[$i];
                    $y = $l[$i+1]; 
                    $window.DrawLine($lx, $ly, $x, $y);
                    $lx = $x;
                    $ly = $y;
                    say $lx, ' ', $ly;
                }
            }
        }
    }
}

say 'Bye';

#-----------------------------------------------------------------------
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=perl6:

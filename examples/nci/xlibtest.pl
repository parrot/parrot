# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 TITLE

xlibtest.pl - A test of Xlib.pir usage from nqp

=head1 SYNOPSYS

To run this file, execute the following command from the
current directory:

../../parrot ../../compilers/nqp/nqp.pbc xlibtest.pl

Press any key to exit.

=cut

PIR q< load_bytecode 'Xlib.pbc' >;

my $a := Xlib::DisplayName();
say("Display: ", Xlib::DisplayName());

my $display := Xlib::OpenDisplay('');

say("Default screen: ", $display.DefaultScreen());

$display.hello();

my $white := $display.WhitePixel(0);
my $root := $display.RootWindow();
my $window := $display.CreateSimpleWindow($root, 0, 0, 600, 400, 0, 0, $white);
$window.StoreName("Hello, nqp");
$window.SelectInput(79);
$window.Map();

my $event := Xlib::newEvent();

my $type := 0;

my $x := 0;
my $y := 0;
my $lastx := 0;
my $lasty := 0;
my $pressed := 0;

while ($type != 2) {
    $display.NextEvent($event);
    $type := $event.type();
    if ($type == 4) {
        $x := $event.x();
        $y := $event.y();
        $window.DrawPoint($x, $y);
	$lastx := $x;
	$lasty := $y;
	$pressed := 1;
    }
    if ($type == 5) {
        $pressed := 0;
    }
    if ($type == 6 && $pressed) {
        $x := $event.x();
        $y := $event.y();
        $window.DrawLine($lastx, $lasty, $x, $y);
	$lastx := $x;
	$lasty := $y;
    }
}

say("Bye");

$window.Unmap();

#-----------------------------------------------------------------------
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

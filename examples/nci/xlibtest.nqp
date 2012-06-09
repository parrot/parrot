# Copyright (C) 2008, Parrot Foundation.

=head1 NAME

xlibtest.pl - A test of Xlib.pir usage from nqp

=head1 SYNOPSIS

Compile Xlib.pir to Xlib.pbc before usage:

    ../../parrot -o Xlib.pbc Xlib.pir

To run this file, execute the following command from the
current directory:

    ../../parrot ../../compilers/nqp/nqp.pbc xlibtest.nqp

Press any key to exit.

=head1 DESCRIPTION

This is an initial version, be careful and not expect too much.

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
$window.SelectInput(163919);
$window.Map();

my $event := Xlib::newEvent();

my $type := 0;

my $x := 0;
my $y := 0;
my $lastx := 0;
my $lasty := 0;
my $pressed := 0;

my @points;
my @lines;

while ($type != 17) {
    $display.NextEvent($event);
    $type := $event.type();
    if ($type == 4) {
        $x := $event.x();
        $y := $event.y();
        $window.DrawPoint($x, $y);
        @points.push($x);
        @points.push($y);
    $lastx := $x;
    $lasty := $y;
    $pressed := 1;
    }
    if ($type == 5) {
        $pressed := 0;
    }
    elsif ($type == 6 && $pressed) {
        $x := $event.x();
        $y := $event.y();
        $window.DrawLine($lastx, $lasty, $x, $y);
        @lines.push($lastx);
        @lines.push($lasty);
        @lines.push($x);
        @lines.push($y);
        $lastx := $x;
        $lasty := $y;
    }
    elsif ($type == 2) {
        $window.Unmap();
        $window.Destroy();
    }
    elsif ($type == 33) {
        $window.Unmap();
        $window.Destroy();
    }
    elsif $type == 12 {
        say("Redrawing...");
        my $i := 0;
        while ($i < @points) {
            $window.DrawPoint(@points[$i], @points[$i+1]);
            $i :=  $i + 2;
        }
        $i := 0;
        while ($i < @lines) {
            $window.DrawLine(@lines[$i], @lines[$i+1],
                             @lines[$i+2], @lines[$i+3]);
            $i := $i + 4;
        }
    }
}

$display.Close();

say("Bye");


# vim: expandtab shiftwidth=4 ft=perl6:

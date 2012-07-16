# Copyright (C) 2008, Parrot Foundation.

=head1 NAME

xlibconstants.pir - Test NCI with libX11

=head1 DESCRIPTION

Constants for xlib.pir

=cut

# event masks

.const int KeyPressMask = 1
.const int KeyReleaseMask = 2
.const int ButtonPressMask = 4
.const int ButtonReleaseMask = 8
.const int EnterWindowMask = 16
.const int LeaveWindowMask = 32
.const int PointerMotionMask = 64
.const int StructureNotifyMask = 131072
.const int ExposureMask = 32768

# event types
.const int KeyPress = 2
.const int KeyRelease = 3
.const int ButtonPress = 4
.const int ButtonRelease = 5
.const int MotionNotify = 6
.const int Expose = 12
.const int DestroyNotify = 17
.const int ClientMessage = 33

#-----------------------------------------------------------------------
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

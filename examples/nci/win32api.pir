# Copyright (C) 2001-2008, Parrot Foundation.

=head1 NAME

examples/nci/win32api.pir - Win32 Example

=head1 SYNOPSIS

    % ./parrot examples/nci/win32api.pir

=head1 DESCRIPTION

This example calls the MessageBoxA Win32 API using the Parrot Native
Call Interface.  The function is defined as:-

    int MessageBox(
        HWND hWnd,
        LPCTSTR lpText,
        LPCTSTR lpCaption,
        UINT uType
    );

=cut

# This is the entry point.
.sub _MAIN
    # Load user32.dll library and the MessageBoxA API.
    .local pmc libuser32
    .local pmc MessageBoxA
    loadlib libuser32, "user32"
    dlfunc MessageBoxA, libuser32, "MessageBoxA", "llttl"

    # Set up parameters for the message box.
    .local int phWnd
    .local string message
    .local string caption
    .local int style
    phWnd = 0   # Parent window handle - we have none.
    message = "This is a message from Parrot!"
    caption = "Hey, you!"
    style = 64  # This gives us a nice i in a speech bubble icon.

    # Invoke MessageBoxA.
    .local int retVal
    retVal = MessageBoxA(phWnd, message, caption, style)

    # That's all, folks.
    end
.end

=head1 SEE ALSO

F<docs/pdds/pdd03_calling_conventions.pod>.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

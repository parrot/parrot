# Copyright (C) 2005-2011, Parrot Foundation.

=head1 NAME

examples/nci/ls.pir - a directory lister

=head1 DESCRIPTION

List the content of the directory 'docs'.

This program uses the 'dirent' structure, whose content is not fully
standarized, thus may need modifications depending on platform.

In this encarnation it works on linux i386 and amd64 systems.

=cut

.sub _main :main
     .local pmc libc
     .local pmc opendir
     .local pmc readdir
     .local pmc closedir
     libc = loadlib 'libc'
     dlfunc opendir, libc, 'opendir', 'pp'
     dlfunc readdir, libc, 'readdir', 'pp'
     dlfunc closedir, libc, 'closedir', 'ip'

     .const string dirname = "docs"
     .local pmc dirname_c
     # Convert the directory name string to a C string.
     dirname_c = new ["ByteBuffer"]
     dirname_c = dirname
     push dirname_c, 0

     .local pmc curdir
     curdir = opendir(dirname_c)
     unless null curdir goto opened

     .local pmc err
     getstderr err
     print err, "Cannot open directory '"
     print err, dirname
     print err, "'\n"
     exit 1

opened:
     .local pmc entry

     .include "datatypes.pasm"
     new $P2, 'OrderedHash'
     set $P2["d_fileno"], .DATATYPE_LONG
     push $P2, 0
     push $P2, 0
     set $P2["d_off"], .DATATYPE_LONG
     push $P2, 0
     push $P2, 0
     set $P2["d_reclen"], .DATATYPE_SHORT
     push $P2, 0
     push $P2, 0
     set $P2["d_type"], .DATATYPE_CHAR
     push $P2, 0
     push $P2, 0
     set $P2["d_name"], .DATATYPE_CHAR
     push $P2, 256
     push $P2, 0           # 11
lp_dir:
     entry = readdir(curdir)
     $I0 = defined entry
     unless $I0 goto done
     assign entry, $P2

    $I1 = 0
loop:
     $I0 = entry["d_name";$I1]
     unless $I0 goto ex
     chr $S0, $I0
     print $S0
     inc $I1
     goto loop
 ex:
     print "\n"
     goto lp_dir
done:
     closedir(curdir)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

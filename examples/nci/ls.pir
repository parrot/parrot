# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

examples/nci/ls.pir - a directory lister

=head1 DESCRIPTION

List the content of the directory 'docs'.

=cut

.sub _main :main
     .local pmc libc
     .local pmc opendir
     .local pmc readdir
     .local pmc closedir
     libc = loadlib 'libc'
     dlfunc opendir, libc, 'opendir', 'pt'
     dlfunc readdir, libc, 'readdir', 'pp'
     dlfunc closedir, libc, 'closedir', 'ip'
     .local pmc curdir
     curdir = opendir("docs")
     .local pmc entry

     .include "datatypes.pasm"
     new $P2, 'OrderedHash'
     set $P2["d_fileno"], .DATATYPE_INT64
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
     $I0 = get_addr entry
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

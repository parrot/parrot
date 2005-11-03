# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

examples/pni/ls.pir - a directory lister

=head1 DESCRIPTION

List the content of the directory 'charset'.

=cut

.sub _main @MAIN
     .local pmc libc
     .local pmc opendir
     .local pmc readdir
     .local pmc closedir
     null libc
     dlfunc opendir, libc, 'opendir', 'pt'
     dlfunc readdir, libc, 'readdir', 'pp'
     dlfunc closedir, libc, 'closedir', 'ip'
     store_global 'libc::opendir', opendir
     store_global 'libc::readdir', readdir
     store_global 'libc::closedir', closedir
     .local pmc curdir
     curdir = libc::opendir("charset")
     .local OrderedHash entry

     .include "datatypes.pasm"
     new $P2, .OrderedHash
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
     entry = libc::readdir(curdir)
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
     libc::closedir(curdir)
.end

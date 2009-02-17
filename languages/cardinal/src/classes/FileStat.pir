# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$

=head1 TITLE

FileStat - Cardinal File Stat class

=head1 DESCRIPTION

=head2 Functions

=over

=item onload()

Perform initializations and create the File Stat class

=cut

.namespace ['FileStat']
#constants for the stat op code, not to be confused w/ the OS.stat method
.include 'stat.pasm'

.sub 'onload' :anon :init :load
    .local pmc cardinalmeta
    $P0 = get_hll_global ['CardinalObject'], '!CARDINALMETA'
    cardinalmeta = $P0.'new_class'('FileStat', 'parent'=>'CardinalObject', 'attr'=>'!path')
    #$P0.'register'('File', 'parent'=>'CardinalObject', 'protoobject'=>cardinalmeta)
.end

.sub 'get_bool' :vtable
    .return (1)
.end

.sub 'ACCEPTS' :method
    .param pmc topic
    .local int i

    .local string what
    what = topic.'WHAT'()
    if what == "FileStat" goto match
    goto no_match
    no_match:
        $P0 = get_hll_global ['Bool'], 'False'
        .return($P0)
    match:
        $P0 = get_hll_global ['Bool'], 'True'
        .return($P0)
.end

.sub 'get_string' :vtable
   $S0 = 'FileStat'
   .return ($S0)
.end

.sub 'initialize' :method
        .param pmc path
        setattribute self, '!path', path
.end

.sub 'class' :method
        $P0 = new 'CardinalString'
        $S0 = "File::Stat"
        $P0.'concat'($S0)
        .return ($P0)
.end

.sub 'path' :method
        .local pmc path
        path = new 'CardinalString'
        getattribute path, self, '!path'
        .return (path)
.end

.sub 'directory?' :method
        .local pmc dir
        .local pmc path
        path = self.'path'()
        $S0 = path
        $I0 = 2
        $I1 = stat $S0, $I0
        if $I1 == 1 goto yes
        goto no
        yes:
            $P0 = get_hll_global ['Bool'], 'True'
            .return ($P0)
        no:
            $P0 = get_hll_global ['Bool'], 'False'
            .return ($P0)
.end

.sub 'file?' :method
        .local pmc dir
        .local pmc path
        path = self.'path'()
        $S0 = path
        $I0 = 3
        $I1 = stat $S0, $I0
        if $I1 == 1 goto no
        goto yes
        yes:
            $P0 = get_hll_global ['Bool'], 'True'
            .return ($P0)
        no:
            $P0 = get_hll_global ['Bool'], 'False'
            .return ($P0)
.end

.sub 'dev' :method
        .local pmc dev
        .local pmc os
        .local pmc path
        path = self.'path'()
        os = new 'OS'
        $P0 = os.'stat'(path)
        $I0 = $P0[0]
        dev = new 'CardinalInteger'
        dev = $I0
        .return (dev)
.end

.sub 'ino' :method
        .local pmc mode
        .local pmc os
        .local pmc path
        path = self.'path'()
        os = new 'OS'
        $P0 = os.'stat'(path)
        $I0 = $P0[1]
        mode = new 'CardinalInteger'
        mode = $I0
        .return (mode)
.end

.sub 'mode' :method
        .local pmc mode
        .local pmc os
        .local pmc path
        path = self.'path'()
        os = new 'OS'
        $P0 = os.'stat'(path)
        $I0 = $P0[2]
        mode = new 'CardinalInteger'
        mode = $I0
        .return (mode)
.end

.sub 'nlink' :method
        .local pmc links
        .local pmc os
        .local pmc path
        path = self.'path'()
        os = new 'OS'
        $P0 = os.'stat'(path)
        $I0 = $P0[3]
        links = new 'CardinalInteger'
        links = $I0
        .return (links)
.end

.sub 'uid' :method
        .local pmc gid
        .local pmc os
        .local pmc path
        path = self.'path'()
        os = new 'OS'
        $P0 = os.'stat'(path)
        $I0 = $P0[4]
        gid = new 'CardinalInteger'
        gid = $I0
        .return (gid)
.end

.sub 'gid' :method
        .local pmc gid
        .local pmc os
        .local pmc path
        path = self.'path'()
        os = new 'OS'
        $P0 = os.'stat'(path)
        $I0 = $P0[5]
        gid = new 'CardinalInteger'
        gid = $I0
        .return (gid)
.end

.sub 'rdev' :method
        .local pmc rdev
        .local pmc os
        .local pmc path
        path = self.'path'()
        os = new 'OS'
        $P0 = os.'stat'(path)
        $I0 = $P0[6]
        rdev = new 'CardinalInteger'
        rdev = $I0
        .return (rdev)
.end

.sub 'size?' :method
        .local pmc mode
        .local pmc os
        .local pmc path
        path = self.'path'()
        os = new 'OS'
        $P0 = os.'stat'(path)
        $I0 = $P0[7]
        mode = new 'CardinalInteger'
        mode = $I0
        .return (mode)
.end

.sub 'size' :method
        $P0 = self.'size?'()
        .return ($P0)
.end

.sub 'executable?' :method
        $P0 = self.'mode'()
        .return ($P0)
.end

.sub 'atime' :method
        .local pmc atime
        .local pmc os
        .local pmc path
        path = self.'path'()
        os = new 'OS'
        $P0 = os.'stat'(path)
        #$I0 = $P0[.STAT_ACCESSTIME] Wrong stat constants, there doesnt seem to be any OS stat consts
        $I0 = $P0[8]
        atime = new 'Time'
        atime.'initialize'($I0)
        .return (atime)
.end

.sub 'mtime' :method
        .local pmc mtime
        .local pmc os
        .local pmc path
        path = self.'path'()
        os = new 'OS'
        $P0 = os.'stat'(path)
        $I0 = $P0[9]
        mtime = new 'Time'
        mtime.'initialize'($I0)
        .return (mtime)
.end

.sub 'ctime' :method
        .local pmc ctime
        .local pmc os
        .local pmc path
        path = self.'path'()
        os = new 'OS'
        $P0 = os.'stat'(path)
        $I0 = $P0[10]
        ctime = new 'Time'
        ctime.'initialize'($I0)
        .return (ctime)
.end

.sub 'blksize' :method
        .local pmc blksize
        .local pmc os
        .local pmc path
        path = self.'path'()
        os = new 'OS'
        $P0 = os.'stat'(path)
        $I0 = $P0[11]
        blksize = new 'CardinalInteger'
        blksize = $I0
        .return (blksize)
.end

.sub 'blocks' :method
        .local pmc size
        .local pmc os
        .local pmc path
        path = self.'path'()
        os = new 'OS'
        $P0 = os.'stat'(path)
        $I0 = $P0[12]
        size = new 'CardinalInteger'
        size = $I0
        .return (size)
.end
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

Archive/Zip

=head2 DESCRIPTION

Partial port of Archive::Zip (version 1.30)

See L<http://search.cpan.org/~adamk/Archive-Zip/>

=cut

.loadlib 'sys_ops'
.loadlib 'io_ops'
.include 'stat.pasm'
.include 'tm.pasm'

=head3 Class Archive;Zip;Base

=cut

.namespace ['Archive';'Zip';'Base']

.sub '' :init :load :anon
    $P0 = loadlib 'gziphandle'
    $P0 = newclass ['Archive';'Zip';'Base']
    .globalconst int AZ_OK = 0
    .globalconst int AZ_STREAM_END = 1
    .globalconst int AZ_ERROR = 2
    .globalconst int AZ_FORMAT_ERROR = 3
    .globalconst int AZ_IO_ERROR = 4
    .globalconst int FA_UNIX = 3
    .globalconst int GPBF_HAS_DATA_DESCRIPTOR_MASK = 8
    .globalconst int COMPRESSION_STORED = 0
    .globalconst int COMPRESSION_DEFLATED = 8
    .globalconst int SIGNATURE_LENGTH = 4
    .globalconst int LOCAL_FILE_HEADER_LENGTH = 26
    .globalconst int DATA_DESCRIPTOR_LENGTH = 12
    .globalconst int CENTRAL_DIRECTORY_FILE_HEADER_LENGTH = 42
.end

.sub '_printError'
    .param pmc args :slurpy
    $S0 = join '', args
    $P0 = getinterp
    .include 'stdio.pasm'
    $P1 = $P0.'stdhandle'(.PIO_STDERR_FILENO)
    $P1.'print'($S0)
    $P1.'print'("\n")
.end

.sub '_ioError' :method
    .param pmc args :slurpy
    $S0 = err
    _printError('IO error:', args :flat, ':', $S0)
    .return (AZ_IO_ERROR)
.end

.sub '_error' :method
    .param pmc args :slurpy
    _printError('error:', args :flat)
    .return (AZ_ERROR)
.end

.sub 'pack_C' :method
    .param int val
    $S0 = chr val
    .return ($S0)
.end

.sub 'pack_v' :method
    .param int val
    $I0 = val & 0x000000ff
    $S0 = chr $I0
    $I0 = val >> 8
    $I0 &= 0x000000ff
    $S1 = chr $I0
    $S0 .= $S1
    .return ($S0)
.end

.sub 'pack_V' :method
    .param int val
    $I0 = val & 0x000000ff
    $S0 = chr $I0
    $I0 = val >> 8
    $I0 &= 0x000000ff
    $S1 = chr $I0
    $S0 .= $S1
    $I0 = val >> 16
    $I0 &= 0x000000ff
    $S2 = chr $I0
    $S0 .= $S2
    $I0 = val >> 24
    $I0 &= 0x000000ff
    $S3 = chr $I0
    $S0 .= $S3
    .return ($S0)
.end

=head3 Class Archive;Zip;Member

=over 4

=cut

.namespace ['Archive';'Zip';'Member']

.sub '' :init :load :anon
    $P0 = subclass ['Archive';'Zip';'Base'], ['Archive';'Zip';'Member']
    $P0.'add_attribute'('fileName')
    $P0.'add_attribute'('externalFileName')
    $P0.'add_attribute'('compressionMethod')
    $P0.'add_attribute'('compressedSize')
    $P0.'add_attribute'('uncompressedSize')
    $P0.'add_attribute'('lastModFileDateTime')
    $P0.'add_attribute'('writeCentralDirectoryOffset')
    $P0.'add_attribute'('writeLocalHeaderRelativeOffset')
    $P0.'add_attribute'('readDataRemaining')
    $P0.'add_attribute'('localExtraField')
    $P0.'add_attribute'('cdExtraField')
    $P0.'add_attribute'('fileComment')
    $P0.'add_attribute'('crc32')
    $P0.'add_attribute'('fileAttributeFormat')
    $P0.'add_attribute'('bitFlag')
    $P0.'add_attribute'('internalFileAttributes')
    $P0.'add_attribute'('externalFileAttributes')
.end

.sub 'init' :vtable :method
    $P0 = box FA_UNIX
    setattribute self, 'fileAttributeFormat', $P0
    $P0 = box 0
    setattribute self, 'bitFlag', $P0
    $P0 = box 0
    setattribute self, 'crc32', $P0
    $P0 = box 0
    setattribute self, 'internalFileAttributes', $P0
    $P0 = box 0
    setattribute self, 'externalFileAttributes', $P0
    $P0 = box ''
    setattribute self, 'cdExtraField', $P0
    $P0 = box ''
    setattribute self, 'localExtraField', $P0
    $P0 = box ''
    setattribute self, 'fileComment', $P0
.end

=item newFromFile

=cut

.sub 'newFromFile'
    .param string fileName
    .param string zipName       :optional
    $P0 = get_hll_global ['Archive';'Zip';'NewFileMember'], '_newFromFileNamed'
    .tailcall $P0(fileName, zipName)
.end


.sub 'setLastModFileDateTimeFromUnix' :method
    .param int time_t
    $I0 = self.'_unixToDosTime'(time_t)
    $P0 = box $I0
    setattribute self, 'lastModFileDateTime', $P0
.end

.sub '_unixToDosTime' :method
    .param int time_t
    .const int safe_epoch = 315576060
    unless time_t < safe_epoch goto L1
    self.'_ioError'("Unsupported date before 1980 encountered, moving to 1980")
    time_t = safe_epoch
  L1:
    $P0 = decodelocaltime time_t
    .local int dt
    dt = 0
    $I0 = $P0[.TM_SEC]
    $I0 >>= 1
    dt += $I0
    $I0 = $P0[.TM_MIN]
    $I0 <<= 5
    dt += $I0
    $I0 = $P0[.TM_HOUR]
    $I0 <<= 11
    dt += $I0
    $I0 = $P0[.TM_MDAY]
    $I0 <<= 16
    dt += $I0
    $I0 = $P0[.TM_MON]
    $I0 <<= 21
    dt += $I0
    $I0 = $P0[.TM_YEAR]
    $I0 -= 1980
    $I0 <<= 25
    dt += $I0
    .return (dt)
.end

.sub '_mapPermissionsFromUnix' :method
    .param int dummy
    .return (0)
.end

.sub 'unixFileAttributes' :method
    .param int perms
    $I0 = self.'_mapPermissionsFromUnix'(perms)
    $P0 = box $I0
    setattribute self, 'externalFileAttributes', $P0
.end

.sub '_writeOffset' :method
    $P0 = getattribute self, 'compressedSize'
    .return ($P0)
.end

.sub '_localHeaderSize' :method
    # Return the total size of my local header
    $I0 = SIGNATURE_LENGTH + LOCAL_FILE_HEADER_LENGTH
    $P0 = getattribute self, 'fileName'
    $S0 = $P0
    $I1 = length $S0
    $I0 += $I1
    $P0 = getattribute self, 'localExtraField'
    $S0 = $P0
    $I1 = length $S0
    $I0 += $I1
    .return ($I0)
.end

.sub '_centralDirectoryHeaderSize' :method
    # Return the total size of my CD header
    $I0 = SIGNATURE_LENGTH + CENTRAL_DIRECTORY_FILE_HEADER_LENGTH
    $P0 = getattribute self, 'fileName'
    $S0 = $P0
    $I1 = length $S0
    $I0 += $I1
    $P0 = getattribute self, 'cdExtraField'
    $S0 = $P0
    $I1 = length $S0
    $I0 += $I1
    $P0 = getattribute self, 'fileComment'
    $S0 = $P0
    $I1 = length $S0
    $I0 += $I1
    .return ($I0)
.end

.sub 'hasDataDescriptor' :method
    .return (0)
.end

.sub '_writeLocalFileHeader' :method
    .param pmc fh
    .const string LOCAL_FILE_HEADER_SIGNATURE = "PK\x03\x04"
    $I0 = fh.'puts'(LOCAL_FILE_HEADER_SIGNATURE)
    if $I0 goto L1
    .tailcall self.'_ioError'('writing local header signature')
  L1:
    .local string header, fileName, localExtraField
    .const string VERSION = 20
    header = self.'pack_v'(VERSION)
    $P0 = getattribute self, 'bitFlag'
    $S0 = self.'pack_v'($P0)
    header .= $S0
    $P0 = getattribute self, 'compressionMethod'
    $S0 = self.'pack_v'($P0)
    header .= $S0
    $P0 = getattribute self, 'lastModFileDateTime'
    $S0 = self.'pack_V'($P0)
    header .= $S0
    $P0 = getattribute self, 'crc32'
    $S0 = self.'pack_V'($P0)
    header .= $S0
    $P0 = getattribute self, 'compressedSize'
    $S0 = self.'pack_V'($P0)
    header .= $S0
    $P0 = getattribute self, 'uncompressedSize'
    $S0 = self.'pack_V'($P0)
    header .= $S0
    $P0 = getattribute self, 'fileName'
    fileName = $P0
    $I0 = length fileName
    $S0 = self.'pack_v'($I0)
    header .= $S0
    $P0 = getattribute self, 'localExtraField'
    localExtraField = $P0
    $I0 = length localExtraField
    $S0 = self.'pack_v'($I0)
    header .= $S0
    $I0 = fh.'puts'(header)
    if $I0 goto L2
    .tailcall self.'_ioError'('writing local header')
  L2:
    if fileName == '' goto L3
    $I0 = fh.'puts'(fileName)
    if $I0 goto L3
    .tailcall self.'_ioError'('writing local header filename')
  L3:
    if localExtraField == '' goto L4
    $I0 = fh.'puts'(localExtraField)
    if $I0 goto L4
    .tailcall self.'_ioError'('writing local extra field')
  L4:
    .return (AZ_OK)
.end

.sub '_writeCentralDirectoryFileHeader' :method
    .param pmc fh
    .const string CENTRAL_DIRECTORY_FILE_HEADER_SIGNATURE = "PK\x01\x02"
    $I0 = fh.'puts'(CENTRAL_DIRECTORY_FILE_HEADER_SIGNATURE)
    if $I0 goto L1
    .tailcall self.'_ioError'('writing central directory header signature')
  L1:
    .local string header, fileName, cdExtraField, fileComment
    .local int fileNameLength, extraFieldLength, fileCommentLength
    .const string VERSION = 20
    header = self.'pack_C'(VERSION) # versionMadeBy
    $P0 = getattribute self, 'fileAttributeFormat'
    $S0 = self.'pack_C'($P0)
    header .= $S0
    $S0 = self.'pack_v'(VERSION) # versionNeededToExtract
    header .= $S0
    $P0 = getattribute self, 'bitFlag'
    $S0 = self.'pack_v'($P0)
    header .= $S0
    $P0 = getattribute self, 'compressionMethod'
    $S0 = self.'pack_v'($P0)
    header .= $S0
    $P0 = getattribute self, 'lastModFileDateTime'
    $S0 = self.'pack_V'($P0)
    header .= $S0
    $P0 = getattribute self, 'crc32'
    $S0 = self.'pack_V'($P0)
    header .= $S0
    $P0 = getattribute self, 'compressedSize'
    $S0 = self.'pack_V'($P0)
    header .= $S0
    $P0 = getattribute self, 'uncompressedSize'
    $S0 = self.'pack_V'($P0)
    header .= $S0
    $P0 = getattribute self, 'fileName'
    fileName = $P0
    fileNameLength = length fileName
    $S0 = self.'pack_v'(fileNameLength)
    header .= $S0
    $P0 = getattribute self, 'cdExtraField'
    cdExtraField = $P0
    extraFieldLength = length cdExtraField
    $S0 = self.'pack_v'(extraFieldLength)
    header .= $S0
    $P0 = getattribute self, 'fileComment'
    fileComment = $P0
    fileCommentLength = length fileComment
    $S0 = self.'pack_v'(fileCommentLength)
    header .= $S0
    $S0 = self.'pack_v'(0)
    header .= $S0
    $P0 = getattribute self, 'internalFileAttributes'
    $S0 = self.'pack_v'($P0)
    header .= $S0
    $P0 = getattribute self, 'externalFileAttributes'
    $S0 = self.'pack_V'($P0)
    header .= $S0
    $P0 = getattribute self, 'writeLocalHeaderRelativeOffset'
    $S0 = self.'pack_V'($P0)
    header .= $S0
    $I0 = fh.'puts'(header)
    if $I0 goto L2
    .tailcall self.'_ioError'('writing central directory header')
  L2:
    unless fileNameLength goto L3
    $I0 = fh.'puts'(fileName)
    if $I0 goto L3
    .tailcall self.'_ioError'('writing central directory filename')
  L3:
    unless extraFieldLength goto L4
    $I0 = fh.'puts'(cdExtraField)
    if $I0 goto L4
    .tailcall self.'_ioError'('writing central directory extra field')
  L4:
    unless fileCommentLength goto L5
    $I0 = fh.'puts'(fileComment)
    if $I0 goto L5
    .tailcall self.'_ioError'('writing central directory file comment')
  L5:
    .return (AZ_OK)
.end

.sub '_refreshLocalFileHeader' :method
    .param pmc fh
    .local int here
    here = fh.'tell'()
    $P0 = getattribute self, 'writeLocalHeaderRelativeOffset'
    $I0 = $P0
    $I0 += SIGNATURE_LENGTH
    fh.'seek'($I0, 0)
    .local string header, fileName, localExtraField
    .const string VERSION = 20
    header = self.'pack_v'(VERSION)
    $P0 = getattribute self, 'bitFlag'
    $S0 = self.'pack_v'($P0)
    header .= $S0
    $P0 = getattribute self, 'compressionMethod'
    $S0 = self.'pack_v'($P0)
    header .= $S0
    $P0 = getattribute self, 'lastModFileDateTime'
    $S0 = self.'pack_V'($P0)
    header .= $S0
    $P0 = getattribute self, 'crc32'
    $S0 = self.'pack_V'($P0)
    header .= $S0
    $P0 = getattribute self, 'compressedSize'
    $S0 = self.'pack_V'($P0)
    header .= $S0
    $P0 = getattribute self, 'uncompressedSize'
    $S0 = self.'pack_V'($P0)
    header .= $S0
    $P0 = getattribute self, 'fileName'
    fileName = $P0
    $I0 = length fileName
    $S0 = self.'pack_v'($I0)
    header .= $S0
    $P0 = getattribute self, 'localExtraField'
    localExtraField = $P0
    $I0 = length localExtraField
    $S0 = self.'pack_v'($I0)
    header .= $S0
    $I0 = fh.'puts'(header)
    if $I0 goto L2
    .tailcall self.'_ioError'('re-writing local header')
  L2:
    fh.'seek'(here, 0)
    .return (AZ_OK)
.end

.sub 'readChunk' :method
    .param int chunkSize        :optional
    .param int has_chunkSize    :opt_flag
    if has_chunkSize goto L1
    chunkSize = 32768
  L1:
    $I0 = self.'readIsDone'()
    unless $I0 goto L2
    self.'endRead'()
    .return ('', AZ_STREAM_END)
  L2:
    ($S0, $I0) = self.'_readRawChunk'(chunkSize)
    if $I0 == AZ_OK goto L3
    .return ('', $I0)
  L3:
    $P0 = getattribute self, 'readDataRemaining'
    $I0 = length $S0
    $P0 -= $I0
    $P0 = new 'GzipHandle'
    $P1 = getattribute self, 'crc32'
    $I1 = $P1
    $I1 = $P0.'crc32'($I1, $S0)
    set $P1, $I1
    $S1 = $P0.'compress'($S0)
    .return ($S1, AZ_OK)
.end

.sub 'rewindData' :method :nsentry
    $P0 = getattribute self, 'uncompressedSize'
    $P0 = clone $P0
    setattribute self, 'readDataRemaining', $P0
    .return (AZ_OK)
.end

.sub 'endRead' :method :nsentry
    $P0 = box 0
    setattribute self, 'readDataRemaining', $P0
    .return (AZ_OK)
.end

.sub 'readIsDone' :method
    $P0 = getattribute self, 'readDataRemaining'
    $I0 = $P0
    $I0 = not $I0
    .return ($I0)
.end

.sub '_writeToFileHandle' :method
    .param pmc fh
    .param int fhIsSeekable
    .param int offset
    $P0 = getattribute self, 'fileName'
    if null $P0 goto L1
    $S0 = $P0
    unless $S0 == '' goto L2
  L1:
    self.'_error'("no member name given")
  L2:
    $P0 = box offset
    setattribute self, 'writeLocalHeaderRelativeOffset', $P0
    $I0 = self.'rewindData'()
    unless $I0 == AZ_OK goto L3
    $I0 = self.'_writeLocalFileHeader'(fh)
    unless $I0 == AZ_OK goto L3
    $I0 = self.'_writeData'(fh)
    unless $I0 == AZ_OK goto L3
    $I0 = self.'_refreshLocalFileHeader'(fh)
  L3:
    .return ($I0)
.end

.sub '_writeData' :method
    .param pmc writeFh
    $P0 = getattribute self, 'uncompressedSize'
    $I0 = $P0
    if $I0 goto L1
    $P0 = box 0
    setattribute self, 'compressedSize', $P0
    .return (AZ_OK)
  L1:
    .local int compressedSize
    compressedSize = 0
  L2:
    ($S0, $I0) = self.'readChunk'()
    if $I0 == AZ_STREAM_END goto L3
    if $I0 == AZ_OK goto L4
    .return ($I0)
  L4:
    writeFh.'puts'($S0)
    $I0 = length $S0
    compressedSize += $I0
    goto L2
  L3:
    $P0 = box compressedSize
    setattribute self, 'compressedSize', $P0
    .return (AZ_OK)
.end

.sub '_usesFileNamed' :method
    .param string fileName
    .return (0)
.end

=back

=head3 Class Archive;Zip;FileMember

=cut

.namespace ['Archive';'Zip';'FileMember']

.sub '' :init :load :anon
    $P0 = subclass ['Archive';'Zip';'Member'], ['Archive';'Zip';'FileMember']
    $P0.'add_attribute'('fh')
.end

.sub '_usesFileNamed' :method
    .param string fileName
    $P0 = getattribute self, 'externalFileName'
    unless null $P0 goto L1
    .return (0)
  L1:
    $S0 = $P0
    $I0 = $S0 == fileName
    .return ($I0)
.end

.sub 'fh' :method
    $P0 = getattribute self, 'fh'
    if null $P0 goto L1
    $I0 = $P0.'is_closed'()
    unless $I0 goto L2
  L1:
    $P0 = getattribute self, 'externalFileName'
    $S0 = $P0
    $P0 = new 'FileHandle'
    $P0.'open'($S0, 'rb')
    setattribute self, 'fh', $P0
  L2:
    .return ($P0)
.end

.sub 'endRead' :method
    $P0 = getattribute self, 'fh'
    $P0.'close'()
    $P0 = get_hll_global ['Archive';'Zip';'Member'], 'endRead'
    $P0(self)
.end

=head3 Class Archive;Zip;NewFileMember

=cut

.namespace ['Archive';'Zip';'NewFileMember']

.sub '' :init :load :anon
    $P0 = subclass ['Archive';'Zip';'FileMember'], ['Archive';'Zip';'NewFileMember']
.end

.sub '_readRawChunk' :method
    .param int chunkSize
    if chunkSize goto L1
    .return ('', AZ_OK)
  L1:
    $P0 = self.'fh'()
    $S0 = $P0.'read'(chunkSize)
    unless $S0 == '' goto L2
    $I0 = self.'_ioError'("reading data")
    .return ($S0, $I0)
  L2:
    .return ($S0, AZ_OK)
.end

.sub '_newFromFileNamed'
    .param string fileName
    .param string newName       :optional
    .param int has_newName      :opt_flag
    if has_newName goto L1
    newName = fileName
  L1:
    $I0 = stat fileName, .STAT_EXISTS
    unless $I0 goto L2
    $I0 = stat fileName, .STAT_ISREG
    if $I0 goto L3
  L2:
    null $P0
    .return ($P0)
  L3:
    $P0 = new ['Archive';'Zip';'NewFileMember']
    $P1 = box newName
    setattribute $P0, 'fileName', $P1
    $P1 = box fileName
    setattribute $P0, 'externalFileName', $P1
    $I0 = stat fileName, .STAT_FILESIZE
    $P1 = box $I0
    setattribute $P0, 'uncompressedSize', $P1
    $I1 = COMPRESSION_STORED
    if $I0 == 0 goto L4
    $I1 = COMPRESSION_DEFLATED
  L4:
    $P1 = box $I1
    setattribute $P0, 'compressionMethod', $P1
    $P0.'unixFileAttributes'(0o666)
    $I0 = stat fileName, .STAT_MODIFYTIME
    $P0.'setLastModFileDateTimeFromUnix'($I0)
    .return ($P0)
.end

.sub 'rewindData' :method
    $P0 = get_hll_global ['Archive';'Zip';'Member'], 'rewindData'
    $I0 = $P0(self)
    if $I0 == AZ_OK goto L1
    .return ($I0)
  L1:
    $P0 = self.'fh'()
    $P0.'seek'(0, 0)
    .return (AZ_OK)
.end

=head3 Class Archive;Zip

=over 4

=cut

.namespace ['Archive';'Zip']

.sub '' :init :load :anon
    $P0 = subclass ['Archive';'Zip';'Base'], ['Archive';'Zip']
    $P0.'add_attribute'('members')
    $P0.'add_attribute'('zipfileComment')
.end

.sub 'init' :vtable :method
    $P0 = new 'ResizablePMCArray'
    setattribute self, 'members', $P0
    $P0 = box ''
    setattribute self, 'zipfileComment', $P0
.end

=item addMember

=cut

.sub 'addMember' :method
    .param pmc member
    $P0 = getattribute self, 'members'
    push $P0, member
.end

=item addFile

=cut

.sub 'addFile' :method
    .param string fileName
    .param string newName       :optional
    $P0 = get_hll_global ['Archive';'Zip';'Member'], 'newFromFile'
    $P1 = $P0(fileName, newName)
    self.'addMember'($P1)
    .return ($P1)
.end

=item writeToFileNamed

=cut

.sub 'writeToFileNamed' :method
    .param string fileName
    $P0 = getattribute self, 'members'
    $P1 = iter $P0
  L1:
    unless $P1 goto L2
    .local pmc member
    member = shift $P1
    $I0 = member.'_usesFileNamed'(fileName)
    unless $I0 goto L1
    $S0 = member.'fileName'()
    .tailcall self.'_error'("$fileName is needed by member ", $S0, "; consider using overwrite() or overwriteAs() instead.")
  L2:
    $P0 = new 'FileHandle'
    push_eh _handler
    $P0.'open'(fileName, 'wb')
    pop_eh
    $I0 = self.'writeToFileHandle'($P0, 1)
    $P0.'close'()
    .return ($I0)
  _handler:
    .tailcall self.'_ioError'("Can't open ", fileName, " for write")
.end

=item writeToFileHandle

=cut

.sub 'writeToFileHandle' :method
    .param pmc fh
    .param int fhIsSeekable
    unless null fh goto L1
    $I0 = isa fh, 'FileHandle'
    if $I0 goto L1
    .tailcall self.'_error'('No filehandle given')
  L1:
    $I0 = fh.'is_closed'()
    unless $I0 goto L2
    .tailcall self.'_ioError'('filehandle not open')
  L2:
    .local int offset
    offset = 0
    $P0 = getattribute self, 'members'
    $P1 = iter $P0
  L3:
    unless $P1 goto L4
    .local pmc member
    member = shift $P1
    $I0 = member.'_writeToFileHandle'(fh, fhIsSeekable, offset)
    member.'endRead'()
    if $I0 == AZ_OK goto L5
    .return ($I0)
  L5:
    $I0 = member.'_localHeaderSize'()
    offset += $I0
    $I0 = member.'_writeOffset'()
    offset += $I0
    $I0 = member.'hasDataDescriptor'()
    unless $I0 goto L3
    offset += DATA_DESCRIPTOR_LENGTH
    offset += SIGNATURE_LENGTH
    goto L3
  L4:
    .tailcall self.'writeCentralDirectory'(fh, offset)
.end

.sub writeCentralDirectory :method
    .param pmc fh
    .param int CDoffset
    .local int offset
    offset = CDoffset
    $P0 = getattribute self, 'members'
    $P1 = iter $P0
  L1:
    unless $P1 goto L2
    .local pmc member
    member = shift $P1
    $I0 = member.'_writeCentralDirectoryFileHeader'(fh)
    if $I0 == AZ_OK goto L3
    .return ($I0)
  L3:
    $I0 = member.'_centralDirectoryHeaderSize'()
    offset += $I0
    goto L1
  L2:
    .tailcall self.'_writeEndOfCentralDirectory'(fh, CDoffset, offset)
.end

.sub '_writeEndOfCentralDirectory' :method
    .param pmc fh
    .param int CDoffset
    .param int EOCDoffset
    .const string END_OF_CENTRAL_DIRECTORY_SIGNATURE_STRING = "PK\x05\x06"
    $I0 = fh.'puts'(END_OF_CENTRAL_DIRECTORY_SIGNATURE_STRING)
    if $I0 goto L1
    .tailcall self.'_ioError'('writing EOCD Signature')
  L1:
    .local string zipfileComment
    $P0 = getattribute self, 'zipfileComment'
    zipfileComment = $P0
    .local int zipfileCommentLength
    zipfileCommentLength = length zipfileComment
    .local int numberOfMembers
    $P0 = getattribute self, 'members'
    numberOfMembers = elements $P0
    .local string header
    $S0 = self.'pack_v'(0)
    header = repeat $S0, 2
    $S0 = self.'pack_v'(numberOfMembers)
    header .= $S0
    header .= $S0
    $I0 = EOCDoffset - CDoffset
    $S0 = self.'pack_V'($I0)
    header .= $S0
    $S0 = self.'pack_V'(CDoffset)
    header .= $S0
    $S0 = self.'pack_v'(zipfileCommentLength)
    header .= $S0
    $I0 = fh.'puts'(header)
    if $I0 goto L2
    .tailcall self.'_ioError'('writing EOCD header')
  L2:
    unless zipfileCommentLength goto L3
    $I0 = fh.'puts'(zipfileComment)
    if $I0 goto L3
    .tailcall self.'_ioError'('writing zipfile comment')
  L3:
    .return (AZ_OK)
.end

=back

=head1 AUTHOR

Francois Perrad

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

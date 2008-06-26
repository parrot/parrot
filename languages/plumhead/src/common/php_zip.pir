# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_zip.pir - PHP zip  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool ZipArchive::addFile(string filepath[, string entryname[, int start [, int length]]])>

Add a file in a Zip archive using its path and the name to use.

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::addFile'
    not_implemented()
.end

=item C<bool ZipArchive::addFromString(string name, string content)>

Add a file using content and the entry name

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::addFromString'
    not_implemented()
.end

=item C<bool ZipArchive::close()>

close the zip archive

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::close'
    not_implemented()
.end

=item C<bool ZipArchive::createEmptyDir(string dirname)>

Returns the index of the entry named filename in the archive

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::createEmptyDir'
    not_implemented()
.end

=item C<bool ZipArchive::deleteIndex(int index)>

Delete a file using its index

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::deleteIndex'
    not_implemented()
.end

=item C<bool ZipArchive::deleteName(string name)>

Delete a file using its index

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::deleteName'
    not_implemented()
.end

=item C<bool ZipArchive::extractTo(string pathto[, mixed files])>

Extract one or more file from a zip archive

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::extractTo'
    not_implemented()
.end

=item C<string ZipArchive::getArchiveComment()>

Returns the comment of an entry using its index

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::getArchiveComment'
    not_implemented()
.end

=item C<string ZipArchive::getCommentIndex(int index)>

Returns the comment of an entry using its index

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::getCommentIndex'
    not_implemented()
.end

=item C<string ZipArchive::getCommentName(string name)>

Returns the comment of an entry using its name

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::getCommentName'
    not_implemented()
.end

=item C<string ZipArchive::getFromIndex(string entryname[, int len [, int flags]])>

get the contents of an entry using its index

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::getFromIndex'
    not_implemented()
.end

=item C<string ZipArchive::getFromName(string entryname[, int len [, int flags]])>

get the contents of an entry using its name

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::getFromName'
    not_implemented()
.end

=item C<string ZipArchive::getNameIndex(int index [, int flags])>

Returns the name of the file at position index

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::getNameIndex'
    not_implemented()
.end

=item C<resource ZipArchive::getStream(string entryname)>

get a stream for an entry using its name

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::getStream'
    not_implemented()
.end

=item C<int ZipArchive::locateName(string filename[, int flags])>

Returns the index of the entry named filename in the archive

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::locateName'
    not_implemented()
.end

=item C<mixed ZipArchive::open(string source [, int flags])>

Create new zip using source uri for output, return TRUE on success or the error code

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::open'
    not_implemented()
.end

=item C<bool ZipArchive::renameIndex(int index, string new_name)>

Rename an entry selected by its index to new_name

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::renameIndex'
    not_implemented()
.end

=item C<bool ZipArchive::renameName(string name, string new_name)>

Rename an entry selected by its name to new_name

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::renameName'
    not_implemented()
.end

=item C<bool ZipArchive::setArchiveComment(string name, string comment)>

Set or remove (NULL/'') the comment of the archive

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::setArchiveComment'
    not_implemented()
.end

=item C<bool ZipArchive::setCommentIndex(int index, string comment)>

Set or remove (NULL/'') the comment of an entry using its index

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::setCommentIndex'
    not_implemented()
.end

=item C<bool ZipArchive::setCommentName(string name, string comment)>

Set or remove (NULL/'') the comment of an entry using its Name

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::setCommentName'
    not_implemented()
.end

=item C<resource ZipArchive::statIndex(int index[, int flags])>

Returns the zip entry informations using its index

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::statIndex'
    not_implemented()
.end

=item C<array ZipArchive::statName(string filename[, int flags])>

Returns the information about a the zip entry filename

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::statName'
    not_implemented()
.end

=item C<bool ZipArchive::unchangeAll()>

All changes to files and global information in archive are reverted

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::unchangeAll'
    not_implemented()
.end

=item C<bool ZipArchive::unchangeAll()>

Revert all global changes to the archive archive.  For now, this only reverts archive comment changes.

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::unchangeAll'
    not_implemented()
.end

=item C<bool ZipArchive::unchangeIndex(int index)>

Changes to the file at position index are reverted

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::unchangeIndex'
    not_implemented()
.end

=item C<bool ZipArchive::unchangeName(string name)>

Changes to the file named 'name' are reverted

NOT IMPLEMENTED.

=cut

.sub 'ZipArchive::unchangeName'
    not_implemented()
.end

=item C<void zip_close(resource zip)>

Close a Zip archive

NOT IMPLEMENTED.

=cut

.sub 'zip_close'
    not_implemented()
.end

=item C<void zip_entry_close(resource zip_ent)>

Close a zip entry

NOT IMPLEMENTED.

=cut

.sub 'zip_entry_close'
    not_implemented()
.end

=item C<int zip_entry_compressedsize(resource zip_entry)>

Return the compressed size of a ZZip entry

NOT IMPLEMENTED.

=cut

.sub 'zip_entry_compressedsize'
    not_implemented()
.end

=item C<string zip_entry_compressionmethod(resource zip_entry)>

Return a string containing the compression method used on a particular entry

NOT IMPLEMENTED.

=cut

.sub 'zip_entry_compressionmethod'
    not_implemented()
.end

=item C<int zip_entry_filesize(resource zip_entry)>

Return the actual filesize of a ZZip entry

NOT IMPLEMENTED.

=cut

.sub 'zip_entry_filesize'
    not_implemented()
.end

=item C<string zip_entry_name(resource zip_entry)>

Return the name given a ZZip entry

NOT IMPLEMENTED.

=cut

.sub 'zip_entry_name'
    not_implemented()
.end

=item C<bool zip_entry_open(resource zip_dp, resource zip_entry [, string mode])>

Open a Zip File, pointed by the resource entry

NOT IMPLEMENTED.

=cut

.sub 'zip_entry_open'
    not_implemented()
.end

=item C<mixed zip_entry_read(resource zip_entry [, int len])>

Read from an open directory entry

NOT IMPLEMENTED.

=cut

.sub 'zip_entry_read'
    not_implemented()
.end

=item C<resource zip_open(string filename)>

Create new zip using source uri for output

NOT IMPLEMENTED.

=cut

.sub 'zip_open'
    not_implemented()
.end

=item C<resource zip_read(resource zip)>

Returns the next file in the archive

NOT IMPLEMENTED.

=cut

.sub 'zip_read'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

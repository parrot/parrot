# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_imap.pir - PHP imap  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string imap_8bit(string text)>

Convert an 8-bit string to a quoted-printable string

NOT IMPLEMENTED.

=cut

.sub 'imap_8bit'
    not_implemented()
.end

=item C<array imap_alerts(void)>

Returns an array of all IMAP alerts that have been generated since the last page load or since the last imap_alerts() call, whichever came last. The alert stack is cleared after imap_alerts() is called.

NOT IMPLEMENTED.

=cut

.sub 'imap_alerts'
    not_implemented()
.end

=item C<bool imap_append(resource stream_id, string folder, string message [, string options])>

Append a new message to a specified mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_append'
    not_implemented()
.end

=item C<string imap_base64(string text)>

Decode BASE64 encoded text

NOT IMPLEMENTED.

=cut

.sub 'imap_base64'
    not_implemented()
.end

=item C<string imap_binary(string text)>

Convert an 8bit string to a base64 string

NOT IMPLEMENTED.

=cut

.sub 'imap_binary'
    not_implemented()
.end

=item C<string imap_body(resource stream_id, int msg_no [, int options])>

Read the message body

NOT IMPLEMENTED.

=cut

.sub 'imap_body'
    not_implemented()
.end

=item C<object imap_bodystruct(resource stream_id, int msg_no, string section)>

Read the structure of a specified body section of a specific message

NOT IMPLEMENTED.

=cut

.sub 'imap_bodystruct'
    not_implemented()
.end

=item C<object imap_check(resource stream_id)>

Get mailbox properties

NOT IMPLEMENTED.

=cut

.sub 'imap_check'
    not_implemented()
.end

=item C<bool imap_clearflag_full(resource stream_id, string sequence, string flag [, int options])>

Clears flags on messages

NOT IMPLEMENTED.

=cut

.sub 'imap_clearflag_full'
    not_implemented()
.end

=item C<bool imap_close(resource stream_id [, int options])>

Close an IMAP stream

NOT IMPLEMENTED.

=cut

.sub 'imap_close'
    not_implemented()
.end

=item C<bool imap_createmailbox(resource stream_id, string mailbox)>

Create a new mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_createmailbox'
    not_implemented()
.end

=item C<bool imap_delete(resource stream_id, int msg_no [, int options])>

Mark a message for deletion

NOT IMPLEMENTED.

=cut

.sub 'imap_delete'
    not_implemented()
.end

=item C<bool imap_deletemailbox(resource stream_id, string mailbox)>

Delete a mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_deletemailbox'
    not_implemented()
.end

=item C<array imap_errors(void)>

Returns an array of all IMAP errors generated since the last page load, or since the last imap_errors() call, whichever came last. The error stack is cleared after imap_errors() is called.

NOT IMPLEMENTED.

=cut

.sub 'imap_errors'
    not_implemented()
.end

=item C<bool imap_expunge(resource stream_id)>

Permanently delete all messages marked for deletion

NOT IMPLEMENTED.

=cut

.sub 'imap_expunge'
    not_implemented()
.end

=item C<array imap_fetch_overview(resource stream_id, int msg_no [, int options])>

Read an overview of the information in the headers of the given message sequence

NOT IMPLEMENTED.

=cut

.sub 'imap_fetch_overview'
    not_implemented()
.end

=item C<string imap_fetchbody(resource stream_id, int msg_no, string section [, int options])>

Get a specific body section

NOT IMPLEMENTED.

=cut

.sub 'imap_fetchbody'
    not_implemented()
.end

=item C<string imap_fetchheader(resource stream_id, int msg_no [, int options])>

Get the full unfiltered header for a message

NOT IMPLEMENTED.

=cut

.sub 'imap_fetchheader'
    not_implemented()
.end

=item C<object imap_fetchstructure(resource stream_id, int msg_no [, int options])>

Read the full structure of a message

NOT IMPLEMENTED.

=cut

.sub 'imap_fetchstructure'
    not_implemented()
.end

=item C<array imap_get_quota(resource stream_id, string qroot)>

Returns the quota set to the mailbox account qroot

NOT IMPLEMENTED.

=cut

.sub 'imap_get_quota'
    not_implemented()
.end

=item C<array imap_get_quotaroot(resource stream_id, string mbox)>

Returns the quota set to the mailbox account mbox

NOT IMPLEMENTED.

=cut

.sub 'imap_get_quotaroot'
    not_implemented()
.end

=item C<array imap_getacl(resource stream_id, string mailbox)>

Gets the ACL for a given mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_getacl'
    not_implemented()
.end

=item C<array imap_getmailboxes(resource stream_id, string ref, string pattern)>

Reads the list of mailboxes and returns a full array of objects containing name, attributes, and delimiter

NOT IMPLEMENTED.

=cut

.sub 'imap_getmailboxes'
    not_implemented()
.end

=item C<array imap_getsubscribed(resource stream_id, string ref, string pattern)>

Return a list of subscribed mailboxes, in the same format as imap_getmailboxes()

NOT IMPLEMENTED.

=cut

.sub 'imap_getsubscribed'
    not_implemented()
.end

=item C<object imap_headerinfo(resource stream_id, int msg_no [, int from_length [, int subject_length [, string default_host]]])>

Read the headers of the message

NOT IMPLEMENTED.

=cut

.sub 'imap_headerinfo'
    not_implemented()
.end

=item C<array imap_headers(resource stream_id)>

Returns headers for all messages in a mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_headers'
    not_implemented()
.end

=item C<string imap_last_error(void)>

Returns the last error that was generated by an IMAP function. The error stack is NOT cleared after this call.

NOT IMPLEMENTED.

=cut

.sub 'imap_last_error'
    not_implemented()
.end

=item C<array imap_list(resource stream_id, string ref, string pattern)>

Read the list of mailboxes

NOT IMPLEMENTED.

=cut

.sub 'imap_list'
    not_implemented()
.end

=item C<array imap_lsub(resource stream_id, string ref, string pattern)>

Return a list of subscribed mailboxes

NOT IMPLEMENTED.

=cut

.sub 'imap_lsub'
    not_implemented()
.end

=item C<bool imap_mail(string to, string subject, string message [, string additional_headers [, string cc [, string bcc [, string rpath]]]])>

Send an email message

NOT IMPLEMENTED.

=cut

.sub 'imap_mail'
    not_implemented()
.end

=item C<string imap_mail_compose(array envelope, array body)>

Create a MIME message based on given envelope and body sections

NOT IMPLEMENTED.

=cut

.sub 'imap_mail_compose'
    not_implemented()
.end

=item C<bool imap_mail_copy(resource stream_id, int msg_no, string mailbox [, int options])>

Copy specified message to a mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_mail_copy'
    not_implemented()
.end

=item C<bool imap_mail_move(resource stream_id, int msg_no, string mailbox [, int options])>

Move specified message to a mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_mail_move'
    not_implemented()
.end

=item C<object imap_mailboxmsginfo(resource stream_id)>

Returns info about the current mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_mailboxmsginfo'
    not_implemented()
.end

=item C<array imap_mime_header_decode(string str)>

Decode mime header element in accordance with RFC 2047 and return array of objects containing 'charset' encoding and decoded 'text'

NOT IMPLEMENTED.

=cut

.sub 'imap_mime_header_decode'
    not_implemented()
.end

=item C<int imap_msgno(resource stream_id, int unique_msg_id)>

Get the sequence number associated with a UID

NOT IMPLEMENTED.

=cut

.sub 'imap_msgno'
    not_implemented()
.end

=item C<int imap_num_msg(resource stream_id)>

Gives the number of messages in the current mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_num_msg'
    not_implemented()
.end

=item C<int imap_num_recent(resource stream_id)>

Gives the number of recent messages in current mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_num_recent'
    not_implemented()
.end

=item C<resource imap_open(string mailbox, string user, string password [, int options [, int n_retries]])>

Open an IMAP stream to a mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_open'
    not_implemented()
.end

=item C<bool imap_ping(resource stream_id)>

Check if the IMAP stream is still active

NOT IMPLEMENTED.

=cut

.sub 'imap_ping'
    not_implemented()
.end

=item C<string imap_qprint(string text)>

Convert a quoted-printable string to an 8-bit string

NOT IMPLEMENTED.

=cut

.sub 'imap_qprint'
    not_implemented()
.end

=item C<bool imap_renamemailbox(resource stream_id, string old_name, string new_name)>

Rename a mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_renamemailbox'
    not_implemented()
.end

=item C<bool imap_reopen(resource stream_id, string mailbox [, int options [, int n_retries]])>

Reopen an IMAP stream to a new mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_reopen'
    not_implemented()
.end

=item C<array imap_rfc822_parse_adrlist(string address_string, string default_host)>

Parses an address string

NOT IMPLEMENTED.

=cut

.sub 'imap_rfc822_parse_adrlist'
    not_implemented()
.end

=item C<object imap_rfc822_parse_headers(string headers [, string default_host])>

Parse a set of mail headers contained in a string, and return an object similar to imap_headerinfo()

NOT IMPLEMENTED.

=cut

.sub 'imap_rfc822_parse_headers'
    not_implemented()
.end

=item C<string imap_rfc822_write_address(string mailbox, string host, string personal)>

Returns a properly formatted email address given the mailbox, host, and personal info

NOT IMPLEMENTED.

=cut

.sub 'imap_rfc822_write_address'
    not_implemented()
.end

=item C<bool imap_savebody(resource stream_id, string|resource file, int msg_no[, string section = ""[, int options = 0]])>

Save a specific body section to a file

NOT IMPLEMENTED.

=cut

.sub 'imap_savebody'
    not_implemented()
.end

=item C<array imap_scan(resource stream_id, string ref, string pattern, string content)>

Read list of mailboxes containing a certain string

NOT IMPLEMENTED.

=cut

.sub 'imap_scan'
    not_implemented()
.end

=item C<array imap_search(resource stream_id, string criteria [, int options [, string charset]])>

Return a list of messages matching the given criteria

NOT IMPLEMENTED.

=cut

.sub 'imap_search'
    not_implemented()
.end

=item C<bool imap_set_quota(resource stream_id, string qroot, int mailbox_size)>

Will set the quota for qroot mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_set_quota'
    not_implemented()
.end

=item C<bool imap_setacl(resource stream_id, string mailbox, string id, string rights)>

Sets the ACL for a given mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_setacl'
    not_implemented()
.end

=item C<bool imap_setflag_full(resource stream_id, string sequence, string flag [, int options])>

Sets flags on messages

NOT IMPLEMENTED.

=cut

.sub 'imap_setflag_full'
    not_implemented()
.end

=item C<array imap_sort(resource stream_id, int criteria, int reverse [, int options [, string search_criteria [, string charset]]])>

Sort an array of message headers, optionally including only messages that meet specified criteria.

NOT IMPLEMENTED.

=cut

.sub 'imap_sort'
    not_implemented()
.end

=item C<object imap_status(resource stream_id, string mailbox, int options)>

Get status info from a mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_status'
    not_implemented()
.end

=item C<bool imap_subscribe(resource stream_id, string mailbox)>

Subscribe to a mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_subscribe'
    not_implemented()
.end

=item C<array imap_thread(resource stream_id [, int options])>

Return threaded by REFERENCES tree

NOT IMPLEMENTED.

=cut

.sub 'imap_thread'
    not_implemented()
.end

=item C<mixed imap_timeout(int timeout_type [, int timeout])>

Set or fetch imap timeout

NOT IMPLEMENTED.

=cut

.sub 'imap_timeout'
    not_implemented()
.end

=item C<int imap_uid(resource stream_id, int msg_no)>

Get the unique message id associated with a standard sequential message number

NOT IMPLEMENTED.

=cut

.sub 'imap_uid'
    not_implemented()
.end

=item C<bool imap_undelete(resource stream_id, int msg_no)>

Remove the delete flag from a message

NOT IMPLEMENTED.

=cut

.sub 'imap_undelete'
    not_implemented()
.end

=item C<bool imap_unsubscribe(resource stream_id, string mailbox)>

Unsubscribe from a mailbox

NOT IMPLEMENTED.

=cut

.sub 'imap_unsubscribe'
    not_implemented()
.end

=item C<string imap_utf7_decode(string buf)>

Decode a modified UTF-7 string

NOT IMPLEMENTED.

=cut

.sub 'imap_utf7_decode'
    not_implemented()
.end

=item C<string imap_utf7_encode(string buf)>

Encode a string in modified UTF-7

NOT IMPLEMENTED.

=cut

.sub 'imap_utf7_encode'
    not_implemented()
.end

=item C<string imap_utf8(string mime_encoded_text)>

Convert a mime-encoded text to UTF-8

NOT IMPLEMENTED.

=cut

.sub 'imap_utf8'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

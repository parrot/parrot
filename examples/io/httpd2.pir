# Copyright (C) 2006, The Perl Foundation.
# $Id: httpd.pir 14438 2006-09-06 11:59:32Z leo $

=head1 NAME

httpd2.pir - A Simple Driver for ['HTTPD'; 'Daemon']

=head1 AUTHOR

Leopold Toetsch <lt@toetsch.at> - some code base on httpd.pir.

=cut

.sub main :main
    load_bytecode "HTTP/Daemon.pir"

    .local pmc d, opts
    .local int clid
    opts = new .Hash
    opts['LocalPort'] = 1234
    opts['LocalAddr'] = 'localhost'
    clid = find_type ['HTTP'; 'Daemon']
    d = new clid, opts
    unless d goto err
    d.'run'()
    end
err:
    printerr "Starting failed\n"
.end


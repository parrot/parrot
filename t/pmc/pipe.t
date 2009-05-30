#! parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/pipe.t - test the Pipe and PipeHandle PMCs


=head1 SYNOPSIS

    % prove t/pmc/pipe.t

=head1 DESCRIPTION

Tests the Pipe and PipeHandle PMCs.  Creates some pipes, tries some basic I/O.

=cut

.sub main :main
.include 'test_more.pir'
    plan(3)
    test_new()
    test_reader_writer_methods()
#    test_reading_writing() # spawn a thread to write to the pipe, read the data
#    test_blocking_io()     # same thing, but with a delay in the middle
.end

.sub test_new
    .local pmc pipe
    .local string tmp
    pipe = new ['Pipe']
    tmp = typeof pipe
    is(tmp, 'Pipe', 'typeof(Pipe) == "Pipe"')
.end

.sub test_reader_writer_methods
    .local pmc pipe, reader, writer
    .local string tmp
    pipe = new ['Pipe']
    reader = pipe.'reader'()
    writer = pipe.'writer'()
    tmp = typeof reader
    is(tmp, 'PipeHandle', 'typeof(reader) == "PipeHandle"')
    tmp = typeof writer
    is(tmp, 'PipeHandle', 'typeof(writer) == "PipeHandle"')
.end

.sub test_reading_writing
    .local pmc pipe, reader, writer, writer_thread, writer_thread_func
    .local string teststr, readstr

    pipe = new ['Pipe']
    reader = pipe.'reader'()
    writer = pipe.'writer'()
    writer_thread_func = get_global 'test_reading_writing_writer'
    writer_thread = new ['ParrotThread']
    teststr = 'This is a test string.'
    writer_thread.'run_clone'(writer_thread_func, writer, teststr)
    readstr = reader.'read'()
    writer_thread.'join'()
    is(teststr, readstr, 'read string matches')
.end

.sub test_reading_writing_writer
    .param pmc writer
    .param string teststr
    writer.'write'(teststr)
    writer.'close'() # do this explicitly to force a write-buffer flush
    returncc         # return, killing the thread
.end

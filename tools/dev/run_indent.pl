#! perl -w
################################################################################
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$
################################################################################

=head1 NAME

tools/dev/run_indent.pl - Check indentation in C files

=head1 SYNOPSIS

    % perl tools/dev/run_indent.pl file1 [file2 ...]

=head1 DESCRIPTION

This script ensures that the specified C source files have correct
indentation.

You will need to have C<C::Scan> installed to run this. Use the CPAN
shell:

    perl -MCPAN -e shell 
    cpan> install C::Scan 
    ...

=cut

################################################################################

# the following #defined macros are really used as data types, and should
# be converted to typedefs.
my @type_macros = qw(CHARTYPE ENCODING STRING
                     Parrot_CharType Parrot_Encoding Parrot_String);

die "Usage: $0 <c source files>\n" unless @ARGV;

$|=1;
use strict;
use lib 'lib';

use Parrot::Config;
use C::Scan;
use Text::Wrap;

my @incdirs;
my $cc_inc  = $PConfig{'cc_inc'};
my $ccflags = $PConfig{'ccflags'} . " -DPARROT_IN_CORE";
while ($cc_inc  =~ s/-I(\S+)//g) { push @incdirs, $1; }
while ($ccflags =~ s/-I(\S+)//g) { push @incdirs, $1; }
my $i_flags = join ' ', map { "-I$_" } @incdirs;

my %all_errors;
foreach my $file (@ARGV) {    
    next unless ($file =~ /\.[ch]$/);
    my %bad_fdecls;
    
    print STDERR "Scanning $file.. ";
    my $c = new C::Scan 'filename' => $file,
                        'add_cppflags' => $ccflags;
    $c->set('includeDirs' => \@incdirs);
    $/="\n";  # i don't know why, but this is necessary.
    
    my $errors = 0;
    local $SIG{__WARN__} = sub { $errors++; $all_errors{"@_"}=1; };
    my $typedefs = $c->get('typedef_hash');       

    foreach (@type_macros) {
        $typedefs->{$_}="#defined";
    }
    
    
    # post-process the file to find function declarations which would not
    # have been properly formatted, unfortunately.
    my $fdecls = $c->get('fdecls');
    foreach my $fdecl (@$fdecls) {
        next unless ($fdecl =~ /\n/);
        my ($firstline,$secondline) = split /\n/, $fdecl;
        if ($firstline !~ /\(/) {
	    $bad_fdecls{$fdecl} = $secondline;
        }
    }
    
    # now a little trick.  Weed out the ones we know aren't used in this file.
    open(F, "<$file") || die "Can't read $file: $!\n";
    {
        local $/=undef;
        my $contents = <F>;
    
	foreach (keys %$typedefs) {
            delete $typedefs->{$_} unless ($contents =~ /\Q$_\E/);	    
	}
	
	foreach (keys %bad_fdecls) {
	    my ($function_maybe) = ($bad_fdecls{$_} =~ /^\s*(\S+)\(/);
	    delete $bad_fdecls{$_} unless ($contents =~ /\Q$function_maybe\E/);
        }
	
    }
    close(F);

    print STDERR "$errors parse errors.  " if ($errors);
    print STDERR "Found " . scalar(keys %$typedefs) . " typedefs.\n";
    my $cmd = "indent -kr -nce -sc -cp0 -l79 -lc79 -psl -nut -cdw -ncs -lps";
    if ($file =~ /\.h$/) {
	# for function declarations, put the return type on the same line.
        $cmd =~ s/-psl/-npsl/g;	
    }
    foreach (sort keys %$typedefs) {
        $cmd .= " -T $_";
    }
    $cmd .= " $file";
    
    print "Running \"$cmd\"\n";
    system($cmd);
    
    if (%bad_fdecls) {
        print STDERR "\nThe following function declarations appear to contain a newline\n";
        print STDERR "between the return type and the function declaration.  This is not\n";
        print STDERR "correctable by indent.  Some of these could even be in system header\n";
        print STDERR "files.  If so, ignore them.  C::Scan is imperfect.\n\n";
    
        foreach my $fdecl (sort keys %bad_fdecls) {
            $fdecl =~ s/^[\n\s]*//gm; $fdecl =~ s/[\n\s]*$//gm;
            print Text::Wrap::wrap("    ", "    ", $fdecl) . "\n\n";
        }
    }    
}   

if (%all_errors) {
#    print STDERR "The following C::Scan parse errors occurred.\nYou can generally ignore them:\n";
#    foreach (sort keys %all_errors) {
#        print STDERR;
#    }
}



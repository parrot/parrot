#! perl -w
################################################################################
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$
################################################################################

=head1 NAME

tools/dev/check_source_standards.pl - Check source code conforms to PDD 7

=head1 SYNOPSIS

    % perl tools/dev/check_source_standards.pl file1 [file2 ...]

    % perl tools/dev/check_source_standards.pl all_source

=head1 DESCRIPTION

This script checks that the C source code conforms to the standards in
PDD 7.

To run it on all the C source code files in the distribution pass in
C<all_source> instead of a list of files.

=head1 SEE ALSO

F<docs/pdds/pdd07_codingstd.pod>.

=cut

################################################################################

use Text::Wrap;
use File::Find;
use File::Basename;
use strict;

my @files = @ARGV;

if (! @files) {
    die "Usage: $0 <source files>\n" .
        "       $0 all_source\n";
}

if ($files[0] eq "all_source") {
    # do a little "find" action for now.
    @files = ();
    File::Find::find({wanted => sub {
                          if ($File::Find::dir =~ m:(languages/[^/]+|icu|examples|miniparrot)$: &&
			      $File::Find::dir !~ m:languages/imcc$:) {
                              $File::Find::prune = 1;	
			      return;
                          }
	
                          return if /malloc/;	

                          /^.*\.[ch]\z/s &&
                            push @files, $File::Find::name;
                      }}, '.');
}

FILE:
foreach my $file (@files) {
    $file =~ s/^\.\///g;
    if (!open(F, "<$file")) {
        error($file, 0, "Unable to open $file: $!\n");
        next;
    }

    my @lines = <F>;
    close(F);
    chomp @lines;

    for (@lines[0..10]) {
	if (/DO NOT EDIT/) {
	    print "Skipping $file (automatically generated)\n";
	    next FILE;
	}
    }

    check_source($file, \@lines);
}

check_manifest();

exit 0;

###############################################################################

sub check_source {
    my ($file, $source) = @_;

    print "Checking $file..\n";
    trim_whitespace($file, $source);

    # The following MUST apply.
    check_tabs($file, $source);
    check_cpp_indents($file, $source);
    check_code_indents($file, $source);
    check_function_definitions($file, $source);
    check_cuddled_else($file, $source);
    check_comments($file, $source);
    check_mandatory_boilerplate($file, $source);

    # The following SHOULD apply.
    check_line_length($file, $source);
    check_returns($file, $source);
    check_dev($file);
}

sub check_dev {
    my ($file) = @_;

    return unless ($file =~ /^[^\/]*\.c$/);

    my $dev_file = $file; $dev_file =~ s/(.*)\.c$/docs\/dev\/$1.dev/g;
    return if -f $dev_file;

    info($file, 0, ".dev file not found for $file.");
}

# ignore any leading or trailing whitespace on the file 
sub trim_whitespace {
    my ($file, $source) = @_;

    shift @$source while ($source->[0] !~ /\S/);
    pop @$source while ($source->[-1] !~ /\S/);
}


sub check_returns {
    my ($file, $source) = @_;

    my $line = 0;
    foreach (@$source) {
        $line++;
        if (/return\(/) {
            warning($file, $line, "possible use of return(foo); rather than return foo;");
        }
    }
}


sub check_line_length {
    my ($file, $source) = @_;

    my $line = 0;
    foreach (@$source) {
        $line++;

        # ignore the line if it looks like it's basically all string.
        next if /^\s*\".*\"(\);|,)?$/;

        if (length($_) > 79) {
            warning($file, $line, "line more than 79 columns. (" . length($_) . ")");
        }
    }
}

sub check_function_definitions {
    # In function definitions, the name starts in column 0, with the
    # return type on the previous line
    
    # XXX C::Scan, perhaps.
}

sub check_comments {
    my ($file, $source) = @_;

    my $line = 0;
    foreach (@$source) {
        $line++;

        if (/\/\// && ! /http:\/\//) {
            error($file, $line, "Possible C++ comment detected.");
        }

        if (/XXX/) {
            info($file, $line, "To-Do (XXX) noticed.");
        }
    }
}


sub check_cuddled_else {
    my ($file, $source) = @_;

    my $line = 0;
    foreach (@$source) {
        $line++;

        if (/\}\s*else\s*\{/) {
            error($file, $line, "Cuddled else (\"} else {\") found.");
        }
    }
}


# for now just try to catch glaring errors.  A real parser is probably
# overkill for this task.  For now we just check the first line of a function,
# and assume that more likely than not indenting is consistent within a func
# body.
sub check_code_indents {
    my ($file, $source) = @_;

    my $f = undef;
    my $line = 0;
    foreach (@$source) {
        $line++;

        if (/^(\s*).*\{\s*$/) {
            # note the beginning of a block, and its indent depth.
            $f=length($1);
            next;
        }

        if (/^\s*([\#\}])/) {
            # skip the last line of the func or cpp directives.
            $f = undef if ($1 eq "}");
            next;
        }

        if (defined($f)) {
            # first line of a block
            if ($f == 0) {
                # first line of a top-level block (first line of a function,
                # in other words)
                my ($indent) = /^(\s*)/;
                if ($indent =~ /\t/) {
                    error($file, $line, "apparent non-4 space indenting (contains tab(s))");
                } elsif (length($indent) != 4) {
                    error($file, $line, "apparent non-4 space indenting (" . length($indent) . " spaces)");
                }
            }
            $f = undef;
        }
    }
}


# tabs are bad, mmkay?
sub check_tabs {
    my ($file, $source) = @_;

    my $line = 0;
    foreach (@$source) {
        $line++;

        if (/\t/) {
            s/\t/\[TAB\]/g;
            warning($file, $line, "Tab character in source: $_\n");
        }
    }
}


sub check_cpp_indents {
    my ($file, $source) = @_;

    # check for C preprocessor directive indenting.  This is
    # comparitively easy.  Each level of the hierarchy should be
    # indented two spaces.

    # there are two exceptions.  The outermost "GUARD" ifdef doesn't increase
    # the indenting level.  Neither does PARROT_IN_CORE.

    my @stack;
    my $line = 0;
    foreach (@$source) {
        $line++;

        if (/^\s*\#(\s*)(ifndef|ifdef|if)\s+(.*)/) {
            next if (/PARROT_IN_CORE|_GUARD/);

            my $indent = "  " x (@stack);
            if ($1 ne $indent) {
                error($file, $line, "Improper indenting for \"$_\" (should be \"#$indent$2 $3\")\n");
            }
            push @stack, "#$2 $3";

            next;
        }
        if (/^\s*\#(\s*)(else|elif)/) {
            # stay where we are, but indenting should be 
            # back even with the opening brace.
            my $indent = "  " x (@stack-1);
            if ($1 ne $indent) {
                error($file, $line, "Improper indenting for \"$_\"\n(should be \"#$indent$2 $3\" because it is inside of " . (join ' > ', @stack) . ")\n")
            }
            next;
        }
        if (/^\s*\#(\s*)(endif)/) {
            my $indent = "  " x (@stack-1);
            if ($1 ne $indent) {
                error($file, $line, "Improper indenting for \"$_\"\n(should be \"#$indent$2 $3\" because it is inside of " . (join ' > ', @stack) . ")\n")
            }

            pop @stack;

            next;
        }

        next unless @stack;

        if (/^\s*\#(\s*)(.*)/) {
            my $indent = "  " x (@stack);
            if ($1 ne $indent) {
                error($file, $line, "Improper indenting for \"$_\"\n(should be \"#$indent$2 $3\" because it is inside of " . (join ' > ', @stack) . ")\n")
            }
        }
    }
}


sub check_mandatory_boilerplate {
    my ($file, $source) = @_;

    my @end_boilerplate = split /\n\s*/, qq(
       /*
        * Local variables:
        * c-indentation-style: bsd
        * c-basic-offset: 4
        * indent-tabs-mode: nil
        * End:
        *
        * vim: expandtab shiftwidth=4:
        */
    );
    shift @end_boilerplate;

    my $ok = 1;
    my $idx = -@end_boilerplate;
    my $mismatch_at;
    while ($idx < 0) {
        if ($source->[$idx] !~ /\Q$end_boilerplate[$idx]\E/) {
            if ($ok == 2) { $mismatch_at = $idx; }
            $ok = 0;
        } else {
            $ok = 2 if $ok == 1;
        }
        $idx++;
    }

    if (! $ok) {
        if ($mismatch_at >= 0) {
            error($file, 0, "Ending boilerplate is missing.");
        } else {
            error($file, (@$source+$mismatch_at), "Ending boilerplate incorrect.\n(mismatch at \"$source->[$mismatch_at]\" (should be \"$end_boilerplate[$mismatch_at]\")");
        }
    }

}


sub check_manifest {
    open(F, "<MANIFEST") || die "Unable to read MANIFEST: $!\n";

    my %files_in_dir_nocase;
    my %files_in_dir_8dot3;
    my $line = 0;
    while (<F>) {
        $line++;

        chomp;

        unless (/[A-Za-z0-9\.\-_\/]+\s+\[\w*\]\w*/) {
            error("MANIFEST", $line, "malformed entry for filename ($_)");
        }

        my ($filename, $dirname) = fileparse($_);

        my ($filebase, $extension) = ($filename =~ /^(.*)\.(.*)/);
        $filebase ||= $filename;
        if ($filebase =~ /\./) {
            error("MANIFEST", $line, "$_: more than one '.' in a filename");
        }
        $filebase  = substr($filebase, 0, 8);
        $extension = substr($extension, 0, 3);
        my $filename_8dot3 = lc("$filebase.$extension");

        if (exists $files_in_dir_8dot3{$dirname}{$filename_8dot3}) {
            error("MANIFEST", $line, "$_: 8.3 name collision with $files_in_dir_8dot3{$dirname}{$filename_8dot3} ($filename_8dot3)");
        }
        $files_in_dir_8dot3{$dirname}{$filename_8dot3}=$_;

        if (exists $files_in_dir_nocase{$dirname}{lc($filename)}) {
            error("MANIFEST", $line, "$_: case-insensitive collision with " . $files_in_dir_nocase{$dirname}{lc($filename)});
        }
        $files_in_dir_nocase{$dirname}{lc($filename)}=$_;
    }

    close(F);
}



sub info {
    my ($file, $line, $message) = @_;

    print "$file:$line (INFO) " . Text::Wrap::wrap("", "        ", $message) . "\n";
}


sub warning {
    my ($file, $line, $message) = @_;

    print "$file:$line (WARNING) " . Text::Wrap::wrap("", "        ", $message) . "\n";
}


sub error {
    my ($file, $line, $message) = @_;

    print "$file:$line (ERROR) " . Text::Wrap::wrap("", "        ", $message) . "\n";
}

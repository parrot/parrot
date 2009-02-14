# $Id$
# Copyright (C) 2007, The Perl Foundation.

package Parrot::Manifest;
use strict;
use warnings;
use Carp;

sub new {
    my $class   = shift;
    my $argsref = shift;

    my $self = bless( {}, $class );

    my %data = (
        id         => '$' . 'Id$',
        time       => scalar gmtime,
        cmd        => -d '.svn' ? 'svn' : 'svk',
        script     => $argsref->{script},
        file       => $argsref->{file}      ? $argsref->{file}      : q{MANIFEST},
        skip       => $argsref->{skip}      ? $argsref->{skip}      : q{MANIFEST.SKIP},
        gitignore  => $argsref->{gitignore} ? $argsref->{gitignore} : q{.gitignore},
    );

    my $status_output_ref = [qx($data{cmd} status -v)];

    # grab the versioned resources:
    my @versioned_files;
    my @dirs;
    my @versioned_output = grep !/^[?D]/, @{$status_output_ref};
    for my $line (@versioned_output) {
        my @line_info = split( /\s+/, $line );

        # the file is the last item in the @line_info array
        my $filename = $line_info[-1];
        $filename =~ s/\\/\//g;

        # ignore .svn, blib directories;
        # ignore ports/ directories, as that information does not need to be
        # in tarball releases
        next if $filename =~ m[/\.svn|^blib|^ports];
        if ( -d $filename ) {
            push @dirs, $filename;
        }
        else {
            push @versioned_files, $filename;
        }
    }
    $data{dirs}            = \@dirs;
    $data{versioned_files} = \@versioned_files;

    # initialize the object from the prepared values (Damian, p. 98)
    %$self = %data;

    return $self;
}

sub prepare_manifest {
    my $self = shift;

    my %manifest_lines;
    for my $file ( @{ $self->{versioned_files} } ) {
        $manifest_lines{$file} = _get_manifest_entry($file);
    }

    return \%manifest_lines;
}

sub determine_need_for_manifest {
    my $self               = shift;
    my $proposed_files_ref = shift;

    return 1 unless -f $self->{file};

    my $current_files_ref        = $self->_get_current_files();
    my $different_patterns_count = 0;
    foreach my $cur ( keys %{$current_files_ref} ) {
        $different_patterns_count++ unless $proposed_files_ref->{$cur};
    }
    foreach my $pro ( keys %{$proposed_files_ref} ) {
        $different_patterns_count++ unless $current_files_ref->{$pro};
    }

    $different_patterns_count ? return 1 : return;
}

my $text_file_coda = <<'CODA';
# Local variables:
#   mode: text
#   buffer-read-only: t
# End:
CODA

sub print_manifest {
    my $self               = shift;
    my $manifest_lines_ref = shift;

    my $print_str          = <<"END_HEADER";
# ex: set ro:
# $self->{id}
#
# generated by $self->{script} $self->{time} UT
#
# See tools/dev/install_files.pl for documentation on the
# format of this file.
# See docs/submissions.pod on how to recreate this file after SVN
# has been told about new or deleted files.
END_HEADER

    for my $k ( sort keys %{$manifest_lines_ref} ) {
        $print_str .= sprintf "%- 59s %s\n", ( $k, $manifest_lines_ref->{$k} );
    }
    $print_str .= $text_file_coda;
    open my $MANIFEST, '>', $self->{file}
        or croak "Unable to open $self->{file} for writing";
    print {$MANIFEST} $print_str;
    close $MANIFEST or croak "Unable to close $self->{file} after writing";

    return 1;
}

sub _get_manifest_entry {
    my $file    = shift;

    my $special = _get_special();
    my $loc     = '[]';
    for ($file) {
        $loc =
              exists( $special->{$_} ) ? $special->{$_}
            : !m[/]                           ? '[]'
            : m[README]                       ? '[]doc'
            : m[^docs/user/]                  ? '[main]doc'
            : m[^docs/ops/]                   ? '[main]doc'
            : m[^docs/pmc/]                   ? '[main]doc'
            : m[^docs/pct/]                   ? '[pct]doc'
            : m[^examples/]                   ? '[examples]'
            : m[^include/]                    ? '[main]include'
            : ( m[^languages/(\w+)/] and $1 ne 'conversion' ) ? "[$1]"
            : ( m[^compilers/(\w+)/] and $1 ne 'conversion' ) ? "[$1]"
            : m[^lib/Parrot/]                 ? '[devel]lib'
            : m[^t/]                          ? '[test]'
            : m[^runtime/]                    ? '[library]'
            : m[^runtime/parrot/library/PCT]  ? '[pct]'
            : m[^docs/pct]                    ? '[pct]doc'
            : m[^runtime/parrot/library/TGE]  ? '[tge]'
            : m[^runtime/parrot/library/JSON] ? '[json]'
            : m[^docs/project]                ? '[devel]doc'
            :                                   '[]'; # default
    }

    return $loc;
}

sub _get_special {
    my %special = qw(
        LICENSE                                         [main]doc
        NEWS                                            [main]doc
        PBC_COMPAT                                      [main]doc
        PLATFORMS                                       [devel]doc
        README                                          [devel]doc
        README.win32.pod                                [devel]doc
        README.win32.pod                                [devel]doc
        RESPONSIBLE_PARTIES                             [main]doc
        parrot-config                                   [main]bin
        docs/faq.pod                                    [main]doc
        docs/gettingstarted.pod                         [main]doc
        docs/glossary.pod                               [main]doc
        docs/intro.pod                                  [main]doc
        docs/compiler_faq.pod                           [devel]doc
        docs/debug.pod                                  [devel]doc
        docs/pmc2c.pod                                  [devel]doc
        docs/vtables.pod                                [devel]doc
        languages/t/harness                             [test]
        src/call_list.txt                               [devel]share
        src/ops/ops.num                                 [devel]share
        tools/build/ops2c.pl                            [devel]
        tools/build/ops2pm.pl                           [devel]
        tools/build/pbc2c.pl                            [devel]
        tools/build/revision_c.pl                       [devel]
        tools/dev/pbc_to_exe.pir                        [devel]
        tools/dev/reconfigure.pl                        [devel]
        src/vtable.tbl                                  [devel]share
    );

    return \%special;
}

sub _get_current_files {
    my $self          = shift;

    my %current_files;
    open my $FILE, "<", $self->{file}
        or die "Unable to open $self->{file} for reading";
    while ( my $line = <$FILE> ) {
        chomp $line;

        next if $line =~ /^\s*$/o;

        next if $line =~ /^#/o;

        my ($file) = split /\s+/, $line;
        $current_files{ $file }++;
    }
    close $FILE or die "Unable to close $self->{file} after reading";

    return \%current_files;
}

sub prepare_manifest_skip {
    my $self      = shift;

    my $ignores_ref = $self->_get_ignores();

    return $self->_compose_manifest_skip($ignores_ref);
}

sub prepare_gitignore {
    my $self      = shift;

    my $ignores_ref = $self->_get_ignores();

    return $self->_compose_gitignore($ignores_ref);
}

sub determine_need_for_manifest_skip {
    my $self      = shift;
    my $print_str = shift;

    if ( !-f $self->{skip} ) {
        return 1;
    }
    else {
        my $current_skips_ref        = $self->_get_current_skips();
        my $proposed_skips_ref       = _get_proposed_skips($print_str);
        my $different_patterns_count = 0;
        foreach my $cur ( keys %{$current_skips_ref} ) {
            $different_patterns_count++ unless $proposed_skips_ref->{$cur};
        }
        foreach my $pro ( keys %{$proposed_skips_ref} ) {
            $different_patterns_count++ unless $current_skips_ref->{$pro};
        }

        $different_patterns_count ? return 1 : return;
    }
}

sub print_manifest_skip {
    my $self      = shift;
    my $print_str = shift;

    open my $MANIFEST_SKIP, '>', $self->{skip}
        or die "Unable to open $self->{skip} for writing";
    $print_str .= $text_file_coda;
    print $MANIFEST_SKIP $print_str;
    close $MANIFEST_SKIP
        or die "Unable to close $self->{skip} after writing";

    return 1;
}

sub print_gitignore {
    my $self      = shift;
    my $print_str = shift;

    open my $GITIGNORE, '>', $self->{gitignore}
        or die "Unable to open $self->{gitignore} for writing";
    $print_str .= $text_file_coda;
    print $GITIGNORE $print_str;
    close $GITIGNORE
        or die "Unable to close $self->{gitignore} after writing";

    return 1;
}

sub _get_ignores {
    my $self      = shift;

    my $svnignore = `$self->{cmd} propget svn:ignore @{ $self->{dirs} }`;

    # cope with trailing newlines in svn:ignore output
    $svnignore =~ s/\n{3,}/\n\n/g;
    my %ignores;
    my @ignore = split( /\n\n/, $svnignore );
    foreach (@ignore) {
        my @cnt = m/( - )/g;
        if ($#cnt) {
            my @a = split /\n(?=(?:.*?) - )/, $_;
            foreach (@a) {
                m/^\s*(.*?) - (.+)/sm;
                $ignores{$1} = $2 if $2;
            }
        }
        else {
            m/^(.*) - (.+)/sm;
            $ignores{$1} = $2 if $2;
        }
    }

    return \%ignores;
}

sub _compose_gitignore {
    my $self        = shift;
    my $ignores_ref = shift;

    my $print_str  = <<"END_HEADER";
# ex: set ro:
# $self->{id}
# generated by $self->{script} $self->{time} UT
#
# This file should contain a transcript of the svn:ignore properties
# of the directories in the Parrot subversion repository.
# The .gitignore file is a convenience for developers  working with git-svn.
# See http://www.kernel.org/pub/software/scm/git/docs/gitignore.html for the
# format of this file.
#
END_HEADER

    foreach my $directory ( sort keys %{$ignores_ref} ) {
        my $dir = $directory;
        $dir =~ s!\\!/!g;
        $print_str .= "# generated from svn:ignore of '$dir/'\n";
        foreach ( sort split /\n/, $ignores_ref->{$directory} ) {
            $print_str .=
                ( $dir ne '.' )
                ? "/$dir/$_\n"
                : "/$_\n";
        }
    }

    return $print_str;
}

sub _compose_manifest_skip {
    my $self       = shift;
    my $ignore_ref = shift;

    my %ignore     = %{$ignore_ref};
    my $print_str  = <<"END_HEADER";
# ex: set ro:
# $self->{id}
# generated by $self->{script} $self->{time} UT
#
# This file should contain a transcript of the svn:ignore properties
# of the directories in the Parrot subversion repository. (Needed for
# distributions or in general when svn is not available).
# See docs/submissions.pod on how to recreate this file after SVN
# has been told about new generated files.
#
# Ignore the SVN directories
\\B\\.svn\\b

# ports/ should not go into release tarballs
^ports\$
^ports/
END_HEADER

    foreach my $directory ( sort keys %ignore ) {
        my $dir = $directory;
        $dir =~ s!\\!/!g;
        $print_str .= "# generated from svn:ignore of '$dir/'\n";
        foreach ( sort split /\n/, $ignore{$directory} ) {
            s/\./\\./g;
            s/\*/.*/g;
            $print_str .=
                ( $dir ne '.' )
                ? "^$dir/$_\$\n^$dir/$_/\n"
                : "^$_\$\n^$_/\n";
        }
    }

    return $print_str;
}

sub _get_current_skips {
    my $self          = shift;

    my %current_skips;
    open my $SKIP, "<", $self->{skip}
        or die "Unable to open $self->{skip} for reading";
    while ( my $line = <$SKIP> ) {
        chomp $line;
        next if $line =~ /^\s*$/o;
        next if $line =~ /^#/o;
        $current_skips{$line}++;
    }
    close $SKIP or die "Unable to close $self->{skip} after reading";

    return \%current_skips;
}

sub _get_proposed_skips {
    my $print_str      = shift;

    my @proposed_lines = split /\n/, $print_str;
    my %proposed_skips = ();
    for my $line (@proposed_lines) {
        next if $line =~ /^\s*$/o;
        next if $line =~ /^#/o;
        $proposed_skips{$line}++;
    }

    return \%proposed_skips;
}

1;

#################### DOCUMENTATION ####################

=head1 NAME

Parrot::Manifest - Re-create MANIFEST and MANIFEST.SKIP

=head1 SYNOPSIS

    use Parrot::Manifest;

    $mani = Parrot::Manifest->new($0);

    $manifest_lines_ref = $mani->prepare_manifest();
    $need_for_files     = $mani->determine_need_for_manifest($manifest_lines_ref);
    $mani->print_manifest($manifest_lines_ref) if $need_for_files;

    $print_str     = $mani->prepare_manifest_skip();
    $need_for_skip = $mani->determine_need_for_manifest_skip($print_str);
    $mani->print_manifest_skip($print_str) if $need_for_skip;

    $print_str     = $mani->prepare_gitignore();
    $mani->print_gitignore($print_str) if $need_for_skip;

=head1 SEE ALSO

F<tools/dev/mk_manifest_and_skip.pl>.

=head1 AUTHOR

James E. Keenan (jkeenan@cpan.org) refactored code from earlier versions of
F<tools/dev/mk_manifest_and_skip.pl>.

=head1 LICENSE

This is free software which you may distribute under the same terms as Perl
itself.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

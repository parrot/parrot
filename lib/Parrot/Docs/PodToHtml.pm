# Copyright (C) 2004-2011, Parrot Foundation.

=head1 NAME

Parrot::Docs::PodToHtml - POD to HTML converter

=head1 SYNOPSIS

We subclass L<Pod::Simple::HTML>; see that module for details.

=head1 DESCRIPTION

Subclass C<Pod::Simple::HTML> to override behavior for various Parrot-specific
formatting features, and to use our own style.

=head2 Instance Methods

=over

=cut

package Parrot::Docs::PodToHtml;

use strict;
use warnings;

use base qw( Pod::Simple::HTML );

# This is just here to keep Pod::Simple::HTML's version_tag_comment() happy.
our $VERSION = '1.0';

use Parrot::Docs::HTMLPage;

my $page_title;

=item C<new()>

Extend C<Pod::Simple::HTML> method to accept PIR and PASM sections that
contain example code, which will be put into a <pre> HTML element.

=cut

sub new {
    my $new = shift->SUPER::new(@_);

    $new->accept_targets(qw(
        PIR PASM PIR_FRAGMENT
        PIR_INVALID PIR_TODO
        PASM_INVALID PASM_TODO
        PIR_FRAGMENT_INVALID
    ));
    delete(@{$new->{'Tagmap'}}{'Data','/Data'});

    return $new;
}

=item C<set_parent()>

Store information about the referring page so we can generate breadcrumbs.

=cut

sub set_parent {
    my $self = shift;
    my $parent = shift;
    my $parent_title = shift;

    return if $parent eq 'index'; # this is the root, no need to track it 2x.

    $self->{parent} = $parent;
    $self->{parent_title} = $parent_title;
}


=item C<do_beginning()>

Reimplements the C<Pod::Simple::HTML> method to add a header to the start
of the document.

=cut

sub do_beginning {
    my $self = shift;

    my $title = esc($self->get_title());
    if (not $title) {
        # Since we couldn't find a title, we'll fake one using the filename.
        $title = esc($self->{source_filename});
        $title =~ s/^.+\///;
        $title =~ s/\.\w+$//;
        $title =~ s/[=-_ ]+/ /g;
        $title = ucfirst $title;
    }

    # If the name of the document is IN the document title (a common pod
    # idiom), strip it out. We assume anything with a dot is the filename.

    if ($title =~ m/(.*?)&#45;/) {
        if ($1 =~ m/\./) {
            $title =~ s/^.*?&#45;\s*//;
        }
    }


    # Figure out what the relative docroot will be and setup
    # our breadcrumbs & resource paths.

    my $dirCount = ( $self->{source_filename} =~ tr{/}{/} );
    my $docroot = join('/', (('..') x ++$dirCount)) ;
    my $resources_URL = $docroot . '/resources';
    my $nav_HTML = qq{<a href="$docroot/html/index.html">Home</a>};
    if (exists $self->{parent}) {
        $nav_HTML .= qq{ &raquo; <a href="$docroot/html/} . $self->{parent};
        $nav_HTML .= qq{.html">} . $self->{parent_title} . '</a>';
    }

    print { $self->{'output_fh'} }
        Parrot::Docs::HTMLPage->header(
            $title,
            $nav_HTML,
            $resources_URL
        );

    $self->version_tag_comment;

    $page_title = $title;

    return 1;
}

=item C<do_middle()>

Does the middle of the document. This splits up the long C<do_middle()>
method in C<Pod:Simple::HTML>, calling the various C<process_*> methods
below. This makes it easier to see where the custom bits of Parrot-specific
formatting have to be inserted.

=cut

sub do_middle {
    my $self = shift;
    my $token;
    my $type;

    $self->{STACK}     = [];
    $self->{DONT_WRAP} = 0;

    while ( $token = $self->get_token ) {
        $type = $token->type;

        if ( $type eq 'start' ) {
            $self->process_start_token($token);
        }
        elsif ( $type eq 'end' ) {
            $self->process_end_token($token);
        }
        elsif ( $type eq 'text' ) {
            $self->process_text_token($token);
        }
    }

    return 1;
}

=item C<process_start_token($token)>

Process a start token.

=cut

sub process_start_token {
    my $self    = shift;
    my $token   = shift;
    my $tagname = $token->tagname;

    if ( $tagname eq 'L' ) {
        $self->process_link_start_token($token);
    }
    elsif ( $tagname eq 'F' ) {
        $self->process_file_start_token($token);
    }
    elsif ( $tagname eq 'C' ) {
        $self->process_code_start_token($token);
    }
    elsif ( $tagname eq 'item-text' or $tagname =~ m/^head\d$/s ) {
        $self->process_item_text_or_head_start_token($token);
    }
    elsif ( $tagname eq 'Data' ) {
        $self->process_data_start_token($token);
    }
    elsif ( $tagname eq 'for' ) {
        $self->process_for_start_token($token);
    }
    else {
        $self->process_other_start_token($token);
    }
}

=item C<process_link_start_token($token)>

Processes the link start token.

=cut

sub process_link_start_token {
    my $self  = shift;
    my $token = shift;
    my $text  = $self->do_link($token);

    esc($text);

    if ( defined $text and length $text ) {
        print { $self->{'output_fh'} } "<a href='$text'>";
    }
    else {
        print { $self->{'output_fh'} } "<a>";
    }
}

=item C<process_code_start_token($token)>

Processes the code start token. If the code text is the name of a Parrot
Perl module, and the current documentation file is not the file for that
module, then the documentation file for the module is linked to.

=cut

sub process_code_start_token {
    my $self    = shift;
    my $token   = shift;
    my $tagname = $token->tagname;

    # We make the code tags in items bold because they are almost
    # always part of function and arguments, or constants listings
    # and should stand out.

    print { $self->{'output_fh'} } '<b>' if $self->{IN_ITEM_TEXT};

    print { $self->{'output_fh'} } $self->{'Tagmap'}{$tagname};

    my $next = $self->get_token;

    unless ( $next->type eq 'text' ) {
        $self->unget_token($next);
        return;
    }

    my $text = $next->text;


    ## XXX re-enable this

    #if ( $text =~ /^Parrot::/o ) {

        #my $href = $self->href_for_perl_module($text);

        #esc($text);

        #if ($href) {
            #$text = "<a href='$href'>$text</a>";
        #}
    #}
    #else {

        esc($text);
    #}

    print { $self->{'output_fh'} } $text;
}

=item C<process_file_start_token($token)>

Processes the file start token. If the text of the next token is a file
path and that file contains POD, then a link will be made to that file's
documentation file.

=cut


sub process_file_start_token {
    my $self    = shift;
    my $token   = shift;
    my $tagname = $token->tagname;
    my $next    = $self->get_token;

    ## XXX re-enable this.

    ##if ( $next->type eq 'text' ) {
        ##my $text = $next->text;
        ##my $dist = Parrot::Distribution->new;
##
####warn "Token is $token; tagname is $tagname, next is $next, text is $text\n";
        ### Only link to files that will have HTML pages.

        ##if (
            ##$dist->relative_path_is_file($text)

            # A little bit of a hack to avoid config template files.
            ##and $text !~ /\.in$/o and $dist->file_with_relative_path($text)->contains_pod
            ##)
        ##{
            ##my $path = $self->append_html_suffix($text);
##warn "HEY MY PATH IS $path\n";
            ##my $file = $self->{TARGET}->file_with_relative_path($path);
##warn "HEY I GOT THIS FAR\n";

            ##print { $self->{'output_fh'} } $self->{'Tagmap'}{$tagname}
                ##. $self->html_link( $self->{DOCS_FILE}->parent->relative_path($file), esc($text) );
        ##}
        ##else {
            ##print { $self->{'output_fh'} } $self->{'Tagmap'}{$tagname} . esc($text);
        ##}
    ##}
    ##else {
        $self->unget_token($next);
        print { $self->{'output_fh'} } $self->{'Tagmap'}{$tagname};
    ##}
}

=item C<process_item_text_or_head_start_token($token)>

Process the item text or head start token.

=cut

sub process_item_text_or_head_start_token {
    my $self    = shift;
    my $token   = shift;
    my $tagname = $token->tagname;

    print { $self->{'output_fh'} } $self->{'Tagmap'}{$tagname} || return;

    if ( $tagname eq 'item-text' ) {
        $self->{IN_ITEM_TEXT} = 1;
    }

    my @to_unget;

    # Get all the contained tokens, including the end token.

    while (1) {
        push @to_unget, $self->get_token;

        last
            if $to_unget[-1]->is_end
                and $to_unget[-1]->tagname eq $tagname;
    }

    # Convert them into an anchor name;

    my $name = $self->linearize_tokens(@to_unget);

    if ( defined $name ) {
        $name =~ tr/ /_/;

        print { $self->{'output_fh'} } qq(<a name="), esc($name), qq("\n>);

    }
    else {
        print { $self->{'output_fh'} } "<a\n>";
    }

    $self->unget_token(@to_unget);
}

=item C<process_data_start_token($token)>

Processes a data start token.

=cut

sub process_data_start_token {
    my $self  = shift;
    my $token = shift;
    my $next  = $self->get_token;

    return unless defined $next;

    unless ( $next->type eq 'text' ) {
        $self->unget_token($next);
        return;
    }

    if  ($self->{IN_CODE_BLOCK}) {
        print { $self->{'output_fh'} } $next->text;
    }
    else {
        print { $self->{'output_fh'} } "\n" . $next->text . "\n";
    }
}

=item C<process_for_start_token($token)>

Processes a for start token.

=cut

sub process_for_start_token {
    my $self  = shift;
    my $token = shift;
    my $target = $token->attr("target");

    if ($target =~ m/^(PIR|PASM)/) {
        print { $self->{'output_fh'} } '<pre>';
        $self->{IN_CODE_BLOCK} = 1;
    }
}

=item C<process_other_start_token($token)>

Processes a start token not processable by the above methods.

=cut

sub process_other_start_token {
    my $self    = shift;
    my $token   = shift;
    my $tagname = $token->tagname;

    if ( $tagname =~ m/^over-(.+)$/s ) {
        push @{ $self->{STACK} }, $1;
    }
    elsif ( $tagname eq 'Para' ) {
        $tagname = 'Para_item'
            if @{ $self->{STACK} } and $self->{STACK}->[-1] eq 'text';
    }

    print { $self->{'output_fh'} } $self->{'Tagmap'}{$tagname} || return;

    ++$self->{DONT_WRAP}
        if $tagname eq 'Verbatim'
            or $tagname eq "VerbatimFormatted"
            or $tagname eq 'X';
}

=item C<process_end_token($token)>

Processes an end token.

=cut

sub process_end_token {
    my $self    = shift;
    my $token   = shift;
    my $tagname = $token->tagname;

    if ( $tagname =~ m/^over-/s ) {
        pop @{ $self->{STACK} };
    }
    elsif ( $tagname eq 'Para' ) {
        $tagname = 'Para_item'
            if @{ $self->{STACK} } and $self->{STACK}->[-1] eq 'text';
    }
    elsif ( $tagname eq 'C' ) {

        # See the note in process_code_start_token() above.
        print { $self->{'output_fh'} } '</b>' if $self->{IN_ITEM_TEXT};
    }
    elsif ( $tagname eq 'item-text' ) {
        $self->{IN_ITEM_TEXT} = 0;
    }
    elsif ( $tagname eq 'for' ) {
        print { $self->{'output_fh'} } '</pre>' if $self->{IN_CODE_BLOCK};
        $self->{IN_CODE_BLOCK} = 0;
    }

    print { $self->{'output_fh'} } $self->{'Tagmap'}{"/$tagname"} || return;

    --$self->{DONT_WRAP} if $tagname eq 'Verbatim' or $tagname eq 'X';
}

=item C<process_text_token($token)>

Processes the specified text token. URLs which are not in link tags
are linked here for convenience.

=cut

sub process_text_token {
    my $self  = shift;
    my $token = shift;
    my $text  = $token->text;

    esc($text);
    $text =~ s/([\?\!\"\'\.\,]) /$1\n/g unless $self->{DONT_WRAP};

    # URLs not in L<>.
    $text =~ s|(http://[^\s)]+)|<a href="$1">$1</a>|gs;

    print { $self->{'output_fh'} } $text;
}

=item C<do_pod_link($link)>

This is reimplemented here to avoid a bug in C<Pod::Simple::HTML>.

=cut

sub do_pod_link {
    my $self    = shift;
    my $link    = shift;
    my $to      = $link->attr('to');
    my $section = $link->attr('section');

    return
        unless ( defined $to and length $to )
        or ( defined $section and length $section );

    if ( defined $to and length $to ) {
        $to = $self->resolve_pod_page_link( $to, $section );

        return unless defined $to and length $to;
    }

    if ( defined $section and length( $section .= '' ) ) {
        $section =~ tr/ /_/;
        $section =~ tr/\x00-\x1F\x80-\x9F//d if 'A' eq chr(65);
        $section = $self->unicode_escape_url($section);

        # Turn char 1234 into "(1234)"
        $section = '_' unless length $section;
    }

    foreach my $it ( $to, $section ) {
        next unless defined $it;

        $it =~ s/([^\x00-\xFF])/join '', map sprintf('%%%02X',$_), unpack 'C*', $1/eg;
        $it =~
s/([^\._abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789])/sprintf('%%%02X',ord($1))/eg;

        # Yes, stipulate the list without a range, so that this can work right on
        #  all charsets that this module happens to run under.
        # Altho, hmm, what about that ord?  Presumably that won't work right
        #  under non-ASCII charsets.  Something should be done about that.
    }

    # Pod::Simple::HTML bug was here.
    my $out;

    $out = $to if defined $to and length $to;
    $out .= "#" . $section if defined $section and length $section;

    return unless length $out;

    return $out;
}

=item C<resolve_pod_page_link($to, $section)>

Resolves the POD link. Perl modules are converted to paths.

=cut

sub resolve_pod_page_link {
    my $self    = shift;
    my $to      = shift;
    my $section = shift;

    ## XXX re-enable this

    #if ( $to =~ /^Parrot::/o ) {
        #my $href = $self->href_for_perl_module($to);

        # This gets corrupted somewhere down the line, with
        # Parrot/PackFile/ConstTable.pm.html being turned into
        # Parrot/PackFile%2FConstTable.pm.html and thus breaking
        # the CSS and images somehow.

        #return $href if defined $href;
    #}

    return 'TODO';
}

=item C<href_for_perl_module($module)>

Returns the path to the Perl module's HTML file relative to the current
documentation page. Currently only F<lib/Parrot> modules are linkable.
Returns C<undef> if the current documentation file is the file for the
module.

=cut

sub href_for_perl_module {
    my $self   = shift;
    my $module = shift;

    # This is not very obvious, so let me explain. We get the file
    # for the module, then we take its path relative to the
    # distribution, then we append the HTML suffix and get the
    # docs file. Once we have that all we need is the relative
    # path from the current directory to the file and return that
    # as the link.

    my $dist = Parrot::Distribution->new;
    my $file = $dist->file_for_perl_module($module);

    return if not $file or not $file->contains_pod;

    my $path = $self->append_html_suffix( $dist->relative_path($file) );

    ## XXX re-enable this

    # This is the docs file for the module.
    ## $file = $self->{TARGET}->file_with_relative_path($path);

    # There's no point in linking to the file you are already in.
    ##return if $file == $self->{DOCS_FILE};

    ##return $self->href_path( $self->{DOCS_FILE}->parent->relative_path($file) );
}

=item C<do_end()>

Reimplements the C<Pod::Simple::HTML> method to add a footer to the end
of the document.

=cut

sub do_end {
    my $self = shift;

    print { $self->{'output_fh'} } Parrot::Docs::HTMLPage->footer( '', $self->{RESOURCES_URL} );

    return 1;
}

=item C<html_for_file($file)>

Returns the HTML for the specified file.

=cut

sub html_for_file {
    my $self   = shift;
    my $file   = shift;
    my $string = "";

    $self->output_string( \$string );
    $self->parse_file( $file->path );

    return $string;
}

=item C<append_html_suffix($path)>

Returns C<$path> with and HTML file suffix added.

=cut

sub append_html_suffix {
    my $self = shift;
    my $path = shift;

    return $path . '.html';
}

=item C<html_link($href, $text)>

Returns an HTML anchor with the specified "href".

=cut

sub html_link {
    my $self = shift;
    my $href = $self->href_path(shift);
    my $text = shift || $href;

    return "<a href=\"$href\">$text</a>";
}

=item href_path($path)

Converts the path for use in an "href".

Sequences of backslashes are converted to forward slash.

=cut

sub href_path {
    my $self = shift;
    my $path = shift;

    $path =~ s|\\+|/|go;

    return $path;
}

=item C<return_page_title()>

Return the title in $page_title from do_begining

=cut

sub return_page_title {
    my $self = shift;

    return $page_title;
}

=back

=head2 Functions

=over 4

=item C<esc(@strings)>

=item C<esc($string)>

Reimplemented here to silence a C<Pod::Simple::HTML> warning.

=cut

sub esc {
    if ( defined wantarray ) {
        if (wantarray) {
            @_ = splice @_;    # break aliasing
        }
        else {
            my $x = shift;

            # Pod::Simple::HTML didn't check this.
            return $x unless $x;
            $x =~
s/([^\n\t !\#\$\%\(\)\*\+,\.\~\/\:\;=\?\@\[\\\]\^_\`\{\|\}abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789])/'&#'.(ord($1)).';'/eg;
            return $x;
        }
    }

    foreach my $x (@_) {

        # Pod::Simple::HTML didn't check this.
        next unless $x;

        # Escape things very cautiously:
        $x =~
s/([^\n\t !\#\$\%\(\)\*\+,\.\~\/\:\;=\?\@\[\\\]\^_\`\{\|\}abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789])/'&#'.(ord($1)).';'/eg;

        # Leave out "- so that "--" won't make it thru in X-generated comments
        #  with text in them.

        # Yes, stipulate the list without a range, so that this can work right on
        #  all charsets that this module happens to run under.
        # Altho, hmm, what about that ord?  Presumably that won't work right
        #  under non-ASCII charsets.  Something should be done about that.
    }

    return @_;
}

=back

=head1 HISTORY

In order to avoid modifying C<Pod:Simple::HTML>, large sections of its code
have been copied here, and then refactored and adjusted to enable various bits
of Parrot-specific behaviour.

At least, that's what POD2HTML, the original version of this file, said.

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::POD2HTML - Parrot POD to HTML formatter

=head1 SYNOPSIS

    use Parrot::Docs::POD2HTML;

=head1 DESCRIPTION

C<Pod::Simple::HTML> subclass.

=head2 Methods

=over

=cut

package Parrot::Docs::POD2HTML;

use strict;

use Pod::Simple::HTML;
@Parrot::Docs::POD2HTML::ISA = qw(Pod::Simple::HTML);
# This is just here to keep Pod::Simple::HTML's version_tag_comment() happy.
$Parrot::Docs::POD2HTML::VERSION = '1.0';

use Parrot::Docs::HTMLPage;

=item C<do_beginning()>

Reimplements the C<Pod::Simple::HTML> method to add a header to the start
of the document.

=cut

sub do_beginning 
{
    my $self = shift;

    # We have to do this because it has the side effect of setting
    # content_seen.
    $self->get_short_title();
    
    return unless $self->content_seen;

    # Suppress the warning in the tests.
    $self->{RESOURCES_URL} = '' unless $self->{RESOURCES_URL};
    $self->{NAV_BAR} = '' unless $self->{NAV_BAR};
    
    my $title = $self->{'Title'};
    esc($title);

    print {$self->{'output_fh'}}
        Parrot::Docs::HTMLPage->header(
            $title, $self->{NAV_BAR}, $self->{RESOURCES_URL});

    $self->version_tag_comment;

    return 1;
}

=item C<do_middle()>

Does the middle of the document. This splits up the long C<do_middle()>
method in C<Pod:Simple::HTML>, calling the various C<process_*> methods
below. This makes it easier to where the custom bits of Parrot-specific
formatting have to be inserted.

=cut

sub do_middle 
{
    my $self = shift;
    my $token;
    my $type;
    
    $self->{STACK} = [];
    $self->{DONT_WRAP} = 0;
    
    while ( $token = $self->get_token )
    {
        $type = $token->type;
        
        if ( $type eq 'start' ) 
        {
            $self->process_start_token($token);
        }
        elsif ( $type eq 'end' ) 
        {
            $self->process_end_token($token);
        } 
        elsif ( $type eq 'text' ) 
        {
            $self->process_text_token($token);
        }
    }
    
    return 1;
}

=item C<process_start_token($token)>

Process a start token.

=cut

sub process_start_token
{
    my $self = shift;
    my $token = shift;
    my $tagname = $token->tagname;

    if ( $tagname eq 'L' ) 
    {
        $self->process_link_start_token($token);
    }
    elsif ( $tagname eq 'F' )
    {
        $self->process_file_start_token($token);
    }
    elsif ( $tagname eq 'C' )
    {
        $self->process_code_start_token($token);
    }
    elsif ($tagname eq 'item-text' or $tagname =~ m/^head\d$/s) 
    {
        $self->process_item_text_or_head_start_token($token);
    } 
    elsif ($tagname eq 'Data') 
    {
        $self->process_data_start_token($token);
    } 
    else 
    {
        $self->process_other_start_token($token);
    }
}

=item C<process_link_start_token($token)>

Processes the link start token.

=cut

sub process_link_start_token
{
    my $self = shift;
    my $token = shift;
    my $text = $self->do_link($token);
    
    esc($text);
    
    if ( defined $text and length $text ) 
    {
        print {$self->{'output_fh'}} "<a href='$text'>";
    } 
    else 
    {
        print {$self->{'output_fh'}} "<a>";
    }
}

=item C<process_code_start_token($token)>

Processes the code start token. If the code text is the name of a Parrot
Perl module, and the current documentation file is not the file for that
module, then the documentation file for the module is linked to.

=cut

sub process_code_start_token
{
    my $self = shift;
    my $token = shift;
    my $tagname = $token->tagname;

    # We make the code tags in items bold because they are almost
    # always part of function and arguments, or constants listings
    #Êand should stand out.
    
    print {$self->{'output_fh'}} '<b>' if $self->{IN_ITEM_TEXT};
    
    print {$self->{'output_fh'}} $self->{'Tagmap'}{$tagname};
    
    my $next = $self->get_token;
    
    unless ( $next->type eq 'text' )
    {
        $self->unget_token($next);
        return;
    }
    
    my $text = $next->text;
                    
    if ( $text =~ /^Parrot::/o )
    {
        # TODO - C<Perl::Module> should really be L<Perl::Module>
        # but this will do until the docs are changed.
        
        my $href = $self->href_for_perl_module($text);
        
        esc($text);
    
        if ( $href )
        {
            $text = "<a href='$href'>$text</a>";
        }
    }
    else
    {
        # Tidy up the C reference *s.
        $text =~ s|\b\s*\*\s+\b| \*|gs;
        
        esc($text);
    }
    
    print {$self->{'output_fh'}} $text;
}

=item C<process_file_start_token($token)>

Processes the file start token. If the text of the next token is a file
path and that file contains POD, then a link will be made to that file's
documentation file.

=cut

sub process_file_start_token
{
    my $self = shift;
    my $token = shift;
    my $tagname = $token->tagname;
    my $next = $self->get_token;
    
    if ( $next->type eq 'text' )
    {
        my $text = esc($next->text);
        my $dist = Parrot::Distribution->new;
        
        # Only link to files that will have HTML pages.
        
        if ( $dist->relative_path_is_file($text)
            # A little bit of a hack to avoid config template files.
            and $text !~ /\.in$/o
            and $dist->file_with_relative_path($text)->contains_pod )
        {
            my $path = $self->append_html_suffix($text);
            my $file = $self->{TARGET}->file_with_relative_path($path);
    
            $path = $self->{DOCS_FILE}->parent->relative_path($file);
    
            print {$self->{'output_fh'}} 
                $self->{'Tagmap'}{$tagname} . "<a href='$path'>$text</a>";
        }
        else
        {
            print {$self->{'output_fh'}} $self->{'Tagmap'}{$tagname} . $text;
        }
    }
    else
    {
        $self->unget_token($next);
        print {$self->{'output_fh'}} $self->{'Tagmap'}{$tagname};
    }
}

=item C<process_item_text_or_head_start_token($token)>

Process the item text or head start token.

=cut

sub process_item_text_or_head_start_token
{
    my $self = shift;
    my $token = shift;
    my $tagname = $token->tagname;
    
    print {$self->{'output_fh'}} $self->{'Tagmap'}{$tagname} || return;
    
    if ( $tagname eq 'item-text' )
    {
        $self->{IN_ITEM_TEXT} = 1;
    }
    
    my @to_unget;
    
    # Get all the contained tokens, including the end token.
    
    while ( 1 )
    {
        push @to_unget, $self->get_token;
        
        last if $to_unget[-1]->is_end
            and $to_unget[-1]->tagname eq $tagname;
    }
    
    # Convert them into an anchor name;
    
    my $name = $self->linearize_tokens(@to_unget);
    
    if ( defined $name ) 
    {
        $name =~ tr/ /_/;
        
        print {$self->{'output_fh'}} 
            qq(<a name="), esc($name), qq("\n>);
    
    } 
    else 
    {
        print {$self->{'output_fh'}} "<a\n>";
    }
    
    $self->unget_token(@to_unget);
}

=item C<process_data_start_token($token)>

Processes a data start token.

=cut

sub process_data_start_token
{
    my $self = shift;
    my $token = shift;
    my $next = $self->get_token;
        
    return unless defined $next;
        
    unless( $next->type eq 'text' )
    {
        $self->unget_token($next);
        return;
    }
    
    printf {$self->{'output_fh'}} "\n" . $next->text . "\n";
}

=item C<process_other_start_token($token)>

Processes a start token not processable by the above methods.

=cut

sub process_other_start_token
{
    my $self = shift;
    my $token = shift;
    my $tagname = $token->tagname;
    
    if ( $tagname =~ m/^over-(.+)$/s ) 
    {
        push @{$self->{STACK}}, $1;
    } 
    elsif ( $tagname eq 'Para') 
    {
        $tagname = 'Para_item' 
            if @{$self->{STACK}} and $self->{STACK}->[-1] eq 'text';
    }
    
    print {$self->{'output_fh'}} $self->{'Tagmap'}{$tagname} || return;
    
    ++$self->{DONT_WRAP} if 
        $tagname eq 'Verbatim' 
        or $tagname eq "VerbatimFormatted"
        or $tagname eq 'X';
}

=item C<process_end_token($token)>

Processes an end token.

=cut

sub process_end_token
{
    my $self = shift;
    my $token = shift;
    my $tagname = $token->tagname;
    
    if ( $tagname =~ m/^over-/s ) 
    {
        pop @{$self->{STACK}};
    }
    elsif ( $tagname eq 'Para' ) 
    {
        $tagname = 'Para_item' 
            if @{$self->{STACK}} and $self->{STACK}->[-1] eq 'text';
    }
    elsif ( $tagname =~ /Verbatim(?:Formatted)?/o )
    {
        # Give the code sections equal space top and bottom.
        print {$self->{'output_fh'}} "\n\n" 
    }
    elsif ( $tagname =~ /head[12]/o )
    {
        # Put the up arrow on the end of a heading. 
        # The space is needed on the front.
        print {$self->{'output_fh'}} 
            " <a href='#_top'><img alt='^' border=0 src='$self->{RESOURCES_URL}/up.gif'></a>";
    }
    elsif ( $tagname eq 'C' )
    {
        # See the note in process_code_start_token() above.
        print {$self->{'output_fh'}} '</b>' if $self->{IN_ITEM_TEXT};
    }
    elsif ( $tagname eq 'item-text' )
    {
        $self->{IN_ITEM_TEXT} = 0;
    }
    
    print {$self->{'output_fh'}} $self->{'Tagmap'}{"/$tagname"} || return;
    
    --$self->{DONT_WRAP} if $tagname eq 'Verbatim' or $tagname eq 'X';
}

=item C<process_text_token($token)>

Processes the specified text token. URLs which are not in link tags
are linked here for convenience.

=cut

sub process_text_token
{
    my $self = shift;
    my $token = shift;
    my $text = $token->text;
    
    esc($text);
    $text =~ s/([\?\!\"\'\.\,]) /$1\n/g unless $self->{DONT_WRAP};
    
    # URLs not in L<>.
    $text =~ s|(http://[^\s)]+)|<a href="$1">$1</a>|gs;

    print {$self->{'output_fh'}} $text;
}

=item C<do_pod_link($link)>

This is reimplemented here to avoid a bug in C<Pod::Simple::HTML>.

=cut

sub do_pod_link 
{
    my $self = shift;
    my $link = shift;
    my $to = $link->attr('to');
    my $section = $link->attr('section');
    
    return undef unless
        ( defined $to and length $to ) or
        ( defined $section and length $section );
    
    if ( defined $to and length $to ) 
    {
        $to = $self->resolve_pod_page_link($to, $section);
        
        return undef unless defined $to and length $to;
    }
    
    if ( defined $section and length($section .= '') ) 
    {
        $section =~ tr/ /_/;
        $section =~ tr/\x00-\x1F\x80-\x9F//d if 'A' eq chr(65);
        $section = $self->unicode_escape_url($section);
        # Turn char 1234 into "(1234)"
        $section = '_' unless length $section;
    }
    
    foreach my $it ($to, $section) 
    {
        next unless defined $it;

        $it =~ s/([^\x00-\xFF])/join '', map sprintf('%%%02X',$_), unpack 'C*', $1/eg;
        $it =~ s/([^\._abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789])/sprintf('%%%02X',ord($1))/eg;
        # Yes, stipulate the list without a range, so that this can work right on
        #  all charsets that this module happens to run under.
        # Altho, hmm, what about that ord?  Presumably that won't work right
        #  under non-ASCII charsets.  Something should be done about that.
    }
    
    # Pod::Simple::HTML bug was here.
    my $out;
    
    $out = $to if defined $to and length $to;
    $out .= "#" . $section if defined $section and length $section;
    
    return undef unless length $out;
    
    return $out;  
}

=item C<resolve_pod_page_link($to, $section)>

Resolves the POD link. Perl modules are converted to paths.

=cut

sub resolve_pod_page_link 
{
    my $self = shift;
    my $to = shift;
    my $section = shift;
    
    if ( $to =~ /^Parrot::/o )
    {
        my $href = $self->href_for_perl_module($to);
        
        # This gets corrupted somewhere down the line, with
        # Parrot/PackFile/ConstTable.pm.html being turned into
        # Parrot/PackFile%2FConstTable.pm.html and thus breaking 
        # the CSS and images somehow.
        
        return $href if defined $href;
    }
    
    return 'TODO';
}

=item C<href_for_perl_module($module)>

Returns the path to the Perl module's HTML file relative to the current
documentation page. Currently only F<lib/Parrot> modules are linkable.
Returns C<undef> if the current documentation file is the file for the 
module.

=cut

sub href_for_perl_module
{
    my $self = shift;
    my $module = shift;
    
    # This is not very obvious, so let me explain. We get the file
    # for the module, then we take its path relative to the 
    # distribution, then we append the HTML suffix and get the
    # docs file. Once we have that all we need is the relative
    # path from the current directory to the file and return that
    # as the link.
    
    my $dist = Parrot::Distribution->new;
    my $file = $dist->file_for_perl_module($module);
    
    return undef unless $file;
    
    my $path = $self->append_html_suffix($dist->relative_path($file));
    
    # This is the docs file for the module.
    return undef unless $self->{TARGET}->relative_path_is_file($path);
    $file = $self->{TARGET}->file_with_relative_path($path);
    
    # There's no point in linking to the file you are already in.
    return undef if $file == $self->{DOCS_FILE};
    
    return $self->{DOCS_FILE}->parent->relative_path($file);
}

=item C<do_end()>

Reimplements the C<Pod::Simple::HTML> method to add a footer to the end
of the document.

=cut

sub do_end 
{
    my $self = shift;
    
    print {$self->{'output_fh'}} 
        Parrot::Docs::HTMLPage->footer('', $self->{RESOURCES_URL});
        
    return 1;
}

=item C<html_for_file($file)>

Returns the HTML for the specified file.

=cut

sub html_for_file
{
    my $self = shift;
    my $file = shift;
    my $string = "";
    
    $self->output_string(\$string);
    $self->parse_file($file->path);
    
    return $string;
}

=item C<write_html($source, $target, $rel_path, $item)>

Writes an HTML version of the file specified by C<$rel_path> in
C<$source> to the equivalent location in C<$target>.

=cut

sub write_html
{
    my $self = shift;
    my $source = shift;
    my $target = shift;
    my $rel_path = shift;
    my $item = shift;
    my $file = $source->file_with_relative_path($rel_path);
    
    return unless $file->contains_pod;
    
    $self->{TARGET} = $target;
    
    # Use our own method for consistency.
    $self->{'Title'} = $file->title;
    
    $rel_path = $self->append_html_suffix($rel_path);
        
    my $docs_file = $target->file_with_relative_path($rel_path);
    
    $self->{DOCS_FILE} = $docs_file;

    $rel_path = $docs_file->parent->relative_path($target->parent_path);

    my $name = $target->name;
    
    # This is a cheat because we know that all top-level sections
    # have their indexes in the root directory - but it works.
    
    $self->{NAV_BAR} = $item->html_navigation("$rel_path/$name");
    $self->{RESOURCES_URL} = "$rel_path/resources";

    $docs_file->write($self->html_for_file($file));
}

=item C<append_html_suffix($path)>

Returns C<$path> with and HTML file suffix added.

=cut

sub append_html_suffix
{
    my $self = shift;
    my $path = shift;
    
    return $path . '.html';
}

=head2 Functions

=over 4

=item C<esc(@strings)>

=item C<esc($string)>

Reimplemented here to silence a C<Pod::Simple::HTML> warning.

=cut

sub esc 
{
    if ( defined wantarray ) 
    {
        if ( wantarray ) 
        {
            @_ = splice @_; # break aliasing
        } 
        else 
        {
            my $x = shift;
            # Pod::Simple::HTML didn't check this.
            return $x unless $x;
            $x =~ s/([^\n\t !\#\$\%\(\)\*\+,\.\~\/\:\;=\?\@\[\\\]\^_\`\{\|\}abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789])/'&#'.(ord($1)).';'/eg;
            return $x;
        }
    }

    foreach my $x (@_) 
    {
        # Pod::Simple::HTML didn't check this.
        next unless $x;
        # Escape things very cautiously:
        $x =~ s/([^\n\t !\#\$\%\(\)\*\+,\.\~\/\:\;=\?\@\[\\\]\^_\`\{\|\}abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789])/'&#'.(ord($1)).';'/eg;
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

In order to avoid modifying C<Pod:Simple::HTLM> large sections of its code
have been copied here, and then refactored and adjusted to enable various
bits of Parrot-specific behaviour.

=cut

1;
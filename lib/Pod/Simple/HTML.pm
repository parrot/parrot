
require 5;
package Pod::Simple::HTML;
use strict;
use Pod::Simple::PullParser ();
use vars qw(@ISA %Tagmap $Computerese $Lame $Linearization_Limit $VERSION);
@ISA = ('Pod::Simple::PullParser');
$VERSION = '2.02';

use UNIVERSAL ();
sub DEBUG () {0}

$Computerese =  " lang='und' xml:lang='und'" unless defined $Computerese;
$Lame = ' class="pad"' unless defined $Lame;

$Linearization_Limit = 90 unless defined $Linearization_Limit;
 # headings/items longer than that won't get an <a name="...">

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
my @_to_accept;

%Tagmap = (
  'Verbatim'  => "\n<pre$Computerese>",
  '/Verbatim' => "</pre>\n",
  'VerbatimFormatted'  => "\n<pre$Computerese>",
  '/VerbatimFormatted' => "</pre>\n",
  'VerbatimB'  => "<b>",
  '/VerbatimB' => "</b>",
  'VerbatimI'  => "<i>",
  '/VerbatimI' => "</i>",
  'VerbatimBI'  => "<b><i>",
  '/VerbatimBI' => "</i></b>",


  'Data'  => "\n",
  '/Data' => "\n",
  
  'head1' => "\n<h1>",  # And also stick in an <a name="...">
  'head2' => "\n<h2>",  #  ''
  'head3' => "\n<h3>",  #  ''
  'head4' => "\n<h4>",  #  ''
  '/head1' => "</a></h1>\n",
  '/head2' => "</a></h2>\n",
  '/head3' => "</a></h3>\n",
  '/head4' => "</a></h4>\n",

  'X'  => "<!--\n\tINDEX: ",
  '/X' => "\n-->",

  changes(qw(
    Para=p
    B=b I=i
    over-bullet=ul
    over-number=ol
    over-text=dl
    over-block=blockquote
    item-bullet=li
    item-number=li
    item-text=dt
  )),
  changes2(
    map {; m/^([-a-z]+)/s && push @_to_accept, $1; $_ }
    qw[
      sample=samp
      definition=dfn
      kbd=keyboard
      variable=var
      citation=cite
      abbreviation=abbr
      acronym=acronym
      subscript=sub
      superscript=sup
      big=big
      small=small
      underline=u
      strikethrough=s
    ]  # no point in providing a way to get <q>...</q>, I think
  ),
  
  '/item-bullet' => "</li><p$Lame></p>\n",
  '/item-number' => "</li><p$Lame></p>\n",
  '/item-text'   => "</a></dt><p$Lame></p>\n",
  'Para_item'    => "\n<dd>",
  '/Para_item'   => "</dd><p$Lame></p>\n",

  'B'      =>  "<b>",                  '/B'     =>  "</b>",
  'I'      =>  "<i>",                  '/I'     =>  "</i>",
  'F'      =>  "<em$Computerese>",     '/F'     =>  "</em>",
  'C'      =>  "<code$Computerese>",   '/C'     =>  "</code>",
  'L'  =>  "<a href='YOU_SHOULD_NEVER_SEE_THIS'>", # ideally never used!
  '/L' =>  "</a>",
);

sub changes {
  return map {; m/^([-_:0-9a-zA-Z]+)=([-_:0-9a-zA-Z]+)$/s
     ? ( $1, => "\n<$2>", "/$1", => "</$2>\n" ) : die "Funky $_"
  } @_;
}
sub changes2 {
  return map {; m/^([-_:0-9a-zA-Z]+)=([-_:0-9a-zA-Z]+)$/s
     ? ( $1, => "<$2>", "/$1", => "</$2>" ) : die "Funky $_"
  } @_;
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sub new {
  my $new = shift->SUPER::new(@_);
  #$new->nix_X_codes(1);
  $new->nbsp_for_S(1);
  $new->accept_targets( 'html', 'HTML' );
  $new->accept_codes('VerbatimFormatted');
  $new->accept_codes(@_to_accept);
  DEBUG > 2 and print "To accept: ", join(' ',@_to_accept), "\n";
  
  $new->{'Tagmap'} = {%Tagmap};
  return $new;
}

sub run {
  my $self = $_[0];
  return $self->do_middle if $self->bare_output;
  return
   $self->do_beginning && $self->do_middle && $self->do_end;
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sub do_pod_link {
  my($self, $link) = @_;
  my $to = $link->attr('to');
  my $section = $link->attr('section');
  return undef unless(  # should never happen
    (defined $to and length $to) or
    (defined $section and length $section)
  );

  if(defined $to and length $to) {
    $to = $self->resolve_pod_page_link($to, $section);
    return undef unless defined $to and length $to;
     # resolve_pod_page_link returning undef is how it
     #  can signal that it gives up on making a link
     # (I pass it the section value, but I don't see a
     #  particular reason it'd use it.)
  }
  
  if(defined $section and length($section .= '')) {
    $section =~ tr/ /_/;
    $section =~ tr/\x00-\x1F\x80-\x9F//d if 'A' eq chr(65);
    $section = $self->unicode_escape_url($section);
     # Turn char 1234 into "(1234)"
    $section = '_' unless length $section;
  }
  
  

  foreach my $it ($to, $section) {
    if( defined $it ) {
      $it =~ s/([^\x00-\xFF])/join '', map sprintf('%%%02X',$_), unpack 'C*', $1/eg;
      $it =~ s/([^\._abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789])/sprintf('%%%02X',ord($1))/eg;
       # Yes, stipulate the list without a range, so that this can work right on
       #  all charsets that this module happens to run under.
       # Altho, hmm, what about that ord?  Presumably that won't work right
       #  under non-ASCII charsets.  Something should be done about that.
    }
  }
  
  my $out = $to if defined $to and length $to;
  $out .= "#" . $section if defined $section and length $section;
  return undef unless length $out;
  return $out;  
}


sub resolve_pod_page_link {
  my($self, $to) = @_;
  
  return 'TODO';
}

sub do_url_link { return $_[1]->attr('to') }

sub do_man_link { return undef }
 # But subclasses are welcome to override this if they have man
 #  pages somewhere URL-accessible.

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sub do_link {
  my($self, $token) = @_;
  my $type = $token->attr('type');
  if(!defined $type) {
    $self->whine("Typeless L!?", $token->attr('start_line'));
  } elsif( $type eq 'pod') { return $self->do_pod_link($token);
  } elsif( $type eq 'url') { return $self->do_url_link($token);
  } elsif( $type eq 'man') { return $self->do_man_link($token);
  } else {
    $self->whine("L of unknown type $type!?", $token->attr('start_line'));
  }
  return 'FNORG';
}


sub do_middle {      # the main work
  my $self = $_[0];
  my $fh = $self->{'output_fh'};
  
  my($token, $type, $tagname);
  my @stack;
  my $dont_wrap = 0;
  while($token = $self->get_token) {

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if( ($type = $token->type) eq 'start' ) {
      if(($tagname = $token->tagname) eq 'L') {
        esc($type = $self->do_link($token)); # reuse it, why not
        if(defined $type and length $type) {
          print $fh "<a href='$type'>";
        } else {
          print $fh "<a>"; # Yes, an 'a' element with no attributes!
        }

      } elsif ($tagname eq 'item-text' or $tagname =~ m/^head\d$/s) {
        print $fh $self->{'Tagmap'}{$tagname} || next;

        my @to_unget;
        while(1) {
          push @to_unget, $self->get_token;
          last if $to_unget[-1]->is_end
              and $to_unget[-1]->tagname eq $tagname;
        }
        my $name = $self->linearize_tokens(@to_unget);
        
        if(defined $name) { # ludicrously long, so nevermind
          $name =~ tr/ /_/;
          print $fh "<a name=\"", esc($name), "\"\n>";
          DEBUG and print "Linearized ", scalar(@to_unget),
           " tokens as \"$name\".\n";
        } else {
          print $fh "<a\n>";  # Yes, an 'a' element with no attributes!
          DEBUG and print "Linearized ", scalar(@to_unget),
           " tokens, but it was too long, so nevermind.\n";
        }
        $self->unget_token(@to_unget);

      } elsif ($tagname eq 'Data') {
        my $next = $self->get_token;
        next unless defined $next;
        unless( $next->type eq 'text' ) {
          $self->unget_token($next);
          next;
        }
        DEBUG and print "    raw text ", $next->text, "\n";
        printf $fh "\n" . $next->text . "\n";
        next;
       
      } else {
        if( $tagname =~ m/^over-(.+)$/s ) {
          push @stack, $1;
        } elsif( $tagname eq 'Para') {
          $tagname = 'Para_item' if @stack and $stack[-1] eq 'text';
        }
        print $fh $self->{'Tagmap'}{$tagname} || next;
        ++$dont_wrap if $tagname eq 'Verbatim' or $tagname eq "VerbatimFormatted"
          or $tagname eq 'X';
      }

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    } elsif( $type eq 'end' ) {
      if( ($tagname = $token->tagname) =~ m/^over-/s ) {
        pop @stack;
      } elsif( $tagname eq 'Para' ) {
        $tagname = 'Para_item' if @stack and $stack[-1] eq 'text';
      }
      print $fh $self->{'Tagmap'}{"/$tagname"} || next;
      --$dont_wrap if $tagname eq 'Verbatim' or $tagname eq 'X';

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    } elsif( $type eq 'text' ) {
      esc($type = $token->text);  # reuse $type, why not
      $type =~ s/([\?\!\"\'\.\,]) /$1\n/g unless $dont_wrap;
      print $fh $type;
    }

  }
  return 1;
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

sub do_beginning {
  my $self = $_[0];

  my $title = $self->get_short_title();
  unless($self->content_seen) {
    DEBUG and print "No content seen in search for title.\n";
    return;
  }
  $self->{'Title'} = $title;

  esc($title);
  print {$self->{'output_fh'}}
   "<html><head>\n<title>$title</title>\n</head>\n<body>\n", 
   $self->version_tag_comment,
   "<!-- start doc -->\n",
  ;
   # TODO: more configurability there

  DEBUG and print "Returning from do_beginning...\n";
  return 1;
}

sub version_tag_comment {
  my $self = shift;
  return sprintf
   "<!-- generated by %s v%s, using %s v%s, under Perl v%s at %s GMT -->\n",
    # None of the following things should need escaping, I dare say!
    ref($self), $self->VERSION(), $ISA[0], $ISA[0]->VERSION(),
    $], scalar(gmtime),
  ;  
}


sub do_end {
  my $self = $_[0];
  print {$self->{'output_fh'}} "\n<!-- end doc -->\n</body></html>\n";
   # TODO: allow for a footer
  return 1;
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sub esc {
  if(defined wantarray) {
    if(wantarray) {
      @_ = splice @_; # break aliasing
    } else {
      my $x = shift;
      $x =~ s/([^\n\t !\#\$\%\(\)\*\+,\.\~\/\:\;=\?\@\[\\\]\^_\`\{\|\}abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789])/'&#'.(ord($1)).';'/eg;
      return $x;
    }
  }
  foreach my $x (@_) {
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

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sub linearize_tokens {  # self, tokens
  my $self = shift;
  my $out = '';
  
  my $t;
  while($t = shift @_) {
    if(!ref $t or !UNIVERSAL::can($t, 'is_text')) {
      $out .= $t;
    } elsif($t->is_text) {
      $out .= $t->text;
    } elsif($t->is_start and $t->tag eq 'X') {
      # ignore until the end of this X<...> sequence
      my $x_open = 1;
      while($x_open) {
        next if( ($t = shift @_)->is_text );
        if(   $t->is_start and $t->tag eq 'X') { ++$x_open }
        elsif($t->is_end   and $t->tag eq 'X') { --$x_open }
      }
    }
  }
  
  $out =~ tr/\x00-\x1F\x80-\x9F//d if 'A' eq chr(65);
  return undef if length $out > $Linearization_Limit;
  
  $out = $self->unicode_escape_url($out);
  $out = '_' unless length $out;
  
  return $out;
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sub unicode_escape_url {
  my($self, $string) = @_;
  $string =~ s/([^\x00-\xFF])/'('.ord($1).')'/eg;
    #  Turn char 1234 into "(1234)"
  return $string;
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1;
__END__

=head1 NAME

TODO - TODO

=head1 SYNOPSIS

 TODO

  perl -MPod::Simple::HTML -e \
   "exit Pod::Simple::HTML->filter(shift)->errors_seen" \
   thingy.pod


=head1 DESCRIPTION

This class is for TODO.
This is a subclass of L<Pod::Simple::PullParser> and inherits all its
methods.

TODO

=head1 SEE ALSO

L<Pod::Simple>

=head1 COPYRIGHT AND DISCLAIMERS

Copyright (c) 2002 Sean M. Burke.  All rights reserved.

This library is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

This program is distributed in the hope that it will be useful, but
without any warranty; without even the implied warranty of
merchantability or fitness for a particular purpose.

=head1 AUTHOR

Sean M. Burke C<sburke@cpan.org>

=cut


package SmartLink;
use Moose;
use Moose::Util::TypeConstraints;
use Text::Balanced qw/extract_multiple extract_quotelike/;

## links are like
# L<doc> or L<doc/section> or L<doc/section/keyphrases>
subtype PodLink => as Str => where { m|^L<([^/]+)(\/([^/]+)){0,2}>| };

has 'link' => ( is => 'ro', isa => 'PodLink', required => 1, );

has 'doc' => (
    is => 'ro', isa => 'Doc',
    lazy => 1, default => sub{
        ($_)= shift->link =~ m|^L<([^/]+)|;
        Doc->new( id => $_ )
    },
);

has 'section' => (
    is => 'ro', isa => 'Str',
    lazy => 1, default => sub{
        ($_)= shift->link =~ m|^L<.*?/([^/]+)[/>]|;
        length $_
            or die qq{'section' can't be empty!\n} ;
        $_
    },
    predicate => 'has_section',
);

has 'keyphrases' => (
    is => 'ro', isa => 'Keyphrase',
    default => sub{
        ($_)= shift->link =~ m|^L<.*?/.*?/([^>]+)>|;
        defined $_ ? Keyphrase->new( string => $_ ) : undef;
    },
    predicate => 'has_keyphrases',
);


package Doc;
use Moose;

has 'id' => ( is => 'ro', isa => 'Str', required => 1, );

has 'prefix' => (
    is => 'ro', isa => 'Str',
    lazy => 1, default => sub{
        ($_)= shift->id =~ m|^(\D+)|; $_
    },
);

has 'num' => (
    is => 'ro', isa => 'Str',
    lazy => 1, default => sub{
        ($_)= shift->id =~ m|(\d+)$|; $_
    },
);


package Keyphrase;
use Moose;
use Text::Balanced qw/extract_multiple extract_quotelike/;

has 'string' => ( is => 'ro', isa => 'Str', required => 1, );

has 'list' => (
    is => 'ro', isa => 'ArrayRef',
    lazy => 1, default => sub{
        my $string= shift->string;
        [
            extract_multiple($string, [
                sub{
                    do{
                        my @a= (extract_quotelike($string))[5,1];
                        $string= $a[1]; $a[0];
                    } or do{
                        my @a= split ' ', $_[0], 2;
                        $string= $a[1]; $a[0];
                    }
                },
            ])
        ]
    },
);

has 'regex' => (
    is => 'ro', isa => 'Str',
    lazy => 1, default => sub{
        my $self= shift;
        join '.+?' => map {
            my $key= quotemeta $_;
            $key =~ s/^\w/\\b$&/;
            $key =~ s/\w$/$&\\b/;
            $key;
        } @{$self->list};
    },
);


package File;
use Moose;
use File::Basename qw/fileparse/;

has 'filename' => ( is => 'ro', isa => 'Str', required => 1, );

has 'name' => (
    is => 'ro', isa => 'Str',
    lazy => 1, default => sub{
        my $self= shift;
        (fileparse($self->filename, $self->extension))[0]
    },
);

has 'path' => (
    is => 'ro', isa => 'Str',
    lazy => 1, default => sub{
        my $self= shift;
        (fileparse($self->filename, $self->extension))[1]
    },
);

has 'extension' => (
    is => 'ro', isa => 'Str',
    lazy => 1, default => sub{
        my $self= shift;
        ($_)= $self->filename =~ m|^.*?(\..*)$|; $_
    },
);

has 'filehandle' => ( is => 'ro', isa => 'FileHandle', );
has 'mode' => ( is => 'ro', isa => 'Str', );

sub open {
    my $self= shift;
    my( $mode )= @_;
    open $self->{filehandle}, $mode => $self->filename
        or die qq{can't open } . $self->filename . qq{: $!};
    $self->{mode}= $mode;
    $self->filehandle
}

sub close { }


package PodFile;
use Moose;
use Moose::Util::TypeConstraints;
extends 'File';

override 'extension' => sub{ '.pod' };

has 'tree' => (
    is => 'rw', isa => 'HashRef',
    lazy => 1, default => sub {
        my $self= shift;

        my $in= $self->open( '<' );

        my $tree= {};
        my $section;
        while( <$in> ) {
            if( /(?x) ^ =head (\d+) \s* (.*\S) \s* $/ ) {
                my $num= $1;
                $section= $2;
                $tree->{_sections} ||= [];
                push @{ $tree->{_sections} } => [$num, $section];
            } elsif (!$section) {
                $tree->{_header} .= $_;
            } elsif (/^\s*$/) {
                $tree->{$section} ||= [];
                push @{ $tree->{$section} }, '';
            } elsif (/^\s+(.+)/) {
                $tree->{$section}->[-1] .= $_;
                push @{ $tree->{$section} }, '';
            } else {
                $tree->{$section}->[-1] .= $_;
            }
        }
        close $in;
        $tree;
    },
);

sub parse { shift->tree }


package SpecFile;
use Moose;
extends 'PodFile';

has 'prefix' => ( is => 'ro', isa => 'Str', required => 1, );

has 'num' => (
    is => 'ro', isa => 'Str',
    lazy => 1, default => sub{
        my $self= shift;
        my $pre= $self->prefix;
        ($_)= $self->name =~ m|$pre(\d+).*$|; $_ || ''
    },
);


package SpecFiles;
use Moose;
use Moose::Util::TypeConstraints;
use File::Spec::Functions qw/catfile/;

has 'root' => ( is => 'ro', isa => 'Str', required => 1, );
has 'extension' => ( is => 'ro', isa => 'Str', default => '.pod' );
has 'prefix' => ( is => 'ro', isa => 'Str', required => 1, );

has 'files' => (
    is => 'ro', isa => subtype( 'ArrayRef'
        => where { (blessed($_) && $_->isa('PodFile') || return) for @$_; 1 } ),
    lazy => 1, default => sub{
        my $self= shift;
        [ map { SpecFile->new( filename => $_, prefix => $self->prefix  ) }
            glob catfile( $self->root, $self->prefix . '*' . $self->extension )]
    },
);


package TestFile;
use Moose;
use Moose::Util::TypeConstraints;
extends 'File';

override 'extension' => sub{ '.t' };

has 'smartlinks' => (
    is => 'rw', isa => subtype 'ArrayRef'
        => where { (blessed($_) && $_->isa('SmartLink') || return) for @$_; 1 },
);

has 'tests' => (
    is => 'rw', isa => subtype 'ArrayRef'
        => where { (blessed($_) && $_->isa('TestInfo') || return) for @$_; 1 },
);


package Test;
use Moose;
use Moose::Util::TypeConstraints;

subtype TestStatus => as Str => where { m/^(not)? ok$/ };

has 'file' => ( is => 'ro', isa => 'TestFile', required => 1, );
has 'number' => ( is => 'ro', isa => 'Int', required => 1, );
has 'status' => ( is => 'ro', isa => 'TestStatus', required => 1, );
has 'description' => ( is => 'ro', isa => 'Str' );


package TestInfo;
use Moose;

has 'test' => ( is => 'ro', isa => 'Test', required => 1, );
has 'line' => ( is => 'ro', isa => 'Int', required => 1, );


package SmartLinkServer;
use Moose;
use Moose::Util::TypeConstraints;

has 'specmap' => (
    is => 'ro', isa => 'HashRef', default => sub{ {
        'PDD' => {reverse qw(
            00 pdd          01 overview    02 vtables   03 calling_conventions
            04 datatypes    05 opfunc      06 pasm      07 codingstd
            08 keys         09 gc          10 embedding 11 extending
            12 assembly     13 bytecode    14 bignum    15 objects
            16 native_call  17 basic_types 18 security  19 pir
            20 lexical_vars 21 namespaces  22 io        23 exceptions
            24 events       25 threads
        )},
        'S' => {reverse qw(
            01 Overview 02 Syntax        03 Operator     04 Block
            05 Rule     06 Subroutine    09 Structure    10 Package
            11 Module   12 Object        13 Overload     17 Concurrency
            22 CPAN     26 Documentation 29 Functions
        )},
    }},
);

has 'jscode' => (
    is => 'ro', isa => 'Str', default => sub{ <<'_EOC_';
<script type="text/javascript">
var agt = navigator.userAgent.toLowerCase();

var is_opera = (agt.indexOf("opera") != -1);
var is_ie = (agt.indexOf("msie") != -1) && document.all && !is_opera;
var is_ie5 = (agt.indexOf("msie 5") != -1) && document.all;

function tog() {
  // tog: toggle the visibility of html elements (arguments[1..]) from none to
  // arguments[0].  Return what should be returned in a javascript onevent().
  display = arguments[0];
  for( var i=1; i<arguments.length; i++ ) {
    var x = document.getElementById(arguments[i]);
    if (!x) continue;
    if (x.style.display == "none" || x.style.display == "") {
      x.style.display = display;
    } else {
      x.style.display = "none";
    }
  }

  var e = is_ie ? window.event : this;
  if (e) {
    if (is_ie) {
      e.cancelBubble = true;
      e.returnValue = false;
      return false;
    } else {
      return false;
    }
  }
}

function tog_quote( idnum ) {
  return tog( 'block', 'header_shown_' + idnum, 'header_hidden_' + idnum,
       'hide_' + idnum );
}

</script>
_EOC_
    },
);

## XXX: works for me, probably not for all
has 'specroot' => (
    is => 'rw', isa => 'HashRef',
    default => sub{
        { PDD => 'docs/pdds', S => '../../perl6/doc/trunk/design/syn' }
    },
);

has 'specfiles' => (
    is => 'ro', isa => subtype( 'HashRef'
        => where {
            for my $key ( keys %$_ ) {
                return unless blessed($$_{$key})
                    && $$_{$key}->isa('SpecFiles')
                    && $$_{$key}->prefix eq $key;
            }
            1
        },
    ),
    lazy => 1, default => sub{
        my $self= shift;
        my %hash;
        for( keys %{ $self->specroot } ) {
            $hash{$_}= SpecFiles->new(
                prefix => $_, root => ${ $self->specroot }{$_}
            );
        }
        \%hash
    },
);

has 'testfiles' => (
    is => 'ro', isa => subtype( 'ArrayRef'
        => where { (blessed($_) && $_->isa('TestFile') || return) for @$_; 1 }
    ),
    lazy => 1, default => sub{
        my $self= shift;
        [ map { TestFile->new( filename => $_ ) } <@ARGV> ]
    },
);

has 'linktree' => (
    is => 'ro', isa => 'LinkTree',
    lazy => 1, default => sub{
        my $self= shift;
        my $tree= LinkTree->new;

        for my $file (@{$self->testfiles}) {
            my $in= $file->open( '<' );

            my( $setter, $from, $to );
            my $link;
            while(<$in>) {
                chomp;
                my $new_from;
                if( /^ \s* \#+? \s* (L<.*>) \s* $/xo ) {
                    $link= SmartLink->new( link => $1 );
                    $new_from = $.;
                    $to = $. - 1;
                }
                ## XXX: eliminated two-line smartlink for ease of implementation
                else { next; }

                ## XXX: this logic seems contorted, nay, buggy
                if ($from and $from == $to) {
                    my $old_setter = $setter;
                    my $old_from = $from;
                    $setter = sub {
                        $tree->add_link( $link, $file, $_[0], $_[1] );
                        $old_setter->($old_from, $_[1]);
                    };
                } else {
                    $setter->($from, $to) if $setter and $from;
                    $setter = sub {
                        $tree->add_link($link, $file, $_[0], $_[1] );
                    };
                }
                $from = $new_from;

                $setter->( $from, $. ) if $setter and $from;
                $file->close;
            }
        }
        $tree
    },
);

has 'mergetree' =>(
    is => 'ro', isa => 'HashRef',
    lazy => 1, default => sub{
        my $self= shift;
        my $tree= {};
        for my $spectype ( keys %{ $self->specfiles } ) {
            my $specs= $self->specfiles_of_type( $spectype );
            $specs= $specs->files;
            for my $spec ( @$specs ) {
                my $linkdoc= $self->linktree->get_doc( $spec->name );
                warn $spec->name,$/; # XXX: FIXME: TODO:
                next unless $linkdoc;
                $spec->{_sections}++
            }
        }
        $tree
    },
);

sub specfiles_of_type {
    my $self= shift;
    my( $type )= @_;
    $self->specfiles->{$type}
}

sub emit {
    my $self= shift;
}


package LinkTree;
use Moose;

has 'tree' => ( is => 'rw', isa => 'HashRef', default => sub{ {} }, );

has 'count' => ( is => 'rw', isa => 'Int', default => 0 );

sub inc_link_count { my $self= shift; $self->count( $self->count + 1 ); }

sub get_doc { return shift->{shift} }

sub get_link_doc {
    my $self= shift;
    my( $link )= @_;
    $self->tree->{$link->doc->id}
        if defined $self->tree->{$link->doc->id};
}

sub get_link_section {
    my $self= shift;
    my( $link )= @_;
    my $doc= $self->get_link_doc( $link );
    $doc->{$link->section}
        if defined $doc and defined $doc->{$link->section};
}

sub add_link_doc {
    my $self= shift;
    my( $link )= @_;
    $self->tree->{$link->doc->id}= {}
        unless $self->get_link_doc( $link );
}

sub add_link_section {
    my $self= shift;
    my( $link )= @_;
    $self->add_link_doc( $link );
    my $doc= $self->get_link_doc( $link );
    $doc->{$link->section}= []
        unless defined $doc->{$link->section};
}

sub add_link {
    my $self= shift;
    my( $link, $file, $from, $to )= @_;
    my $tree= $self->tree;

    $self->add_link_section( $link );
    my $section= $self->get_link_section( $link );

    push @$section => [
        $link->keyphrases->string,
        [ $file->name, $from, $to ],
    ];
    $self->inc_link_count;
    $tree
}


$_^=~ { AUTHOR => 'particle' };


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

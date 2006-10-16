package SmartLink;
use Moose;
use Moose::Util::TypeConstraints;

## links are like
# L<doc> or L<doc/section> or L<doc//keyphrases> or L<doc/section/keyphrases>
subtype PodLink => as Str => where { m|^L<([^/]+)(\/([^/]*)){0,2}>| };

has 'link' => ( is => 'ro', isa => 'PodLink', required => 1, );

has 'doc' => (
    is => 'ro', isa => 'Str',
    lazy => 1, default => sub{
        ($_)= shift->link =~ m|^L<([^/]+)|; $_
    },
);

has 'section' => (
    is => 'ro', isa => 'Str',
    lazy => 1, default => sub{
        ($_)= shift->link =~ m|^L<.*?/([^/]+)|; $_
    },
    predicate => 'has_section',
);

has 'keyphrases' => (
    is => 'ro', isa => 'ArrayRef',
    lazy => 1, default => sub{
        ($_)= shift->link =~ m|^L<.*?/.*?/([^>]+)|; [split ' ' => $_]
    },
    predicate => 'has_keyphrases',
);

has 'docprefix' => (
    is => 'ro', isa => 'Str',
    lazy => 1, default => sub{
        ($_)= shift->doc =~ m|^(\D+)|; $_
    },
);

has 'docnum' => (
    is => 'ro', isa => 'Str',
    lazy => 1, default => sub{
        ($_)= shift->doc =~ m|(\d+)$|; $_
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


package PodFile;
use Moose;
use Moose::Util::TypeConstraints;
extends 'File';

override 'extension' => sub{ '.pod' };

has 'tree' => (
    is => 'rw', isa => 'HashRef',
    lazy => 1, default => sub {
        my $self= shift;

        open my $in, '<' => $self->filename
            or die qq{can't open } . $self->filename . qq{ for reading: $!$/};

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


package SpecFile;
use Moose;
extends 'PodFile';

has 'prefix' => ( is => 'ro', isa => 'Str', required => 1, );

has 'num' => (
    is => 'ro', isa => 'Str',
    lazy => 1, default => sub{
        my $self= shift;
# XXX: shouldn't break encapsulation here, but can't get it working otherwise
        ($_)= $self->name =~ m|$self->{prefix}(\d+).*$self->{extension}$|; $_
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
    is => 'ro', isa => 'ArrayRef',
# XXX: why isn't this constraint working? is it evaluated too early?
#    is => 'ro', isa => subtype => ArrayRef
#        => where { (blessed($_) && $_->isa('PodFile') || return) for @$_; 1 },
    lazy => 1, default => sub{
        my $self= shift;
        return [ map { SpecFile->new( filename => $_, prefix => $self->prefix  ) }
            glob catfile( $self->root, $self->prefix . '*' . $self->extension )]
    },
);


package TestFile;
use Moose;
use Moose::Util::TypeConstraints;
extends 'File';

override 'extension' => sub{ '.t' };

has 'smartlinks' => (
    is => 'rw', isa => subtype => ArrayRef
        => where { (blessed($_) && $_->isa('SmartLink') || return) for @$_; 1 },
);

has 'tests' => (
    is => 'rw', isa => subtype ArrayRef
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
    is => 'ro', isa => 'HashRef', default => sub{ return {
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

has 'specroot' => (
    is => 'ro', isa => 'HashRef',
    default => sub{ { PDD => '', S => '' } },
);

has 'specfiles' => (
    is => 'ro', isa => 'SpecFiles',
    lazy => 1, default => sub{
        my $self= shift;
    },
);

has 'testfiles' => (
    is => 'ro', isa => 'ArrayRef',
#    is => 'ro', isa => subtype => ArrayRef
#        => where { (blessed($_) && $_->isa('TestFile') || return) for @$_; 1 },
    lazy => 1, default => sub{
        my $self= shift;
        [ map { TestFile->new( filename => $_ ) } glob @ARGV ]
    },
);


$_^=~ { AUTHOR => 'particle' };


## vim: shiftwidth=4 expandtab

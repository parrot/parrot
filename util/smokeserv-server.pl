#!/usr/bin/perl

use warnings;
use strict;

#HSS use base qw/HTTP::Server::Simple::CGI/;
#HSS use HTTP::Server::Simple::Static;

use CGI;
use CGI::Carp   qw<fatalsToBrowser>;
use Fcntl       qw<:DEFAULT :flock>;
use Storable    qw<store_fd fd_retrieve freeze>;
use Digest::MD5 qw<md5_hex>;
use HTML::Template;
use Algorithm::TokenBucket;
use Time::Piece;
use Time::Seconds;

require_compression_modules();

use constant {
  VERSION     => 0.4,
  MAX_SIZE    => 2**20 * 3.0,  # MiB limit
  BASEDIR     => "/tmp/parrot_smokes/",
  BASEHTTPDIR => "/",
  BUCKET      => "bucket.dat",
  MAX_RATE    => 1 / 30,       # Allow a new smoke all 30s
  BURST       => 5,            # Set max burst to 5
  MAX_SMOKES_OF_SAME_CATEGORY => 5,
};
$CGI::POST_MAX = MAX_SIZE;
chdir BASEDIR or die "Couldn't chdir into \"@{[ BASEDIR ]}\": $!\n";

$SIG{PIPE} = "IGNORE";

my $t = do { local $/; <DATA> };

my $CGI = new CGI;

#sub handle_request {
	#my ($self, $CGI) = @_;

	if ($CGI->url(-path => 1) =~ /html$/) {
	    print $CGI->header;
	    my $file = $CGI->url(-absolute => 1, -path => 1);
	    my $basehttpdir = BASEHTTPDIR;
	    $file =~ s!^$basehttpdir!!;
	    die "Invalid File"
		if $file =~ m!/|\.\.!;
	    if (-e BASEDIR . "/" . $file) {
		open my $f, "<", BASEDIR . "/" . $file or die $!;
		print do { local $/; <$f> };
	    }

	} else {
		if($CGI->param("upload")) {
		  eval { process_upload($CGI) };
		} else {
		  eval { process_list($CGI) };
		}
	} 
#HSS }
#HSS __PACKAGE__->new->run(host => "192.168.2.249");

exit;

sub process_upload {
  my $CGI = shift;
  #print "HTTP/1.0 200 OK\n";
  print $CGI->header;

  limit_rate();
  validate_params($CGI);
  add_smoke($CGI);
  clean_obsolete_smokes();

  print "ok";
}

sub validate_params {
  my $CGI = shift;

  if(not $CGI->param("version") or $CGI->param("version") != VERSION) {
    print "Versions do not match!";
    exit;
  }

  if(not $CGI->param("smoke")) {
    print "No smoke given!";
    exit;
  }

  uncompress_smoke($CGI);
  unless($CGI->param("smoke") =~ /^<!DOCTYPE html/) {
    print "The submitted smoke does not look like a smoke!";
    exit;
  }
}

sub uncompress_smoke {
  my $CGI = shift;
  $CGI->param("smoke",
    Compress::Zlib::memGunzip($CGI->param("smoke")) ||
    Compress::Bzip2::memBunzip($CGI->param("smoke")) ||
    $CGI->param("smoke"));
}

sub require_compression_modules {
  no strict 'refs';
  eval { require Compress::Zlib } or
    *Compress::Zlib::memGunzip = sub { return };
  eval { require Compress::Bzip2 } or
    *Compress::Bzip2::memBunzip = sub { return };
}

sub add_smoke {
  my $CGI = shift;
  my $html = $CGI->param("smoke");

  my $id = md5_hex $html;
  if(glob "parrot-smoke-*-$id.html") {
    print "The submitted smoke was already submitted!";
    exit;
  }

  my %smoke;
  $html =~ /revision: (\d+)/       and $smoke{revision}     = $1;
  $html =~ /duration: (\d+)/       and $smoke{duration}     = $1;
  $html =~ /VERSION: ([\d\.]+)/    and $smoke{VERSION}      = $1;
  $html =~ /branch: ([\w\-]+)/     and $smoke{branch}       = $1;
  $html =~ /cpuarch: ([\w\d]+)/    and $smoke{cpuarch}      = $1;
  $html =~ /osname: ([\w\d]+)/     and $smoke{osname}       = $1;
  $html =~ /cc: ([\w\d]+)/         and $smoke{cc}           = $1;
  $html =~ /DEVEL: -?(\w+)/        and $smoke{DEVEL}        = $1;
  $html =~ /harness_args: (.+)$/m  and $smoke{harness_args} = $1;
  $html =~ /build_dir: (.+)$/m     and $smoke{build_dir}    = $1;
  $html =~ /summary="(\d+) test cases: (\d+) ok, (\d+) failed, (\d+) todo, (\d+) skipped and (\d+) unexpectedly succeeded"/    and $smoke{summary}       = {
    total    => $1,
    ok       => $2,
    failed   => $3,
    todo     => $4,
    skipped  => $5,
    unexpect => $6,
  };

  if(grep { not $smoke{$_} } qw<harness_args revision>) {
    print "The submitted smoke has an invalid format!";
    exit;
  }

  $smoke{runcore}   = runcore_from_args($smoke{harness_args});
  $smoke{revision}  ||= 0;
  $smoke{timestamp} = time;
  $smoke{id}        = $id;
  my $filename      = pack_smoke(%smoke);

  open my $fh, ">", $filename or
    die "Couldn't open \"$filename\" for writing: $!\n";
  print $fh $html or
    die "Couldn't write to \"$filename\": $!\n";
  close $fh or
    die "Couldn't close \"$filename\": $!\n";
}

sub clean_obsolete_smokes {
  my $category = sub {
    return join "-",
      (map { $_[0]->{$_} } qw<branch cpuarch osname cc runcore harness_args>),
      $_[0]->{DEVEL} eq "devel" ? "dev" : "release",
  };

  my %cats;
  my @smokes = map { unpack_smoke($_) } glob "parrot-smoke-*.html";
  push @{ $cats{$category->($_)} }, $_ for @smokes;

  $cats{$_} = [
    (sort {
      $b->{revision} <=> $a->{revision} ||
      $b->{timestamp}[0]  <=> $a->{timestamp}[0]
    } @{ $cats{$_} })
    [0..MAX_SMOKES_OF_SAME_CATEGORY-1]
  ] for keys %cats;

  my %delete = map { $_->{filename} => 1 } @smokes;
  for(map { @$_ } values %cats) {
    next unless $_;

    delete $delete{$_->{filename}};
  }

  unlink keys %delete;
}

sub process_list {
  my $CGI = shift;
  my $tmpl = HTML::Template->new(scalarref => \$t, die_on_bad_params => 0);

  #print "HTTP/1.0 200 OK\n";
  print $CGI->header;

  my $category = sub {
    return sprintf "%s / %s runcore on %s-%s-%s",
      $_[0]->{DEVEL} eq "devel" ? "repository snapshot" : "release",
	  runcore2human($_[0]->{runcore}),
	  $_[0]->{cpuarch},
      $_[0]->{osname},
      $_[0]->{cc},
  };

  my @smokes  = map { unpack_smoke($_) } glob "parrot-smoke-*.html";
  my %branches;
  push @{ $branches{$_->{branch}}{$category->($_)} }, $_ for @smokes;

  foreach my $branch (keys %branches) {
    foreach my $cat   (keys %{ $branches{$branch} }) {
      $branches{$branch}{$cat} = [
        map  {{ %$_, timestamp => $_->{timestamp}[1] }}
        sort {
          $b->{revision} <=> $a->{revision} ||
          lc $a->{osname}     cmp lc $b->{osname}     ||
          $b->{timestamp}[0]  <=> $a->{timestamp}[0]
        } @{ $branches{$branch}{$cat} }
      ];
    }

    $branches{$branch} = [
      map {{
        catname => $_,
        smokes  => $branches{$branch}{$_},
      }} sort { lc $a cmp lc $b } keys %{ $branches{$branch} }
    ];
  }

  $tmpl->param(branches => my $p = [
    map {{
      name       => $_,
      categories => $branches{$_},
    }} sort {
		($a eq "trunk" ? -1 : 0) ||
		($b eq "trunk" ? 1 : 0) ||
		($a cmp $b)
	} keys %branches
  ]);
  print $tmpl->output;
}

sub pack_smoke {
  my %smoke = @_;

  my $summary = join("-", map { $smoke{summary}{$_} } qw<total ok failed todo skipped unexpect>);
  my $args = unpack("H*", $smoke{harness_args});

  #                           1       2          3        4         5        6         7      8           9        10          ...
  my $str = "parrot-smoke-<VERSION>-<DEVEL>-r<revision>-<branch>--<cpuarch>-<osname>-<cc>-<runcore>--<timestamp>-<duration>--$summary--$args--<id>.html";

  $str =~ s/<(.+?)>/$smoke{$1}/g;

  $str;
}

sub unpack_smoke {
  my $name = shift;

  /^parrot-smoke-([\d\.]+)	#  1 VERSION
                -(\w+)		#  2 DEVEL
                -r(\d+)		#  3 revision
                -([\w\-]+)	#  4 branch
               --([\w\d]+)	#  5 cpuarch
                -([\w\d]+)	#  6 osname
                -([\w\d]+)	#  7 cc
                -(\w+)		#  8 runcore
               --(\d+)		#  9 timestamp
                -(\d+)		# 10 duration
               --(\d+)		# 11	total
                -(\d+)		# 12	ok
                -(\d+)		# 13	failed
                -(\d+)		# 14	todo
                -(\d+)		# 15	skipped
                -(\d+)		# 16	unexpected
               --([a-f0-9]+)	# 17    harness_args
               --([a-f0-9]+)	# 18	id
   .html$/x
    and return {
	  VERSION       => $1,
	  DEVEL         => $2,
      revision      => $3,
	  branch		=> $4,
	  cpuarch       => $5,
      osname        => $6,
      cc            => $7,
      runcore       => $8,
      timestamp     => [
        $9,
        do { 
          my $str = localtime($9)->strftime("%d %b %Y %H:%M %a");
          $str =~ s/ /&nbsp;/g;
          # hack, to make the timestamps not break so the smoke reports look
          # good even on 640x480
          $str;
        },
      ],
      duration      => sprintf("%.02f", Time::Seconds->new($10)->minutes) . "&nbsp;min",
      summary       => [{
        total       => $11,
        ok          => $12,
        failed      => $13,
        todo        => $14,
        skipped     => $15,
        unexpect    => $16,
      }],
      percentage    => sprintf("%.02f", $12 / ($11||1) * 100),
	  harness_args  => pack("H*", $17),
      id            => $18,
      filename      => $name,
      link          => BASEHTTPDIR . $name, 
    };
  return ();
}

sub runcore2human {
  my %runcore = (
	  goto => "computed goto",
	  jit => "JIT",
	  cgp =>  "CGP",
	  switch => "switch",
	  fast => "fast",
	  default => "default",
  );

  $runcore{$_[0]};
}

sub runcore_from_args {
  local $_ = shift;

  /-g/ and return "goto";
  /-j/ and return "jit";
  /-C/ and return "cgp";
  /-S/ and return "switch";
  /-f/ and return "fast";
  return "default";
}

# Rate limiting
sub limit_rate {
  # Open the DB and lock it exclusively. See perldoc -q lock.
  sysopen my $fh, BUCKET, O_RDWR|O_CREAT
    or die "Couldn't open \"@{[ BUCKET ]}\": $!\n";
  flock $fh, LOCK_EX
    or die "Couldn't flock \"@{[ BUCKET ]}\": $!\n";

  my $data   = eval { fd_retrieve $fh };
  $data    ||= [MAX_RATE, BURST];
  my $bucket = Algorithm::TokenBucket->new(@$data);

  my $exit;
  unless($bucket->conform(1)) {
    print "Rate limiting -- please wait a bit and try again, thanks.";
    $exit++;
  }
  $bucket->count(1);

  seek     $fh, 0, 0  or die "Couldn't rewind \"@{[ BUCKET ]}\": $!\n";
  truncate $fh, 0     or die "Couldn't truncate \"@{[ BUCKET ]}\": $!\n";

  store_fd [$bucket->state] => $fh or
    die "Couldn't serialize bucket to \"@{[ BUCKET ]}\": $!\n";

  exit if $exit;
}

__DATA__
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
  "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <title>Parrot Smoke Reports</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <style type="text/css">
    body {
      background-color: white;
      margin:           0;

      font-family: sans-serif;
      line-height: 1.3em;
      font-size:   95%;
    }

    h1, h2 {
      background-color: #313052;
      color:            white;
      padding:          10px;
    }

    th       { text-align: left; }
    .indent0 { padding-top:  30px; border-bottom: 2px solid #313052; }
    .indent1 { padding-top:  10px; border-bottom: 1px solid #313052; }
    .indent2 { padding-left: 40px; }
    .indent3 { padding-left: 80px; padding-bottom: 10px; }

    p, dl, pre, table { margin:      15px; }
    dt    { font-weight: bold; }
    dd+dt { margin-top:  1em;  }
    .leftsep  { padding-left: 10px;  }
    .num      { text-align:   right; }

    .details  { display: none; }
    .expander { color: blue; cursor: pointer; }  /* hack? */

    .tests_ok       { color: #050; }
    .tests_failed   { color: #500; }
    .tests_todo     { color: #030; }
    .tests_skipped  { color: #555; }
    .tests_unexpect { color: #550; }
  </style>

  <script type="text/javascript">//<![CDATA[[
    function toggle_visibility (id) {
      var elem     = document.getElementById("details_"  + id),
          expander = document.getElementById("expander_" + id);
      if(elem.className == "details") {
	elem.className = "";  /* hack? */
	expander.innerHTML = "&laquo;";
      } else {
	elem.className = "details";
	expander.innerHTML = "&raquo;";
      }
    }
  //]]></script>
</head>

<body>
  <h1>Parrot Smoke Reports</h1>

  <p>
    Here's a list of recently submitted <a
    href="http://www.parrotcode.org/">Parrot</a> smoke reports. These smokes are
    automatically generated and show how various runcores are functioning across
    a variety of platforms. Individual languages targetting parrot (e.g. tcl),
    are also available.
  </p>

  <p>
    Submitting your own smoke is easy,
  </p>
    
  <pre class="indent2">$ make smoke
</pre>
    
  <p>
    should suffice. To test the languages that are shipped with parrot, change
    to the languages directory and issue the same command.
  </p>

  <p>
    Note that old smoke reports are automatically deleted, so you may not want
    to link directly to a smoke.
  </p>
    
  <p> 
    Note: Timezone is UTC.<br />
  </p>

  <table>
    <tmpl_loop name=branches>
      <tr><th colspan="11" class="indent0"><tmpl_var name=name></th></tr>
      <tmpl_loop name=categories>
        <tr><th colspan="12" class="indent1"><tmpl_var name=catname></th></tr>
        <tmpl_loop name=smokes>
          <tr>
            <td class="indent2">Parrot&nbsp;<tmpl_var name=VERSION></td>
            <td>
              <tmpl_if name=revision>
                r<tmpl_var name=revision>
              </tmpl_if>
            </td>
            <td class="leftsep"><tmpl_var name=timestamp></td>
			<td class="leftsep"><tmpl_var name=harness_args></td>
            <td class="leftsep num"><tmpl_var name=duration></td>
            <td class="leftsep num"><tmpl_var name=percentage>&nbsp;%&nbsp;ok</td>
	    <tmpl_loop name=summary>
	      <td class="leftsep num tests_total"><tmpl_var name=total>:</td>
	      <td class="num tests_ok"><tmpl_var name=ok>,</td>
	      <td class="num tests_failed"><tmpl_var name=failed>,</td>
	      <td class="num tests_todo"><tmpl_var name=todo>,</td>
	      <td class="num tests_skipped"><tmpl_var name=skipped>,</td>
	      <td class="num tests_unexpect"><tmpl_var name=unexpect></td>
	    </tmpl_loop>
	    <td><span title="Details" class="expander" onclick="toggle_visibility('<tmpl_var name=id>')" id="expander_<tmpl_var name=id>">&raquo;</span></td>
	    <td><a style="text-decoration: none" href="<tmpl_var name=link>" title="Full smoke report">&raquo;</a></td>
          </tr>
          <tr class="details" id="details_<tmpl_var name=id>">
            <td colspan="12" class="indent3">
              <tmpl_loop name=summary>
                <span class="tests_total"><tmpl_var name=total> test cases</span>:<br />
		<span class="tests_ok"><tmpl_var name=ok> ok</span>,
		<span class="tests_failed"><tmpl_var name=failed> failed</span>,
		<span class="tests_todo"><tmpl_var name=todo> todo</span>,<br />
                <span class="tests_skipped"><tmpl_var name=skipped> skipped</span> and
		<span class="tests_unexpect"><tmpl_var name=unexpect> unexpectedly succeeded</span>
              </tmpl_loop><br />
              <a href="<tmpl_var name=link>" title="Full smoke report">View full smoke report</a>
            </td>
          </tr>
        </tmpl_loop>
      </tmpl_loop>
    </tmpl_loop>
  </table>
</body>
</html>

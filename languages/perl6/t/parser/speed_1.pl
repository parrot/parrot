#################### rfc73 (pgm 5) ####################
print(scalar(localtime()));
#######################################################
#################### basic assign (pgm 1) ####################
$a=1
##############################################################

;
#################### basic assign (pgm 2) ####################
 $a = 1 
##############################################################

;
#################### basic assign (pgm 3) ####################
$a=1;
##############################################################

#################### basic assign (pgm 4) ####################
# some comment
   $a=# more commant
1#and more
########
##############################################################

;
#################### basic assign (pgm 5) ####################
# some comment
   $a=# more commant
1#and more
########

##############################################################

;
#################### basic if (pgm 1) ####################
if (1) {}
##########################################################

#################### basic if (pgm 2) ####################
if 1 {}
##########################################################

#################### basic if-else (pgm 1) ####################
if (1) {} else {}
###############################################################

#################### basic if-else (pgm 2) ####################
if 1 {} else {}
###############################################################

#################### basic if-elseif (pgm 1) ####################
if (1) {} elsif (2) {}
#################################################################

#################### basic if-elseif (pgm 2) ####################
if 1 {} elsif (2) {}
#################################################################

#################### basic if-elseif (pgm 3) ####################
if (1) {} elsif 2 {}
#################################################################

#################### basic if-elseif (pgm 4) ####################
if 1 {} elsif 2 {}
#################################################################

#################### multiple statements (pgm 1) ####################
if (1) {
          }
          $a = 2;
         
#####################################################################

#################### multiple statements (pgm 2) ####################
if (1) {}
          $a = 2;
         
#####################################################################

#################### multiple statements (pgm 3) ####################
if 1 {}
          $a = 2;
         
#####################################################################

#################### multiple statements (pgm 4) ####################
if 1 {}
          # a comment
          $a = 2;
         
#####################################################################

#################### multiple statements (pgm 5) ####################
if (1) {} # a comment
          $a = 2;
         
#####################################################################

#################### Exegesis 2 (pgm 1) ####################
# bintree - binary tree demo program 
# adapted from "Perl Cookbook", Recipe 11.15

use strict;
use warnings;
my ($root, $n);

while ($n++ < 20) { insert($root, int rand 1000) }

# XXX: is constant
# my int ($pre, $in, $post) is constant = (0..2);

print "Pre order:  "; show($root,$pre);  print "\n";
print "In order:   "; show($root,$in);   print "\n";
print "Post order: "; show($root,$post); print "\n";

# XXX: is chomped
# $*ARGS is chomped;
# XXX: prompts
# $ARGS prompts("Search? ");
while (<$ARGS>) {
    if (my $node = search($root, $_)) {
        print "Found $_ at $node: $node{VALUE}\n";
        print "(again!)\n" if $node{VALUE}.Found > 1;
    }
    else {
        print "No $_ in tree\n";
    }
}

# XXX:
# exit;

#########################################

sub insert (HASH $tree is rw, int $val) {
    unless ($tree) {
        my %node;
# XXX: undef
#        %node{LEFT}   = undef;
#        %node{RIGHT}  = undef;
# XXX: is Found
#        %node{VALUE}  = $val is Found(0);
        $tree = %node;
        return;
    }
    if    ($tree{VALUE} > $val) { insert($tree{LEFT},  $val) }
    elsif ($tree{VALUE} < $val) { insert($tree{RIGHT}, $val) }
    else                        { warn "dup insert of $val\n" }
}

sub show {
    return unless @_[0];
    show(@_[0]{LEFT}, @_[1]) unless @_[1] == $post;
    show(@_[0]{RIGHT},@_[1])     if @_[1] == $pre;
    print @_[0]{VALUE};
    show(@_[0]{LEFT}, @_[1])     if @_[1] == $post;
    show(@_[0]{RIGHT},@_[1]) unless @_[1] == $pre;
}

sub search (HASH $tree is rw, *@_) {
    return unless $tree;
    return search($tree{@_[0]<$tree{VALUE} && "LEFT" || "RIGHT"}, @_[0])
        unless $tree{VALUE} == @_[0];
# XXX: is Found
#    $tree{VALUE} is Found($tree{VALUE}.Found+1);
    return $tree;
}


############################################################

#################### Exegesis 2 (pgm 2) ####################
use strict;
use warnings;
my ($root, $n);

while ($n++ < 20) { insert($root, int rand 1000) }

my ($pre, $in, $post) = (0..2);

print "Pre order:  "; show($root,$pre);  print " \n";
print "In order:   "; show($root,$in);   print " \n";
print "Post order: "; show($root,$post); print " \n";

for (print "Search? "; <$ARGS>; print "Search? ") {
# XXX
#    chomp;
    if (my $node = search($root, $_)) {
        print "Found $_ at $node: $node{VALUE}\n";
        print "(again!)\n" if $node{FOUND} > 1;
    }
    else {
        print "No $_ in tree\n";
    }
}

# XXX
# exit;

#########################################

sub insert {
    unless (@_[0]) {
# XXX: undef
#         @_[0] = { LEFT  => undef, RIGHT => undef,
#                   VALUE => @_[1], FOUND => 0,
#                 };
        return;
    }
    if    (@_[0]{VALUE} > @_[1]) { insert(@_[0]{LEFT},  @_[1]) }
    elsif (@_[0]{VALUE} < @_[1]) { insert(@_[0]{RIGHT}, @_[1]) }
    else                         { warn "dup insert of @_[1]\n"  }
}

sub show  {
    return unless @_[0];
    show(@_[0]{LEFT}, @_[1]) unless @_[1] == $post;
    show(@_[0]{RIGHT},@_[1])     if @_[1] == $pre;
    print @_[0]{VALUE};
    show(@_[0]{LEFT}, @_[1])     if @_[1] == $post;
    show(@_[0]{RIGHT},@_[1]) unless @_[1] == $pre;
}

sub search {
    return unless @_[0];
    return search(@_[0]{@_[1]<@_[0]{VALUE} && "LEFT" || "RIGHT"}, @_[1])
        unless @_[0]{VALUE} == @_[1];
    @_[0]{FOUND}++;
    return @_[0];
}

############################################################

#################### Exegesis 3 ####################

    sub load_data ($filename ; $version, *@dirpath) {
        $version //= 1;
        @dirpath //= @last_dirpath // @std_dirpath // '.';
        @dirpath ^=~ s{([^/])$}{$1/};

        my %data;
        foreach my $prefix (@dirpath) {
            my $filepath = $prefix _ $filename;
            if (-w -r -e $filepath  and  100 < -s $filepath <= 1e6) {
                my $fh = open $filepath : mode=>'rw' 
                    or die "Something screwy with $filepath: $!";
                my ($name, $vers, $status, $costs) = <$fh>;
                next if $vers < $version;
                $costs = [split /\s+/, $costs];
                %data{$filepath}{qw(fh name vers stat costs)} = <$fh>;
                next if $vers < $version;
                $costs = [split /\s+/, $costs];
                %data{$filepath}{qw(fh name vers stat costs)} =
                                ($fh, $name, $vers, $status, $costs);
            }
        }
        return %data;
    }

    my @StartOfFile is const = (0,0);

    sub save_data ( %data) {
        foreach my $data (values %data) {
# XXX: undef
#            my $rest = <$data.{fh}.irs(undef)>;
            seek $data.{fh}: *@StartOfFile;
            truncate $data.{fh}: 0;
            $data.{fh}.ofs("\n");
            print $data.{fh}: $data.{qw(name vers stat)}, _@{$data.{costs}}, $rest;
         }
    }

    my %data = load_data(filename=>'weblog', version=>1);

    my $is_active_bit is const = 0x0080;

    foreach my $file (keys %data) {
        print "$file contains data on %data{$file}{name}\n";

        %data{$file}{stat} = %data{$file}{stat} ~ $is_active_bit;

        my @costs := @%data{$file}{costs};

        my $inflation;
# XXX: NaN
#        print "Inflation rate: " and $inflation = +<>
#            until $inflation != NaN;

        @costs = map  { $_.value }
                 sort { $a.key <=> $b.key }
                 map  { amortize($_) => $_ }
                        @costs ^* $inflation;

# XXX: 'sum' should be unicode char
# XXX: reduce not defined (missing , below?)
# XXX: can't parse \&operator:+($)
#         my sub operator:sum is prec(\&operator:+($))
#                                   (*@list : $filter //= undef) {
#            reduce {$^a+$^b}  ($filter ?? grep &$filter, @list :: @list);
#         }

        print "Total expenditure: $( sum @costs )\n";
        print "Major expenditure: $( sum @costs : {$^_ >= 1000} )\n";
        print "Minor expenditure: $( sum @costs : {$^_ < 1000} )\n";

# XXX: Inf
#        print "Odd expenditures: @costs[1..Inf:2]\n"; 
    }

    save_data(%data, log => {name=>'metalog', vers=>1, costs=>[], stat=>0});

####################################################

#################### Exe 4 ####################
    class Err::BadData is Exception {...}
    
    module Calc;
    
    my class NoData is Exception {
        method warn(*@args) { die @args }
    }
    
    my %var;
    
    my sub get_data ($data) {
        given $data {
            when /^\d+$/    { return %var{""} = $_ }
            when 'previous' { return %var{""} // fail NoData }
            when %var       { return %var{""} = %var{$_} }
            default         { die Err::BadData : msg=>"Don't understand $_" }
        }  
    }
    
    sub calc (str $expr, int $i) {
        our %operator is private //= (
            '*'  => { $^a * $^b },
            '/'  => { $^a / $^b },
            '~'  => { ($^a + $^b) / 2 },
        );
        
        my @stack;
        my $toknum = 1;
        for split /\s+/, $expr -> $token {
            try {
                when %operator {
                    my @args = splice @stack, -2;
                    push @stack, %operator{$token}(*@args)
                }
                when '.', ';', '=' {
                    last
                }
                
                use fatal;
                push @stack, get_data($token);
                
                CATCH {
# XXX: missing Err::Reportable, Err::BadData, NoData
#                    when Err::Reportable     { warn $!; continue }
#                    when Err::BadData        { $!.fail(at=>$toknum) }
#                    when NoData              { push @stack, 0 }
# XXX: Inf
#                    when /division by zero/  { push @stack, Inf }
                }
            }
            
            NEXT { $toknum++ }
        }

        fail Err::BadData: msg=>"Too many operands" if @stack > 1;
        return %var{'$' _ $i} = pop(@stack) but true;
    }
    
    module main;

# XXX: Inf    
#    for 1..Inf -> $i {
    for 1..10000 -> $i {
        print "$i> ";
        my $expr = <> err last;  
        print "$i> $( Calc::calc(i=>$i, expr=>$expr) )\n";
    }

###############################################

#################### something similar (pgm 1) ####################
use warnings;

# XXX: shift
#$code = shift
#   or die "usage: $0 code [file ...]\n";
# XXX: eval
#$process =
#   eval "sub { my \$_ = shift; $code }";
die if $!;

# XXX: glob
#@ARGS = map { glob } @ARGS;

while (<>) {
  if (/^From /) {
    $process($msg) if $msg;
    $msg = '';
  }
  $msg _= $_;
}
$process($msg) if $msg;


###################################################################

#################### something similar (pgm 2) ####################
sub action { print "@_[0]\n"; system @_[1] }

foreach my $file ( @ARGS ) {
   my $original = $file;

# XXX: s///
#   if ($file =~ s/[.](uu)$//) {
if 1 {
      action "unuu'ing $file.$1",
             "uudecode $file.$1";
   }

# XXX: s///
#   if ($file =~ s/[.](t?gz)$//) {
if 2 {
      action "gunzip'ing $file.$1",
             "gunzip $file.$1";
      $file _= ".tar" if $1 eq 'tgz';
   }

   my ($to, $enbundle, $relfile) =
             bundling_for($file, $original);

   action "untar'ing $file $to",
          "$enbundle tar -xpf $relfile";
}

sub bundling_for {
   my ($file, $dir) = @_;
   chomp(my @files =
         ($FILELIST = open("tar t <$file|"))
          && <$FILELIST>);
   return ("(no contents)", "", $file)
      if !@files;
   return ("to @files[0]",  "", $file)
      if @files == 1 ||
         @files[0] =~ m{/$} &&
            !grep {$_ !~ /^\Q@files[0]/}
# XXX [1..]
#                  @files[1..];
                  @files[1..10000];
   $dir _= ".CONTENTS";
   return ("to $dir",
           "mkdir $dir; cd $dir;",
           "../$file");
}


###################################################################

#################### something similar (pgm 3) ####################
my %translate = (
       "\r" => "\n",
   chr(128) => q{A},
   chr(129) => q{A},
   chr(130) => q{C},
   chr(131) => q{E},
   chr(132) => q{N},
   chr(133) => q{O},
   chr(176) => q{[inf]},
   chr(177) => q{[+-]},
   chr(178) => q{<=},
   chr(179) => q{>=},
   chr(180) => q{[JPY]},
   chr(249) => q{},
   chr(250) => q{},
   chr(251) => q{},
   chr(252) => q{},
   chr(253) => q{},
   chr(254) => q{},
   chr(255) => q{},
);

while (<>) {
# XXX: s///
#    s{(.)}
#     { defined %translate{$1}
#            ?? %translate{$1}
#            :: $1
#     }ges;
    print;
}


###################################################################

#################### something similar (pgm 4) ####################
use strict;
# XXX: shift
# my $from = shift;
# my $to   = shift;
my($ffrom, $fto, $file);

foreach $file (@ARGS) {
   next unless -l $file;
   $ffrom = readlink $file;
   unless (defined $ffrom) {
      warn "$file: $!\n";
      next;
   }
# XXX: s///
#   if (($fto = $ffrom) =~ s/$from/$to/) {
if 1 {
      unlink $file;
      if (symlink $fto, $file) {
         print "$file: $ffrom -> $fto\n";
      } else {
         warn "Couldn't create link $file: ",
              "$ffrom -> $fto: $!\n";
      }
   }
}


###################################################################

#################### something similar (pgm 5) ####################
my $section_type = 'text';

sub start($type, $intro) {
   unless ($section_type eq $type) {
      print $intro;
      $section_type = $type;
   }
}

loop: while(<>) {
   given ($_) {
# XXX: semicolon
#      when /^\s*$/ : { print; }
      when /^\s*$/ { print; }
# XXX: s///
#      when s/^[*]{3}\s+// : {
	when "foo" {
         start('list', "\n=over\n");
         print "\n=item $_\n";
      }

      start('text', "\n=back\n\n")
         if $section_type eq 'list';

# XXX: s///
#      when s/^([*]{1,2})\s+// : {
	when "bar" {
         start('text', "\n");
         print "=head", length($1), " $_\n";
      }
# XXX: semicolon
#      when /^\s/ : {
      when /^\s/  {
         start('formatted', "\n");
         print;
      }
# XXX: else
#      else {
       default {
         start('text', "\n");
         print;
      }
   }
   print;
}


###################################################################

#################### something similar (pgm 6) ####################
my $section_type = 'text';

sub start {
   my ($type, $intro) = @_;
   unless ($section_type eq $type) {
      print $intro;
      $section_type = $type;
   }
}

loop: while(<>) {
   print and next loop if /^\s*$/;

   if (s/^[*]{3}\s+//) {
      start('list', "\n=over\n");
      print "\n=item $_\n";
      next loop;
   }

   start('text', "\n=back\n\n")
      if $section_type eq 'list';

   if (s/^([*]{1,2})\s+//) {
      start('text', "\n");
      print "=head", length($1), " $_\n";
      next loop;
   }
   elsif (/^\s/) {
      start('formatted', "\n");
   }
   else {
      start('text', "\n");
   }
   print;
}

###################################################################

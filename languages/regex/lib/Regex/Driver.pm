package Regex::Driver;
use strict;

sub new {
    my ($class, $language, %options) = @_;

    if ($language eq 'perl5') {
        $class = 'Regex::Driver::Perl5';
    } elsif ($language eq 'pir') {
        $class = 'Regex::Driver::PIR';
    }

    my $self = bless \%options, $class;
    $self->init();

    return $self;
}

sub init {
}

sub output_header {
}

sub output_rule {
    my ($self, $fh, $subname, $rule, $ctx, %options) = @_;

    my $code = Regex::tree_to_list($rule, $ctx, 'regex_done', 'regex_done',
                                   %options);

    my @asm = Regex::list_to_pasm($code, $ctx, %options);

    $self->output_rule_body($fh, $subname, $rule, $ctx, \@asm);
}

sub output_footer {
}

package Regex::Driver::Perl5;
our @ISA = qw(Regex::Driver);

sub output_header {
    my ($self, $fh) = @_;
    print $fh "use strict;\n";
}

sub output_rule_body {
    my ($self, $fh, $subname, $rule, $ctx, $instructions) = @_;

    if ($subname) {
        print $fh <<"END";
sub $subname {
    my (\$rx_input) = \@_;
END
    }
    print $fh "$_\n" foreach (@$instructions);
}

sub output_footer {
    my ($self, $fh) = @_;
    return 1 unless $self->{emit_main};

    print $fh <<'END';
sub reduce {
    my ($m, $input) = @_;
    return if ! $m->{'!RESULT'};
    my %r;
    while (my ($k, $v) = each %$m) {
      next if $k =~ /^!/;
      if (UNIVERSAL::isa($v, 'ARRAY')) {
        if (@$v == 2 && $v->[1] != -2) {
          $r{$k} = substr($input, $v->[0], $v->[1] - $v->[0] + 1);
        }
      } else {
        $r{$k} = reduce($v, $input);
      }
    }
    return \%r;
}
sub match {
  my ($input) = @_;
  my $m = _rule_default(1, $input, 0, []);
use Data::Dumper;
print Data::Dumper->Dump([$m],["*DEFAULT_RULE_MATCH"]);
  return reduce($m, $input);
}
sub minimatch {
  my ($m, $name) = @_;
  $name ||= 'ALL';
  my $res = [ "$name=$m->{0}" ];
  while (my ($name, $match) = each %$m) {
    push @$res, minimatch($match, $name) if $name !~ /^\d+$/;
  }
  return $res;
}
my $m = match($ARGV[0]);
$Data::Dumper::Sortkeys = 1;
use Data::Dumper;
print Data::Dumper->Dump([$m],["*MATCH_OBJECT"]);
my $mini = minimatch($m);
print Data::Dumper->Dump([$mini],["*CAPTURES"]);
END
}

package Regex::Driver::PIR;
our @ISA = qw(Regex::Driver);

sub output_header {
    my ($self, $fh) = @_;
    $self->SUPER::output_header($fh);
    return 1 unless $self->{emit_main};

    print $fh <<'END';
.sub _main @MAIN
    .param pmc args
    .local string input_string
    input_string = args[1]

    $P0 = loadlib "match_group"

    .local pmc regex_sub
    .local pmc result
    .local int matched
    .local pmc stack
    stack = new PerlArray
    regex_sub = newsub _default
    result = regex_sub(1, input_string, 0, stack)
    matched = result["!RESULT"]
    if matched goto printResults

printMatchFailed:
    print "Match failed\n"
    goto done
printResults:
    print "Match found\n"
    .local int num_groups
    .local int match_num
    .local int ii
    .local int valid_flag
    set num_groups, result["!GROUPS"]
    set match_num, 0
printLoop:
    ge match_num, num_groups, done
    bsr printGroup
    inc match_num
    goto printLoop
done:
    .return ()

printGroup:
    .local int match_start
    .local int match_end
    set match_start, result[match_num;0]
    set match_end, result[match_num;1]
    eq match_start, -2, skipPrint
    eq match_end, -2, skipPrint
    print match_num
    print ": "
    print match_start
    print ".."
    print match_end
    print "\n"
skipPrint:
    set valid_flag, 1
    ret
.end
END
}

sub output_rule_body {
    my ($self, $fh, $subname, $rule, $ctx, $instructions) = @_;
    print $fh join("\n", @$instructions), "\n";
}

sub output_footer {
    my ($self, $fh) = @_;

    my $subname = $self->{subname} || '_regex';
    print $fh <<"END";
.sub $subname
    .param string rx_input

    .local pmc rx_match
    .local pmc rx_stack
    rx_stack = new IntList
    rx_match = _default(1, rx_input, 0, rx_stack)
    .return (rx_match)
    end
.end
END

}

1;

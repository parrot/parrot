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

# FIXME! This is only valid for a manual test program!
sub output_footer {
    my ($self, $fh) = @_;

    #     print OUTPUT "\nmy \$m = _rule_default(1, \$ARGV[0], 0);\n";
    #     print OUTPUT "use Data::Dumper;\n";
    #     print OUTPUT "print Dumper(\$m);\n";
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
print Dumper($m);
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
print Dumper($m);
my $mini = minimatch($m);
use Data::Dumper;
print Dumper($mini);
END
}

package Regex::Driver::PIR;
our @ISA = qw(Regex::Driver);

sub output_rule_body {
    my ($self, $fh, $subname, $rule, $ctx, $instructions) = @_;
    print $fh join("\n", @$instructions), "\n";
}

1;

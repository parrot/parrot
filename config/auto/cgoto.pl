package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description="Determining if your compiler supports computed goto...";

@args=qw(cgoto miniparrot);

sub runstep {
  my $test;
  my ($cgoto, $miniparrot) = @_;

  $cgoto = 0 if (defined $miniparrot);

  if (defined $cgoto) {
    $test = $cgoto;
  }
  else {
    cc_gen('config/auto/cgoto/test_c.in');
    $test=eval { cc_build(); 1; } || 0;
    cc_clean();
  }

  if ($test) {
    Configure::Data->set(
      cg_h          => '$(INC)/oplib/core_ops_cg.h $(INC)/oplib/core_ops_cgp.h',
      cg_c          => <<'EOF',
core_ops_cg$(O): $(GENERAL_H_FILES) core_ops_cg.c
core_ops_cgp$(O): $(GENERAL_H_FILES) core_ops_cgp.c

core_ops_cg.c $(INC)/oplib/core_ops_cg.h: $(OPS_FILES) ops2c.pl lib/Parrot/OpsFile.pm lib/Parrot/Op.pm lib/Parrot/OpTrans/CGoto.pm
	$(PERL) ops2c.pl CGoto --core
core_ops_cgp.c $(INC)/oplib/core_ops_cgp.h: $(OPS_FILES) ops2c.pl lib/Parrot/OpsFile.pm lib/Parrot/Op.pm lib/Parrot/OpTrans/CGP.pm
	$(PERL) ops2c.pl CGP --core
EOF
      cg_o          => 'core_ops_cg$(O) core_ops_cgp$(O)',
      cg_r          => '$(RM_F) $(INC)/oplib/core_ops_cg.h core_ops_cg.c \
                                $(INC)/oplib/core_ops_cgp.h core_ops_cgp.c',
      cg_flag       => '-DHAVE_COMPUTED_GOTO'
    );
  }
  else {
    Configure::Data->set(
      cg_h    => '',
      cg_c    => '',
      cg_o    => '',
      cg_r    => '',
      cg_flag => ''
    );
  }
}

1;

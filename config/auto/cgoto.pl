package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description="Determining if your compiler supports computed goto...";

@args=qw(cgoto);

sub runstep {
  my $test;

  if(defined $_[0]) {
    $test=$_[0];
  }
  else {
    cc_gen('config/auto/cgoto/test_c.in');
    $test=eval { cc_build(); 1; } || 0;
    cc_clean();
  }
 
  if ($test) {
    Configure::Data->set(
      cg_h          => '$(INC)/oplib/core_ops_cg.h',
      cg_c          => <<'EOF',
core_ops_cg$(O): $(GENERAL_H_FILES) core_ops_cg.c

core_ops_cg.c $(INC)/oplib/core_ops_cg.h: $(OPS_FILES) ops2cgc.pl lib/Parrot/OpsFile.pm lib/Parrot/Op.pm
	$(PERL) ops2cgc.pl CGoto $(OPS_FILES)
EOF
      cg_o          => 'core_ops_cg$(O)',
      cg_r          => '$(RM_F) $(INC)/oplib/core_ops_cg.h core_ops_cg.c',
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
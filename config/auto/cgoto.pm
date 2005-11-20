# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/cgoto.pl - Computed C<goto>

=head1 DESCRIPTION

Determines whether the compiler supports computed C<goto>.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';

$description = "Determining whether your compiler supports computed goto...";
@args = qw(cgoto miniparrot verbose);

sub runstep {
    my ($cgoto, $miniparrot, $verbose) = @_;

    return if $miniparrot;

    my $test;
    if (defined $cgoto) {
        $test = $cgoto;
    }
    else {
        cc_gen('config/auto/cgoto/test_c.in');
        $test = eval { cc_build(); 1; } || 0;
        cc_clean();
    }

    if ($test) {
        Parrot::Configure::Data->set(
            TEMP_cg_h => '$(INC_DIR)/oplib/core_ops_cg.h $(INC_DIR)/oplib/core_ops_cgp.h',
            TEMP_cg_c => <<'EOF',
$(OPS_DIR)/core_ops_cg$(O): $(GENERAL_H_FILES) $(OPS_DIR)/core_ops_cg.c
$(OPS_DIR)/core_ops_cgp$(O): $(GENERAL_H_FILES) $(OPS_DIR)/core_ops_cgp.c
$(SRC_DIR)/runops_cores.c: $(INC_DIR)/oplib/core_ops_cgp.h

$(OPS_DIR)/core_ops_cg.c $(INC_DIR)/oplib/core_ops_cg.h: $(OPS_FILES) $(BUILD_TOOLS_DIR)/ops2c.pl lib/Parrot/OpsFile.pm lib/Parrot/Op.pm lib/Parrot/OpTrans/CGoto.pm lib/Parrot/OpLib/core.pm
	$(PERL) $(BUILD_TOOLS_DIR)/ops2c.pl CGoto --core
$(OPS_DIR)/core_ops_cgp.c $(INC_DIR)/oplib/core_ops_cgp.h: $(OPS_FILES) $(BUILD_TOOLS_DIR)/ops2c.pl lib/Parrot/OpsFile.pm lib/Parrot/Op.pm lib/Parrot/OpTrans/CGP.pm lib/Parrot/OpLib/core.pm
	$(PERL) $(BUILD_TOOLS_DIR)/ops2c.pl CGP --core
EOF
            TEMP_cg_o => '$(OPS_DIR)/core_ops_cg$(O) $(OPS_DIR)/core_ops_cgp$(O)',
            TEMP_cg_r => '$(RM_F) $(INC_DIR)/oplib/core_ops_cg.h $(OPS_DIR)/core_ops_cg.c \
                    $(INC_DIR)/oplib/core_ops_cgp.h $(OPS_DIR)/core_ops_cgp.c',
            cg_flag   => '-DHAVE_COMPUTED_GOTO'
        );
        print " (yes) " if $verbose;
        $Configure::Step::result = 'yes';
    }
    else {
        Parrot::Configure::Data->set(
            TEMP_cg_h => '',
            TEMP_cg_c => '',
            TEMP_cg_o => '',
            TEMP_cg_r => '',
            cg_flag   => ''
        );
        print " (no) " if $verbose;
        $Configure::Step::result = 'no';
    }
}

1;

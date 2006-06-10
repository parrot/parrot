# .NET CLI To PIR Translator
# Base class for implementing stack to register mapping algorithms.

package SRM::Base;
use strict;

# Constructor always throws an exception, so we never instantiate this class.
sub new() {
	die "Attempt to instantiate abstract class SRM::Base.\n";
}

# Pre and post translation hooks.
sub pre_translation {
	die "pre_translation not implemented for current stack to register mapper\n";
}
sub post_translation {
	die "post_translation not implemented for current stack to register mapper\n";
}

# Extra subroutines required for the mapper.
sub subs {
	die "subs not implemented for current stack to register mapper\n";
}

# Label generation.
sub gen_label {
	die "gen_label not implemented for current stack to register mapper\n";
}

# Pre and post stack operation (op class instructions) hooks.
sub pre_op {
	die "pre_op not implemented for current stack to register mapper\n";
}
sub post_op {
	die "post_op not implemented for current stack to register mapper\n";
}

# Pre and post branch operation hooks.
sub pre_branch {
	die "pre_branch not implemented for current stack to register mapper\n";
}
sub post_branch {
	die "post_branch not implemented for current stack to register mapper\n";
}

# Pre and post calling operation hooks.
sub pre_call {
	die "pre_call not implemented for current stack to register mapper\n";
}
sub post_call {
	die "post_call not implemented for current stack to register mapper\n";
}

# Pre and post load operation hooks.
sub pre_load {
	die "pre_load not implemented for current stack to register mapper\n";
}
sub post_load {
	die "post_load not implemented for current stack to register mapper\n";
}

# Pre and post store operation hooks.
sub pre_store {
	die "pre_store not implemented for current stack to register mapper\n";
}
sub post_store {
	die "post_store not implemented for current stack to register mapper\n";
}

1;

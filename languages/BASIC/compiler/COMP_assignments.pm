#! perl -w

use strict;


# Variable name may have a SIGIL and is in S1
#    % &   INT
#    ! #   FLO
#    $     STRING
#    
# Type must be one of INT FLO STRING
#    INT  is in   I0
#    FLO  is in   N0
#    STRING is in S0
#
# No implicit conversions into/from STRING
sub ASSIGNMENT_FUNC {
	my($varname)=@_;	# P6 already has the RHS Loaded...
	print CODE<<ASS_FUNC;
	new P0, .PerlArray
	set P0[.TYPE], "BARE"
	set P0[.VALUE], "$varname"
	bsr ASSIGNMENT	# Do this type manually
ASS_FUNC
	return;
}


1;

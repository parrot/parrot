# $Id$

newclass P1, "Japh"
new P2, "Japh"
print P2
end

.namespace ["Japh"]
.pcc_sub :vtable get_string:
	set S3, "Just another Parrot Hacker\n"
	set_returns "0", S3
	returncc

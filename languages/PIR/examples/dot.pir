	
.sub x :main

	.local int x, y
	P0 = new .Integer
	#new P0, .Integer


	.pcc_begin
	.pcc_call x
	.pcc_end
	
	.pcc_begin_yield
	.pcc_end_yield
	
	

.end




# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

#! /usr/bin/perl -w 

use strict;
use Parrot::Jit;

my $cpuarch = shift @ARGV;

my $core_numops = 457;

my @core_opfunc = (
"Parrot_end",
"Parrot_noop",                                       
"Parrot_close_i",                                    
"Parrot_close_ic",                                   
"Parrot_err_i",                                      
"Parrot_err_s",                                      
"Parrot_open_i_s",                                   
"Parrot_open_i_sc",                                  
"Parrot_open_i_s_i",                                 
"Parrot_open_i_sc_i",                                
"Parrot_open_i_s_ic",                                
"Parrot_open_i_sc_ic",                               
"Parrot_open_i_s_i_i",                               
"Parrot_open_i_sc_i_i",                              
"Parrot_open_i_s_ic_i",                              
"Parrot_open_i_sc_ic_i",                             
"Parrot_open_i_s_i_ic",                              
"Parrot_open_i_sc_i_ic",                             
"Parrot_open_i_s_ic_ic",                             
"Parrot_open_i_sc_ic_ic",                            
"Parrot_ord_i_s",                                    
"Parrot_ord_i_sc",                                   
"Parrot_ord_i_s_i",                                  
"Parrot_ord_i_sc_i",                                 
"Parrot_ord_i_s_ic",                                 
"Parrot_ord_i_sc_ic",                                
"Parrot_print_i",                                    
"Parrot_print_ic",                                   
"Parrot_print_n",                                    
"Parrot_print_nc",                                   
"Parrot_print_s",                                    
"Parrot_print_sc",                                   
"Parrot_print_p",                                    
"Parrot_read_i_i",                                   
"Parrot_read_i_ic",                                  
"Parrot_read_n_i",                                   
"Parrot_read_n_ic",                                  
"Parrot_read_s_i_i",                                 
"Parrot_read_s_ic_i",                                
"Parrot_read_s_i_ic",                                
"Parrot_read_s_ic_ic",                               
"Parrot_time_i",                                     
"Parrot_time_n",                                     
"Parrot_write_i_i",                                  
"Parrot_write_ic_i",                                 
"Parrot_write_i_ic",                                 
"Parrot_write_ic_ic",                                
"Parrot_write_i_n",                                  
"Parrot_write_ic_n",                                 
"Parrot_write_i_nc",                                 
"Parrot_write_ic_nc",                                
"Parrot_write_i_s",                                  
"Parrot_write_ic_s",                                 
"Parrot_write_i_sc",                                 
"Parrot_write_ic_sc",                                
"Parrot_set_i_i",                                    
"Parrot_set_i_ic",                                   
"Parrot_set_n_n",                                    
"Parrot_set_n_nc",                                   
"Parrot_set_n_p",                                    
"Parrot_set_s_s",                                    
"Parrot_set_s_sc",                                   
"Parrot_set_p_i",                                    
"Parrot_set_p_ic",                                   
"Parrot_set_p_n",                                    
"Parrot_set_p_nc",                                   
"Parrot_set_p_s",                                    
"Parrot_set_p_sc",                                   
"Parrot_set_i_p",                                    
"Parrot_clone_p_p",                                  
"Parrot_set_p_i_i",                                  
"Parrot_set_p_ic_i",                                 
"Parrot_set_p_i_ic",                                 
"Parrot_set_p_ic_ic",                                
"Parrot_set_p_n_i",                                  
"Parrot_set_p_nc_i",                                 
"Parrot_set_p_n_ic",                                 
"Parrot_set_p_nc_ic",                                
"Parrot_set_p_s_i",                                  
"Parrot_set_p_sc_i",                                 
"Parrot_set_p_s_ic",                                 
"Parrot_set_p_sc_ic",                                
"Parrot_set_i_p_i",                                  
"Parrot_set_i_p_ic",                                 
"Parrot_set_n_p_i",                                  
"Parrot_set_n_p_ic",                                 
"Parrot_set_s_p_i",                                  
"Parrot_set_s_p_ic",                                 
"Parrot_iton_n_i",                                   
"Parrot_ntoi_i_n",                                   
"Parrot_eq_i_i",                                     
"Parrot_eq_i_ic",                                    
"Parrot_eq_ic_i",                                    
"Parrot_eq_ic_ic",                                   
"Parrot_eq_n_n",                                     
"Parrot_eq_n_nc",                                    
"Parrot_eq_nc_n",                                    
"Parrot_eq_nc_nc",                                   
"Parrot_eq_s_s",                                     
"Parrot_eq_s_sc",                                    
"Parrot_eq_sc_s",                                    
"Parrot_eq_sc_sc",                                   
"Parrot_eq_i_i_ic",                                  
"Parrot_eq_i_ic_ic",                                 
"Parrot_eq_ic_i_ic",                                 
"Parrot_eq_ic_ic_ic",                                
"Parrot_eq_n_n_ic",                                  
"Parrot_eq_n_nc_ic",                                 
"Parrot_eq_nc_n_ic",                                 
"Parrot_eq_nc_nc_ic",                                
"Parrot_eq_s_s_ic",                                  
"Parrot_eq_s_sc_ic",                                 
"Parrot_eq_sc_s_ic",                                 
"Parrot_eq_sc_sc_ic",                                
"Parrot_ne_i_i",                                     
"Parrot_ne_i_ic",                                    
"Parrot_ne_ic_i",                                    
"Parrot_ne_ic_ic",                                   
"Parrot_ne_n_n",                                     
"Parrot_ne_n_nc",                                    
"Parrot_ne_nc_n",                                    
"Parrot_ne_nc_nc",                                   
"Parrot_ne_s_s",                                     
"Parrot_ne_s_sc",                                    
"Parrot_ne_sc_s",                                    
"Parrot_ne_sc_sc",                                   
"Parrot_ne_i_i_ic",                                  
"Parrot_ne_i_ic_ic",                                 
"Parrot_ne_ic_i_ic",                                 
"Parrot_ne_ic_ic_ic",                                
"Parrot_ne_n_n_ic",                                  
"Parrot_ne_n_nc_ic",                                 
"Parrot_ne_nc_n_ic",                                 
"Parrot_ne_nc_nc_ic",                                
"Parrot_ne_s_s_ic",                                  
"Parrot_ne_s_sc_ic",                                 
"Parrot_ne_sc_s_ic",                                 
"Parrot_ne_sc_sc_ic",                                
"Parrot_lt_i_i_ic",                                  
"Parrot_lt_i_ic_ic",                                 
"Parrot_lt_n_n_ic",                                  
"Parrot_lt_n_nc_ic",                                 
"Parrot_lt_s_s_ic",                                  
"Parrot_lt_s_sc_ic",                                 
"Parrot_le_i_i_ic",                                  
"Parrot_le_i_ic_ic",                                 
"Parrot_le_n_n_ic",                                  
"Parrot_le_n_nc_ic",                                 
"Parrot_le_s_s_ic",                                  
"Parrot_le_s_sc_ic",                                 
"Parrot_gt_i_i_ic",                                  
"Parrot_gt_i_ic_ic",                                 
"Parrot_gt_n_n_ic",                                  
"Parrot_gt_n_nc_ic",                                 
"Parrot_gt_s_s_ic",                                  
"Parrot_gt_s_sc_ic",                                 
"Parrot_ge_i_i_ic",                                  
"Parrot_ge_i_ic_ic",                                 
"Parrot_ge_n_n_ic",                                  
"Parrot_ge_n_nc_ic",                                 
"Parrot_ge_s_s_ic",                                  
"Parrot_ge_s_sc_ic",                                 
"Parrot_if_i_ic",                                    
"Parrot_if_n_ic",                                    
"Parrot_if_p_ic",                                    
"Parrot_abs_i_i",                                    
"Parrot_abs_i_ic",                                   
"Parrot_abs_i_n",                                    
"Parrot_abs_i_nc",                                   
"Parrot_abs_n_n",                                    
"Parrot_abs_n_nc",                                   
"Parrot_abs_n_i",                                    
"Parrot_abs_n_ic",                                   
"Parrot_add_i_i_i",                                  
"Parrot_add_i_i_ic",                                 
"Parrot_add_n_n_n",                                  
"Parrot_add_n_n_nc",                                 
"Parrot_cmod_i_i_i",                                 
"Parrot_cmod_i_ic_i",                                
"Parrot_cmod_i_i_ic",                                
"Parrot_cmod_i_ic_ic",                               
"Parrot_cmod_n_n_n",                                 
"Parrot_cmod_n_nc_n",                                
"Parrot_cmod_n_n_nc",                                
"Parrot_cmod_n_nc_nc",                               
"Parrot_dec_i",                                      
"Parrot_dec_n",                                      
"Parrot_dec_i_ic",                                   
"Parrot_dec_n_nc",                                   
"Parrot_div_i_i_i",                                  
"Parrot_div_i_ic_i",                                 
"Parrot_div_i_i_ic",                                 
"Parrot_div_i_ic_ic",                                
"Parrot_div_n_n_n",                                  
"Parrot_div_n_nc_n",                                 
"Parrot_div_n_n_nc",                                 
"Parrot_div_n_nc_nc",                                
"Parrot_inc_i",                                      
"Parrot_inc_n",                                      
"Parrot_inc_i_ic",                                   
"Parrot_inc_n_nc",                                   
"Parrot_mod_i_i_i",                                  
"Parrot_mod_i_ic_i",                                 
"Parrot_mod_i_i_ic",                                 
"Parrot_mod_i_ic_ic",                                
"Parrot_mod_n_n_n",                                  
"Parrot_mod_n_nc_n",                                 
"Parrot_mod_n_n_nc",                                 
"Parrot_mod_n_nc_nc",                                
"Parrot_mul_i_i_i",                                  
"Parrot_mul_i_i_ic",                                 
"Parrot_mul_n_n_n",                                  
"Parrot_mul_n_n_nc",                                 
"Parrot_pow_n_i_i",                                  
"Parrot_pow_n_ic_i",                                 
"Parrot_pow_n_n_i",                                  
"Parrot_pow_n_nc_i",                                 
"Parrot_pow_n_i_ic",                                 
"Parrot_pow_n_ic_ic",                                
"Parrot_pow_n_n_ic",                                 
"Parrot_pow_n_nc_ic",                                
"Parrot_pow_n_i_n",                                  
"Parrot_pow_n_ic_n",                                 
"Parrot_pow_n_n_n",                                  
"Parrot_pow_n_nc_n",                                 
"Parrot_pow_n_i_nc",                                 
"Parrot_pow_n_ic_nc",                                
"Parrot_pow_n_n_nc",                                 
"Parrot_pow_n_nc_nc",                                
"Parrot_sub_i_i_i",                                  
"Parrot_sub_i_ic_i",                                 
"Parrot_sub_i_i_ic",                                 
"Parrot_sub_i_ic_ic",                                
"Parrot_sub_n_n_n",                                  
"Parrot_sub_n_nc_n",                                 
"Parrot_sub_n_n_nc",                                 
"Parrot_sub_n_nc_nc",                                
"Parrot_chopn_s_i",                                  
"Parrot_chopn_s_ic",                                 
"Parrot_concat_s_s",                                 
"Parrot_concat_s_sc",                                
"Parrot_concat_s_s_s",                               
"Parrot_concat_s_sc_s",                              
"Parrot_concat_s_s_sc",                              
"Parrot_concat_s_sc_sc",                             
"Parrot_length_i_s",                                 
"Parrot_substr_s_s_i_i",                             
"Parrot_substr_s_sc_i_i",                            
"Parrot_substr_s_s_ic_i",                            
"Parrot_substr_s_sc_ic_i",                           
"Parrot_substr_s_s_i_ic",                            
"Parrot_substr_s_sc_i_ic",                           
"Parrot_substr_s_s_ic_ic",                           
"Parrot_substr_s_sc_ic_ic",                          
"Parrot_acos_n_i",                                   
"Parrot_acos_n_n",                                   
"Parrot_asec_n_i",                                   
"Parrot_asec_n_n",                                   
"Parrot_asin_n_i",                                   
"Parrot_asin_n_n",                                   
"Parrot_atan_n_i",                                   
"Parrot_atan_n_n",                                   
"Parrot_atan_n_i_i",                                 
"Parrot_atan_n_ic_i",                                
"Parrot_atan_n_n_i",                                 
"Parrot_atan_n_nc_i",                                
"Parrot_atan_n_i_ic",                                
"Parrot_atan_n_ic_ic",                               
"Parrot_atan_n_n_ic",                                
"Parrot_atan_n_nc_ic",                               
"Parrot_atan_n_i_n",                                 
"Parrot_atan_n_ic_n",                                
"Parrot_atan_n_n_n",                                 
"Parrot_atan_n_nc_n",                                
"Parrot_atan_n_i_nc",                                
"Parrot_atan_n_ic_nc",                               
"Parrot_atan_n_n_nc",                                
"Parrot_atan_n_nc_nc",                               
"Parrot_cos_n_i",                                    
"Parrot_cos_n_n",                                    
"Parrot_cosh_n_i",                                   
"Parrot_cosh_n_n",                                   
"Parrot_exp_n_i",                                    
"Parrot_exp_n_n",                                    
"Parrot_ln_n_i",                                     
"Parrot_ln_n_n",                                     
"Parrot_log10_n_i",                                  
"Parrot_log10_n_n",                                  
"Parrot_log2_n_i",                                   
"Parrot_log2_n_n",                                   
"Parrot_sec_n_i",                                    
"Parrot_sec_n_n",                                    
"Parrot_sech_n_i",                                   
"Parrot_sech_n_n",                                   
"Parrot_sin_n_i",                                    
"Parrot_sin_n_n",                                    
"Parrot_sinh_n_i",                                   
"Parrot_sinh_n_n",                                   
"Parrot_tan_n_i",                                    
"Parrot_tan_n_n",                                    
"Parrot_tanh_n_i",                                   
"Parrot_tanh_n_n",                                   
"Parrot_and_i_i_i",                                  
"Parrot_and_i_i_ic",                                 
"Parrot_not_i_i",                                    
"Parrot_or_i_i_i",                                   
"Parrot_or_i_i_ic",                                  
"Parrot_shl_i_i_i",                                  
"Parrot_shl_i_ic_i",                                 
"Parrot_shl_i_i_ic",                                 
"Parrot_shl_i_ic_ic",                                
"Parrot_shr_i_i_i",                                  
"Parrot_shr_i_ic_i",                                 
"Parrot_shr_i_i_ic",                                 
"Parrot_shr_i_ic_ic",                                
"Parrot_xor_i_i_i",                                  
"Parrot_xor_i_i_ic",                                 
"Parrot_bounds_ic",                                  
"Parrot_profile_ic",                                 
"Parrot_trace_ic",                                   
"Parrot_cleari",                                     
"Parrot_clearn",                                     
"Parrot_clears",                                     
"Parrot_clearp",                                     
"Parrot_popi",                                       
"Parrot_popn",                                       
"Parrot_pops",                                       
"Parrot_popp",                                       
"Parrot_pushi",                                      
"Parrot_pushn",                                      
"Parrot_pushs",                                      
"Parrot_pushp",                                      
"Parrot_clonei",                                     
"Parrot_clonen",                                     
"Parrot_clones",                                     
"Parrot_clonep",                                     
"Parrot_entrytype_i_i",                              
"Parrot_entrytype_i_ic",                             
"Parrot_save_i",                                     
"Parrot_save_ic",                                    
"Parrot_save_n",                                     
"Parrot_save_nc",                                    
"Parrot_save_p",                                     
"Parrot_save_s",                                     
"Parrot_save_sc",                                    
"Parrot_restore_i",                                  
"Parrot_restore_n",                                  
"Parrot_restore_p",                                  
"Parrot_restore_s",                                  
"Parrot_branch_ic",                                  
"Parrot_bsr_i",                                      
"Parrot_bsr_ic",                                     
"Parrot_jump_i",                                     
"Parrot_newinterp_p_i",                              
"Parrot_newinterp_p_ic",                             
"Parrot_runinterp_p_i",                              
"Parrot_runinterp_p_ic",                             
"Parrot_new_p_i",                                    
"Parrot_new_p_ic",                                   
"Parrot_new_key_s",                                  
"Parrot_clone_key_s_s",                              
"Parrot_size_key_s_i",                               
"Parrot_size_key_s_ic",                              
"Parrot_key_size_i_s",                               
"Parrot_toss_key_s",                                 
"Parrot_ke_type_i_s_i",                              
"Parrot_ke_type_i_s_ic",                             
"Parrot_ke_value_i_s_i",                             
"Parrot_ke_value_i_s_ic",                            
"Parrot_ke_value_n_s_i",                             
"Parrot_ke_value_n_s_ic",                            
"Parrot_ke_value_s_s_i",                             
"Parrot_ke_value_s_s_ic",                            
"Parrot_ke_value_p_s_i",                             
"Parrot_ke_value_p_s_ic",                            
"Parrot_ke_value_i_s_s",                             
"Parrot_ke_value_i_s_sc",                            
"Parrot_ke_value_n_s_s",                             
"Parrot_ke_value_n_s_sc",                            
"Parrot_ke_value_s_s_s",                             
"Parrot_ke_value_s_s_sc",                            
"Parrot_ke_value_p_s_s",                             
"Parrot_ke_value_p_s_sc",                            
"Parrot_ke_set_value_s_i_i",                         
"Parrot_ke_set_value_s_ic_i",                        
"Parrot_ke_set_value_s_i_ic",                        
"Parrot_ke_set_value_s_ic_ic",                       
"Parrot_ke_set_value_s_i_n",                         
"Parrot_ke_set_value_s_ic_n",                        
"Parrot_ke_set_value_s_i_nc",                        
"Parrot_ke_set_value_s_ic_nc",                       
"Parrot_ke_set_value_s_i_s",                         
"Parrot_ke_set_value_s_ic_s",                        
"Parrot_ke_set_value_s_i_sc",                        
"Parrot_ke_set_value_s_ic_sc",                       
"Parrot_ke_set_value_s_i_p",                         
"Parrot_ke_set_value_s_ic_p",                        
"Parrot_ke_set_value_s_s_i",                         
"Parrot_ke_set_value_s_sc_i",                        
"Parrot_ke_set_value_s_s_ic",                        
"Parrot_ke_set_value_s_sc_ic",                       
"Parrot_ke_set_value_s_s_n",                         
"Parrot_ke_set_value_s_sc_n",                        
"Parrot_ke_set_value_s_s_nc",                        
"Parrot_ke_set_value_s_sc_nc",                       
"Parrot_ke_set_value_s_s_s",                         
"Parrot_ke_set_value_s_sc_s",                        
"Parrot_ke_set_value_s_s_sc",                        
"Parrot_ke_set_value_s_sc_sc",                       
"Parrot_ke_set_value_s_s_p",                         
"Parrot_ke_set_value_s_sc_p",                        
"Parrot_chop_key_s",                                 
"Parrot_inc_key_s_i",                                
"Parrot_ret",                                        
"Parrot_rotate_up_i",                                
"Parrot_rotate_up_ic",                               
"Parrot_sleep_i",                                    
"Parrot_sleep_ic",                                   
"Parrot_setline_i",                                  
"Parrot_setline_ic",                                 
"Parrot_getline_i",                                  
"Parrot_setfile_s",                                  
"Parrot_setfile_sc",                                 
"Parrot_getfile_s",                                  
"Parrot_setpackage_s",                               
"Parrot_setpackage_sc",                              
"Parrot_getpackage_s",                               
"Parrot_add_p_p_p",                                  
"Parrot_add_p_p_n",                                  
"Parrot_add_p_p_nc",                                 
"Parrot_add_p_p_i",                                  
"Parrot_add_p_p_ic",                                 
"Parrot_sub_p_p_p",                                  
"Parrot_sub_p_p_n",                                  
"Parrot_sub_p_p_nc",                                 
"Parrot_sub_p_p_i",                                  
"Parrot_sub_p_p_ic",                                 
"Parrot_mul_p_p_p",                                  
"Parrot_mul_p_p_n",                                  
"Parrot_mul_p_p_nc",                                 
"Parrot_mul_p_p_i",                                  
"Parrot_mul_p_p_ic",                                 
"Parrot_div_p_p_p",                                  
"Parrot_div_p_p_n",                                  
"Parrot_div_p_p_nc",                                 
"Parrot_div_p_p_i",                                  
"Parrot_div_p_p_ic",                                 
"Parrot_mod_p_p_p",                                  
"Parrot_mod_p_p_n",                                  
"Parrot_mod_p_p_nc",                                 
"Parrot_mod_p_p_i",                                  
"Parrot_mod_p_p_ic",                                 
"Parrot_concat_p_p_p",                               
"Parrot_concat_p_p_s",                               
"Parrot_and_p_p_p",                                  
"Parrot_or_p_p_p",                                   
"Parrot_not_p_p",                                    
"NULL"
);

# XXX I did NOT had the time to read the PMC code so I don't know if this structure will be enough, it will not.

my ($i,$j,$k,$n);

my ($function, $body, $line);

my ($position, $bytecode, $type, $number, $size, $char, $move, $strflag);

my (%core_ops, %string, $arg, $tmp, $which, $argc, $argv, $syscall, $tmp_bytecode, $nargop);

my (@values);
my (@value_p);
my (@value_n);
my (@value_f);

open (IN,"jit/$cpuarch/core.jit");
while ($line = <IN>) {
    next if (($line =~ m/^[#;]/) || ($line =~ m/^\s*$/));
    ($function, $body) = split(":",$line);
    $body =~ s/\s+//g;
    $core_ops{$function} = $body;
}

open (IN,"jit/$cpuarch/string.jit");
while ($line = <IN>) {
    next if (($line =~ m/^[#;]/) || ($line =~ m/^\s*$/));
    ($function, $body) = split(":",$line);
    $body =~ s/\s+//g;
    $string{$function} = $body;
}

for ($i = 0; $i <= $core_numops; $i++) {
    if (defined($core_ops{$core_opfunc[$i]})) {
        $body = $core_ops{$core_opfunc[$i]};
        $bytecode = "";
		$move = 0;
		$position = 0;
        @value_p = ();
        @value_n = ();
        @values = ();

        while($move != length($body)) {
        	$char = substr($body,$move,1);    
        	if ($char eq '\\') {
            	# Copy the byte
            	$bytecode .= substr($body,$move,4);
            	$move += 4;
            	$position += 1;
        	}
            if ($char eq 'F') {
                # fuction
                $tmp_bytecode = "";
                $tmp = substr($body,$move,index($body,')',$move) + 1);
                $tmp =~ m/(\w+),([^\)]*)\)/;
                $function = $1;
                $argv = $2;
                if (defined($string{$function})) {
                    $argc = $tmp_bytecode = $string{$function};
                    $argc =~ s/[^A]//g;
                    $argc = length($argc);
                    for($k = 0; $k < $argc; $k++) {
                        $argv =~ s/([\&\*][a-zA-Z]+\d+)//; 
                        $arg = $1;
                        $tmp_bytecode =~ s/A/$arg/;
                    }
                }
                $body =~ s/F\([^\)]*\)/$tmp_bytecode/;
            }
            if ($char eq 'S') {
                # system call
                $tmp_bytecode = "";
                $tmp = substr($body,$move,index($body,')',$move) + 1);
                $tmp =~ m/(\w+),(\d+),([^\)]*)\)/;
                $syscall = $1;
                $argc = $2;
                $argv = $3;

                $tmp_bytecode .= Jit::system_call($argc,$argv,$syscall);
                
                $body =~ s/S\([^\)]*\)/$tmp_bytecode/;
            }
        	if ($char =~ m/[\&\*]/) {
            	# Copy \x00 * sizeof(INTVAL) to the bytecode and add to the list
            	$tmp = substr($body,$move,length($body) - $move + 1);
            	$tmp =~ m/([\&\*][a-zA-Z]+)(\d+)/;
            	$type = $1;
            	$number = $2;
                $strflag = undef;
            	if ($type eq '&IR') {
                    $n = 0;
            	}
            	elsif ($type eq '&NR') {
                    $n = 1;
            	}
            	elsif ($type eq '&SR') {
                    $n = 2;
                    $strflag = 0;
            	}
            	elsif ($type eq '&SRbufstart') {
                    $n = 2;
                    $strflag = 1;
            	}
            	elsif ($type eq '&SRbuflen') {
                    $n = 2;
                    $strflag = 2;
            	}
            	elsif ($type eq '&SRflags') {
                    $n = 2;
                    $strflag = 3;
            	}
            	elsif ($type eq '&SRbufused') {
                    $n = 2;
                    $strflag = 4;
            	}
            	elsif ($type eq '&SRstrlen') {
                    $n = 2;
                    $strflag = 5;
            	}
            	elsif ($type eq '&SRencoding') {
                    $n = 2;
                    $strflag = 6;
            	}
            	elsif ($type eq '&SRtype') {
                    $n = 2;
                    $strflag = 7;
            	}
            	elsif ($type eq '&SRlanguage') {
                    $n = 2;
                    $strflag = 8;
            	}
            	elsif ($type eq '&PR') {
                    $n = 3;
            	}
            	elsif ($type eq '*IC') {
                    $n = 4;
            	}
            	elsif ($type eq '*NC') {
                    $n = 5;
            	}
            	elsif ($type eq '*SC') {
                    $n = 6;
                    $strflag = 0;
            	}
            	elsif ($type eq '*SCbufstart') {
                    $n = 6;
                    $strflag = 1;
            	}
            	elsif ($type eq '*SCbuflen') {
                    $n = 6;
                    $strflag = 2;
            	}
            	elsif ($type eq '*SCflags') {
                    $n = 6;
                    $strflag = 3;
            	}
            	elsif ($type eq '*SCbufused') {
                    $n = 6;
                    $strflag = 4;
            	}
            	elsif ($type eq '*SCstrlen') {
                    $n = 6;
                    $strflag = 5;
            	}
            	elsif ($type eq '*SCencoding') {
                    $n = 6;
                    $strflag = 6;
            	}
            	elsif ($type eq '*SCtype') {
                    $n = 6;
                    $strflag = 7;
            	}
            	elsif ($type eq '*SClanguage') {
                    $n = 6;
                    $strflag = 8;
            	}
            	elsif ($type eq '*PC') {
                    $n = 7;
            	}
            	elsif ($type eq '&IC') {
                    $n = 8;
            	}
            	elsif ($type eq '&NC') {
                    $n = 9;
            	}
            	elsif ($type eq '&SC') {
                    $n = 10;
                    $strflag = 0;
            	}
            	elsif ($type eq '&SCbufstart') {
                    $n = 10;
                    $strflag = 1;
            	}
            	elsif ($type eq '&SCbuflen') {
                    $n = 10;
                    $strflag = 2;
            	}
            	elsif ($type eq '&SCflags') {
                    $n = 10;
                    $strflag = 3;
            	}
            	elsif ($type eq '&SCbufused') {
                    $n = 10;
                    $strflag = 4;
            	}
            	elsif ($type eq '&SCstrlen') {
                    $n = 10;
                    $strflag = 5;
            	}
            	elsif ($type eq '&SCencoding') {
                    $n = 10;
                    $strflag = 6;
            	}
            	elsif ($type eq '&SCtype') {
                    $n = 10;
                    $strflag = 7;
            	}
            	elsif ($type eq '&SClanguage') {
                    $n = 10;
                    $strflag = 8;
            	}
            	elsif ($type eq '&PC') {
                    $n = 11;
            	}
               	elsif ($type eq '&TI') {
                    $n = 12;
            	}
            	elsif ($type eq '&TN') {
                    $n = 13;
            	}
            	elsif ($type eq '&TS') {
                    $n = 14;
            	}
            	elsif ($type eq '&TC') {
                    $n = 15;
            	}
            	elsif ($type eq '&CF') {
                    $n = 21;
            	}
            	elsif ($type eq '&CC') {
                    $n = 23;
            	}
            	elsif ($type eq '*JIC') {
                    $n = 24;
            	}
            	elsif ($type eq '&L') {
                    $n = 27;
            	}
            	$bytecode .= '\\x00' x 4;
              	$values[$n]++;
                $value_p[$n][$values[$n]] = $position;
                $value_n[$n][$values[$n]] = $number;
                $value_f[$n][$values[$n]] = $strflag;
            	$move += length($type) + length($number);
				$position += 4;
        	}
		}
		$tmp = $bytecode;
		$tmp =~ s/[^x]//g;
		$size = length($tmp);

        # Erm ... I will make this parsing core.ops, tomorrow.  
        
        $nargop = $core_opfunc[$i];
        $nargop =~ s/[^_]//g;
        $nargop = length($nargop);

		print <<END;
{
    /* $core_opfunc[$i] */
	"$bytecode",
	$size,
    $nargop,
END
        for ($k = 0; $k < 28; $k++) {
            print "\t{\n";
	    	if (defined($values[$k])) {
	    		print $values[$k] . ",\n{\n";
	    		for($j=1; $j <= $values[$k]; $j++) {
	    			print "{" . $value_p[$k][$j] . "," . $value_n[$k][$j];
                    print "," . $value_f[$k][$j] if (defined($value_f[$k][$j]));
                    print "},\n";
	    		}
	    		print "}\n";
	    	}
            print "\t},\n";
        }
     print "},\n";
    } else {
        print <<END;
{
    /* $core_opfunc[$i] */
},
END
    }
}



#! perl -w
#
# Build up the native call routines.

my %ret_count;
%ret_count = (p => [0,0,0,1,0],        # Returning a pointer that we PMC stuff
	      i => [0,1,0,0,0],        # Returning an int
	      l => [0,1,0,0,0],        # Returning a long
	      c => [0,1,0,0,0],        # returning a char
	      s => [0,1,0,0,0],        # returning a short
	      f => [0,0,0,0,1],        # returning a float
	      d => [0,0,0,0,1],        # returning a double
	      t => [0,0,1,0,0],        # returning a string
	      v => [0,0,0,0,0],        # void return
	      );


my (%ret_type) = (p => "void *",
		  i => "int",
		  l => "long",
		  c => "char",
		  s => "short",
                  f => "float",
                  d => "double",
                  t => "char *",
		  v => "void",
                 );

my (%other_decl) = (p => "PMC *final_destination = pmc_new(interpreter, enum_class_UnManagedStruct);");

my (%ret_type_decl) = (p => "void *",
		       i => "int",
		       l => "long",
		       c => "char",
		       s => "short",
                       f => "float",
                       d => "double",
                       t => "char *",
		       v => "void *",
                     );

my (%ret_assign) = (p => "final_destination->data = return_data;\nPMC_REG(5) = final_destination;",
		    i => "INT_REG(5) = return_data;",
		    l => "INT_REG(5) = return_data;",
		    c => "INT_REG(5) = return_data;",
		    s => "INT_REG(5) = return_data;",
                    f => "NUM_REG(5) = return_data;",
                    d => "NUM_REG(5) = return_data;",
		    v => "",
                   );

my (%func_call_assign) = (p => "return_data = ",
			  i => "return_data = ",
			  l => "return_data = ",
			  c => "return_data = ",
			  s => "return_data = ",
                          f => "return_data = ",
                          d => "return_data = ",
		          v => "",
                          );

open NCI, ">nci.c" or die "Can't open nci.c!";

print NCI <<'HEAD';
/* nci.c
 *  Copyright: 2001, 2002 Yet Another Society
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Native Call Interface routines. The code needed to build a
 *     parrot to C call frame is in here
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

#if !defined(INT_REG)
#define INT_REG(x) interpreter->ctx.int_reg.registers[x]
#endif
#if !defined(NUM_REG)
#define NUM_REG(x) interpreter->ctx.num_reg.registers[x]
#endif
#if !defined(STR_REG)
#define STR_REG(x) interpreter->ctx.string_reg.registers[x]
#endif
#if !defined(PMC_REG)
#define PMC_REG(x) interpreter->ctx.pmc_reg.registers[x]
#endif

#if defined(HAS_JIT) && defined(I386)
# include "parrot/jit.h"
# define CAN_BUILD_CALL_FRAMES
#endif

#if !defined(CAN_BUILD_CALL_FRAMES)
/* All our static functions that call in various ways. Yes, terribly
   hackish, but that's just fine */

static void set_return_val(struct Parrot_Interp *interpreter, int stack, int ints, int strings, int pmcs, int nums) {
  INT_REG(0) = stack;
  INT_REG(1) = ints;
  INT_REG(2) = strings;
  INT_REG(3) = pmcs;
  INT_REG(4) = nums;
}

HEAD

# '
while (<>) {
    s/#.*$//;
    s/^\s*//;
    s/\s*$//;
    next unless $_;
    my ($ret, $args) = split /\s/, $_;
    my @arg;
    my %reg_count;
    @reg_count{qw(p i s n)} = (5, 5, 5, 5);
    foreach (split //, $args) {
	push @arg, make_arg($_, \%reg_count);
    }

    # Header
    generate_func_header($ret, $args, (join ",", @arg), $ret_type{$ret}, $ret_type_decl{$ret}, $func_call_assign{$ret}, $other_decl{$ret},  $ret_assign{$ret});

    # Body

    # Footer
    set_return_count(@{$ret_count{$ret}});
}

$icky_global_bit = join("\n", @icky_global_variable);

print NCI <<TAIL;
#endif

/* This function serves a single purpose. It takes the function
   signature for a C function we want to call and returns a pointer
   to a function that can call it. */
void *build_call_func(struct Parrot_Interp *interpreter, PMC *pmc_nci,
	String *signature) {
#if defined(CAN_BUILD_CALL_FRAMES)
  /* This would be a good place to put the code that builds the
     frames. Undoubtedly painfully platform-dependent */

   return Parrot_jit_build_call_func(interpreter, pmc_nci, signature);

#else
  /* And in here is the platform-independent way. Which is to say
     "here there be hacks" */
  UNUSED(pmc_nci);
  if (0 == string_length(signature)) return F2DPTR(pcf_v_v);
$icky_global_bit
    PANIC("Unknown signature type");
  return NULL;
#endif
}

TAIL

close NCI;


sub make_arg {
    my ($argtype, $reg_ref) = @_;
    /p/ && do {my $regnum = $reg_ref->{p}++;
	       return "PMC_REG($regnum)->data";
              };
    /i/ && do {my $regnum = $reg_ref->{i}++;
	       return "(int)INT_REG($regnum)";
              };
    /l/ && do {my $regnum = $reg_ref->{i}++;
	       return "(long)INT_REG($regnum)";
              };
    /s/ && do {my $regnum = $reg_ref->{i}++;
	       return "(short)INT_REG($regnum)";
              };
    /f/ && do {my $regnum = $reg_ref->{n}++;
	       return "(float)NUM_REG($regnum)";
              };
    /d/ && do {my $regnum = $reg_ref->{n}++;
	       return "(double)NUM_REG($regnum)";
              };
    /t/ && do {my $regnum = $reg_ref->{s}++;
	       return "string_to_cstring(interpreter, STR_REG($regnum))";
              };

}

sub set_return_count {
    my ($stack, $int, $string, $pmc, $num) = @_;
    print NCI "  set_return_val(interpreter, $stack, $int, $string, $pmc, $num);\nreturn;\n}\n\n"
}

sub generate_func_header {
    my ($return, $params, $call_params, $ret_type, $ret_type_decl, $return_assign, $other_decl, $final_assign) = @_;
    $other_decl ||= "";
    print NCI <<HEADER;
static void pcf_${return}_$params(struct Parrot_Interp *interpreter, PMC *self) {
  $ret_type (*pointer)();
  $ret_type_decl return_data;
  $other_decl

  pointer =  ($ret_type (*)())D2FPTR(self->cache.struct_val);
  $return_assign ($ret_type)(*pointer)($call_params);
  $final_assign
HEADER

  push @icky_global_variable, <<CALL;
  if (!string_compare(interpreter, signature,
    string_from_c_string(interpreter, "$return$params", 0)))
        return F2DPTR(pcf_${return}_$params);
CALL

}


=for comment
This is the template thing

static void pcf_$funcname(struct Parrot_Interp *interpreter, PMC *self) {
  $ret_type (*pointer)();
  $ret_type return_data;

  pointer = self->cache.struct_val;
  return_data = ($ret_type)(*pointer)($params);
  $ret_reg  = return_data;
  INT_REG(0) = $stack_returns;
  INT_REG(1) = $int_returns;
  INT_REG(2) = $string_returns;
  INT_REG(3) = $pmc_returns;
  INT_REG(4) = $num_returns;
  return;
}
EOR

}
=end comment

/* basic_opcodes.c
 *
 * Just some basic opcodes
 *
 */

#include "parrot.h"

// SET Ix, CONSTANT
IV *set_i(IV cur_opcode[], struct Perl_Interp *interpreter) {
  INT_REG(cur_opcode[1]) = cur_opcode[2];
  return cur_opcode + 3;
}
  
// ADD Ix, Iy, Iz  
IV *add_i(IV cur_opcode[], struct Perl_Interp *interpreter) {
  INT_REG(cur_opcode[1]) = INT_REG(cur_opcode[2]) +
                           INT_REG(cur_opcode[3]);
  return cur_opcode + 4;
}

// SUB Ix, Iy, Iz  
IV *sub_i(IV cur_opcode[], struct Perl_Interp *interpreter) {
  INT_REG(cur_opcode[1]) = INT_REG(cur_opcode[2]) -
                           INT_REG(cur_opcode[3]);
  return cur_opcode + 4;
}

// MUL Ix, Iy, Iz  
IV *mul_i(IV cur_opcode[], struct Perl_Interp *interpreter) {
  INT_REG(cur_opcode[1]) = INT_REG(cur_opcode[2]) *
                           INT_REG(cur_opcode[3]);
  return cur_opcode + 4;
}

// DIV Ix, Iy, Iz  
IV *div_i(IV cur_opcode[], struct Perl_Interp *interpreter) {
  INT_REG(cur_opcode[1]) = INT_REG(cur_opcode[2]) /
                           INT_REG(cur_opcode[3]);
  return cur_opcode + 4;
}

// EQ Ix, Iy, EQ_BRANCH, NE_BRANCH
IV *eq_i(IV cur_opcode[], struct Perl_Interp *interpreter) {
  if (INT_REG(cur_opcode[1]) == INT_REG(cur_opcode[2])) {
    return cur_opcode + cur_opcode[3];
  } else {
    return cur_opcode + cur_opcode[4];
  }
}

// IF IXx, TRUE_BRANCH, FALSE_BRANCH
IV *if_i(IV cur_opcode[], struct Perl_Interp *interpreter) {
  if (INT_REG(cur_opcode[1])) {
    return cur_opcode + cur_opcode[2];
  } else {
    return cur_opcode + cur_opcode[3];
  }
}

// TIME Ix
IV *time_i(IV cur_opcode[], struct Perl_Interp *interpreter) {
  INT_REG(cur_opcode[1]) = time(NULL);
  return cur_opcode + 2;
}

// PRINT Ix
IV *print_i(IV cur_opcode[], struct Perl_Interp *interpreter) {
  printf("I reg %i is %i\n", cur_opcode[1], INT_REG(cur_opcode[1]));
  return(cur_opcode + 2);
}
 
// BRANCH CONSTANT
IV *branch_i_c(IV cur_opcode[], struct Perl_Interp *interpreter) {
  return cur_opcode + cur_opcode[1];
}

// END
IV *end(IV cur_opcode[], struct Perl_Interp *interpreter) {
   return 0;
}

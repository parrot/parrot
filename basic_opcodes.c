/* basic_opcodes.c
 *
 * Just some basic opcodes
 *
 */

#include "parrot.h"

// SET Ix, CONSTANT
IV *set_i_ic(IV cur_opcode[], struct Perl_Interp *interpreter) {
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
IV *eq_i_ic(IV cur_opcode[], struct Perl_Interp *interpreter) {
  if (INT_REG(cur_opcode[1]) == INT_REG(cur_opcode[2])) {
    return cur_opcode + cur_opcode[3];
  } else {
    return cur_opcode + cur_opcode[4];
  }
}

// IF IXx, TRUE_BRANCH, FALSE_BRANCH
IV *if_i_ic(IV cur_opcode[], struct Perl_Interp *interpreter) {
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
IV *branch_ic(IV cur_opcode[], struct Perl_Interp *interpreter) {
  return cur_opcode + cur_opcode[1];
}

// END
IV *end(IV cur_opcode[], struct Perl_Interp *interpreter) {
   return 0;
}

// INC Ix
IV *inc_i(IV cur_opcode[], struct Perl_Interp *interpreter) {
  INT_REG(cur_opcode[1])++;
  return cur_opcode + 2;
}

// INC Ix, nnn
IV *inc_i_ic(IV cur_opcode[], struct Perl_Interp *interpreter) {
  INT_REG(cur_opcode[1]) += cur_opcode[2];
    return cur_opcode + 3;
}

// DEC Ix
IV *dec_i(IV cur_opcode[], struct Perl_Interp *interpreter) {
  INT_REG(cur_opcode[1]);
  return cur_opcode + 2;
}

// DEC Ix, nnn
IV *dec_i_ic(IV cur_opcode[], struct Perl_Interp *interpreter) {
  INT_REG(cur_opcode[1]) += cur_opcode[2];
  return cur_opcode + 3;
}

// JUMP Ix
IV *jump_i(IV cur_opcode[], struct Perl_Interp *interpreter) {
  return (IV *)INT_REG(cur_opcode[1]);
}



// SET Nx, CONSTANT
IV *set_n_nc(IV cur_opcode[], struct Perl_Interp *interpreter) {
  NUM_REG(cur_opcode[1]) = *(double *)&cur_opcode[2];
  return cur_opcode + 4; // Don't forget, NVs are two slots wide
}
  
// ADD Nx, Ny, Nz  
IV *add_n(IV cur_opcode[], struct Perl_Interp *interpreter) {
  NUM_REG(cur_opcode[1]) = NUM_REG(cur_opcode[2]) +
                           NUM_REG(cur_opcode[3]);
  return cur_opcode + 4;
}

// SUB Nx, Ny, Iz  
IV *sub_n(IV cur_opcode[], struct Perl_Interp *interpreter) {
  NUM_REG(cur_opcode[1]) = NUM_REG(cur_opcode[2]) -
                           NUM_REG(cur_opcode[3]);
  return cur_opcode + 4;
}

// MUL Nx, Ny, Iz  
IV *mul_n(IV cur_opcode[], struct Perl_Interp *interpreter) {
  NUM_REG(cur_opcode[1]) = NUM_REG(cur_opcode[2]) *
                           NUM_REG(cur_opcode[3]);
  return cur_opcode + 4;
}

// DIV Nx, Ny, Iz  
IV *div_n(IV cur_opcode[], struct Perl_Interp *interpreter) {
  NUM_REG(cur_opcode[1]) = NUM_REG(cur_opcode[2]) /
                           NUM_REG(cur_opcode[3]);
  return cur_opcode + 4;
}

// EQ Nx, Ny, EQ_BRANCH, NE_BRANCH
IV *eq_n_ic(IV cur_opcode[], struct Perl_Interp *interpreter) {
  if (NUM_REG(cur_opcode[1]) == NUM_REG(cur_opcode[2])) {
    return cur_opcode + cur_opcode[3];
  } else {
    return cur_opcode + cur_opcode[4];
  }
}

// IF Nx, TRUE_BRANCH, FALSE_BRANCH
IV *if_n_ic(IV cur_opcode[], struct Perl_Interp *interpreter) {
  if (NUM_REG(cur_opcode[1])) {
    return cur_opcode + cur_opcode[2];
  } else {
    return cur_opcode + cur_opcode[3];
  }
}

// TIME Nx
IV *time_n(IV cur_opcode[], struct Perl_Interp *interpreter) {
  NUM_REG(cur_opcode[1]) = time(NULL);
  return cur_opcode + 2;
}

// PRINT Nx
IV *print_n(IV cur_opcode[], struct Perl_Interp *interpreter) {
  printf("N reg %i is %Lf\n", cur_opcode[1], NUM_REG(cur_opcode[1]));
  return(cur_opcode + 2);
}
 
// INC Nx
IV *inc_n(IV cur_opcode[], struct Perl_Interp *interpreter) {
  NUM_REG(cur_opcode[1]) += 1;
  return cur_opcode + 2;
}

// INC Nx, nnn
IV *inc_n_nc(IV cur_opcode[], struct Perl_Interp *interpreter) {
  (NV)NUM_REG(cur_opcode[1]) += *(double *)&cur_opcode[2];
  return cur_opcode + 4;
}

// DEC Nx
IV *dec_n(IV cur_opcode[], struct Perl_Interp *interpreter) {
  NUM_REG(cur_opcode[1]);
  return cur_opcode + 2;
}

// DEC Nx, nnn
IV *dec_n_nc(IV cur_opcode[], struct Perl_Interp *interpreter) {
  NUM_REG(cur_opcode[1]) += *(double *)&cur_opcode[2];
  return cur_opcode + 4;
}

// ITON Nx, Iy
IV *iton_n_i(IV cur_opcode[], struct Perl_Interp *interpreter) {
  IV number;
  number = INT_REG(cur_opcode[2]);
  NUM_REG(cur_opcode[1]) = (NV)number;
  return cur_opcode + 3;
}

// NTOI Ix, Ny
IV *ntoi_i_n(IV cur_opcode[], struct Perl_Interp *interpreter) {
  NV number;
  number = NUM_REG(cur_opcode[2]);
  INT_REG(cur_opcode[1]) = number;
  return cur_opcode + 3;
}

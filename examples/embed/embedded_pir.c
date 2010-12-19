/*
 * Sample of an embedding application: compiles and executes "hello_world.pir"
 */

#include<stdio.h>
#include <stdlib.h>

#include "parrot/api.h"

int main(int argc, const char **argv)
{
  int exitcode;
  Parrot_PMC * interp;
  Parrot_PMC * compiler;
  Parrot_PMC * bytecode;

  // Create the interpreter
  if (!Parrot_api_make_interpreter(NULL,NULL,NULL,&interp) ) {
    fprintf(stderr,"FATAL: Can't create the interpreter");
    return 1;
  }

  // Compile hello_world.pir and execute it
  if (  Parrot_api_load_language(interp, "PIR") &&
        Parrot_api_get_compiler(interp, "PIR", &compiler) &&
        Parrot_api_compile_file(interp, compiler, "hello_world.pir", &bytecode) &&
        Parrot_api_load_bytecode(interp, bytecode) &&
        Parrot_api_run(interp, &exitcode))
    {
      return exitcode;
    }
  else
    {
      // Print last error to stderr
      const char * err = Parrot_api_get_last_error(interp);
      fprintf(stderr, err);
      return 1;
    }
}

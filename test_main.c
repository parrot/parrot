/* driver.c
 *
 * A sample main program
 *
 */

#include "parrot.h"

IV opcodes[] = {3, 1,                // put the time in reg 1
                0, 2, 0,             // Set reg 2 to 0
		0, 3, 1,             // set reg 3 to 1
		0, 4, 100000000,     // set reg 4 to 100M 
                2, 2, 4, 11, 5,      // is reg 2 eq to reg 4?
		1, 2, 2, 3,          // Add register 2 to 3, store in 2
		5, -9,               // branch back to if
		3, 5,                // Put the time in reg 5
		4, 1,                // Print reg 1
		4, 5,                // Print reg 5
		6                    // exit
                };

int main(int argc, char **argv) {
  struct Perl_Interp *interpreter;
  init_world();

  interpreter = make_interpreter();

  /* If we got only the program name, run the test program */
  if (argc == 1) {
    runops(interpreter, opcodes);
  }
  else if (argc == 2 && !strcmp(argv[1], "-s")) { /* String tests */
      STRING *s = string_make("foo", 3, enc_native, 0, 0);
      STRING *t = string_make("quux", 4, enc_native, 0, 0);
      int i;
      time_t foo;

      printf("String %p has length %i: %.*s\n", s, (int) string_length(s), (int) string_length(s), (char *) s->bufstart);
      string_concat(s, t, 0);
      printf("String %p has length %i: %.*s\n", s, (int) string_length(s), (int) string_length(s), (char *) s->bufstart);
      string_chopn(s, 4);
      printf("String %p has length %i: %.*s\n", s, (int) string_length(s), (int) string_length(s), (char *) s->bufstart);
      string_chopn(s, 4);
      printf("String %p has length %i: %.*s\n", s, (int) string_length(s), (int) string_length(s), (char *) s->bufstart);
      foo = time(0);
      for (i = 0; i < 100000000; i++) {
            string_concat(s, t, 0);
            string_chopn(s, 4);
      }
      printf("10000000 concats and chops took %li seconds.\n", time(0)-foo);
      string_destroy(s);
  }
  /* Otherwise load in the program they gave and try that */
  else {
    void *program_code;
    struct stat file_stat;
    int fd;
    if (stat(argv[1], &file_stat)) {
      printf("can't stat %s, code %i\n", argv[1], errno);
      return 1;
    }
    fd = open(argv[1], O_RDONLY);
    if (!fd) {
      printf("Can't open, error %i\n", errno);
      return 1;
    }

    program_code = mmap(0, file_stat.st_size, PROT_READ, MAP_SHARED, fd, 0);
    if (!program_code) {
      printf("Can't mmap, code %i\n", errno);
      return 1;
    }

    program_code = init_bytecode(program_code);

    runops(interpreter, program_code);
    
  }
  return 0;

}

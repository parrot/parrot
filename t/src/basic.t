#! perl -w

use Parrot::Test tests => 2;

c_output_is(<<'CODE', <<'OUTPUT', "hello world");
        #include <stdio.h>

        int main(int argc, char* argv[]) {
                printf("Hello, World!\n");
        }
CODE
Hello, World!
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "direct internal_exception call");
        #include <parrot/parrot.h>
        #include <parrot/exceptions.h>

        int main(int argc, char* argv[]) {
                internal_exception(0, "Blow'd Up(tm)\n");
        }
CODE
Blow'd Up(tm)
OUTPUT

1;

#! perl -w

use Parrot::Test tests => 4;

c_output_is(<<'CODE', <<'OUTPUT', "creation");
        #include <stdio.h>
	#include "parrot/parrot.h"
	#include "parrot/embed.h"

        int main(int argc, char* argv[]) {
            int x;
            IntList* list;

            Interp* interpreter = Parrot_new(NULL);
            if (interpreter == NULL) return 1;
            Parrot_init(interpreter);

            list = intlist_new(interpreter);
            if (list == NULL) return 1;

            intlist_push(interpreter, list, 42);
            x = (int) intlist_get(interpreter, list, 0);

            printf("The answer is %d.\n", x);
            Parrot_exit(0);
            return 0;
        }
CODE
The answer is 42.
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "list aerobics");
        #include <stdio.h>
	#include "parrot/parrot.h"
	#include "parrot/embed.h"

        const char* aerobics()
        {
            int x = 0;
            int N = 10000; /* Number of iterations */
            int i;
            IntList* list;

            Interp* interpreter = Parrot_new(NULL);
            if (interpreter == NULL) return "create interpreter";
            Parrot_init(interpreter);

            list = intlist_new(interpreter);
            if (list == NULL) return "create list";

            /* Push 3, then pop 2. Repeat N times. */
            for (i = 0; i < N; i++) {
                intlist_push(interpreter, list, x++);
                intlist_push(interpreter, list, x++);
                intlist_push(interpreter, list, x++);
                if (intlist_pop(interpreter, list) != i * 3 + 2)
                    return "build-up first pop";
                if (intlist_pop(interpreter, list) != i * 3 + 1)
                    return "build-up second pop";
                if (intlist_length(interpreter, list) != i + 1)
                    return "build-up length";
            }

            /* Check list_get for all values */
            for (i = 0; i < N; i++) {
                if (intlist_get(interpreter, list, i) != i * 3)
                    return "get from left";
            }

            /* Check list_get for all values, from the right */
            for (i = -N; i < 0; i++) {
                if (intlist_get(interpreter, list, i) != (i + N) * 3)
                    return "get from right";
            }

            /* Set up the receding run */
            intlist_push(interpreter, list, N * 3 * 10);

            /* Pop 2, then push 1. Repeat N times. */
            for (i = N; i > 0; i--) {
                if (intlist_pop(interpreter, list) != i * 3 * 10)
                    return "tear down cap";
                if (intlist_pop(interpreter, list) != (i - 1) * 3)
                    return "tear down inner";
                intlist_push(interpreter, list, (i - 1) * 3 * 10);
                if (intlist_length(interpreter, list) != i)
                    return "tear down length";
            }

            /* And the final element is... */
            if (intlist_pop(interpreter, list) != 0)
                return "last survivor";

            printf("I need a shower.\n");

            return NULL;
        }

        int main(int argc, char* argv[]) {
            const char* failure = aerobics();
            if (failure == NULL) return 0;
            printf("Failed: %s\n", failure);
            return 1;
        }
CODE
I need a shower.
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "step aerobics");
        #include <stdio.h>
	#include "parrot/parrot.h"
	#include "parrot/embed.h"

        const char* aerobics(Interp* interpreter, IntList* list, int ground)
        {
            int x = 0;
            int N = 1000; /* Number of iterations */
            int i;
            static char msg[2000];

            /* Push 3, then pop 2. Repeat N times. */
            for (i = 0; i < N; i++) {
                intlist_push(interpreter, list, x++);
                intlist_push(interpreter, list, x++);
                intlist_push(interpreter, list, x++);
                if (intlist_pop(interpreter, list) != i * 3 + 2)
                    return "build-up first pop";
                if (intlist_pop(interpreter, list) != i * 3 + 1)
                    return "build-up second pop";
                if (intlist_length(interpreter, list)-ground != i + 1)
                    return "build-up length";
            }

            /* Check list_get for all values */
            for (i = 0; i < N; i++) {
                if (intlist_get(interpreter, list, i+ground) != i * 3) {
                    sprintf(msg, "get from left: wanted %d, got %d",
                            i * 3, intlist_get(interpreter, list, i+ground));
                    return msg;
                }
            }

            /* Check list_get for all values, from the right */
            for (i = -N; i < 0; i++) {
                if (intlist_get(interpreter, list, i) != (i + N) * 3)
                    return "get from right";
            }

            /* Set up the receding run */
            intlist_push(interpreter, list, N * 3 * 10);

            /* Pop 2, then push 1. Repeat N times. */
            for (i = N; i > 0; i--) {
                if (intlist_pop(interpreter, list) != i * 3 * 10)
                    return "tear down cap";
                if (intlist_pop(interpreter, list) != (i - 1) * 3)
                    return "tear down inner";
                intlist_push(interpreter, list, (i - 1) * 3 * 10);
                if (intlist_length(interpreter, list)-ground != i)
                    return "tear down length";
            }

            /* And the final element is... */
            if (intlist_pop(interpreter, list) != 0)
                return "last survivor";

            return NULL;
        }

        int main(int argc, char* argv[]) {
            int i;
            const char* failure;

            IntList* list;
            Interp* interpreter;

            interpreter = Parrot_new(NULL);
            if (interpreter == NULL) return 1;
            Parrot_init(interpreter);

            list = intlist_new(interpreter);
            if (list == NULL) return 1;

            printf("Step 1: 0\n");
            if ((failure = aerobics(interpreter, list, 0)) != NULL) {
                printf("Failed: %s\n", failure);
                return 1;
            }

            printf("Step 2: 1\n");
            intlist_push(interpreter, list, 42);
            if ((failure = aerobics(interpreter, list, 1)) != NULL) {
                printf("Failed: %s\n", failure);
                return 1;
            }

            printf("Step 3: 2\n");
            intlist_unshift(interpreter, &list, -42);
            if ((failure = aerobics(interpreter, list, 2)) != NULL) {
                printf("Failed: %s\n", failure);
                return 1;
            }

            printf("Step 4: 255\n");
            intlist_assign(interpreter, list, 254, -1);
            if ((failure = aerobics(interpreter, list, 255)) != NULL) {
                printf("Failed: %s\n", failure);
                return 1;
            }

            printf("Step 5: 256\n");
            intlist_unshift(interpreter, &list, -3);
            if ((failure = aerobics(interpreter, list, 256)) != NULL) {
                printf("Failed: %s\n", failure);
                return 1;
            }

            printf("Step 6: 257\n");
            intlist_unshift(interpreter, &list, -2);
            if ((failure = aerobics(interpreter, list, 257)) != NULL) {
                printf("Failed: %s\n", failure);
                return 1;
            }

            printf("Done.\n");
            return 0;
        }
CODE
Step 1: 0
Step 2: 1
Step 3: 2
Step 4: 255
Step 5: 256
Step 6: 257
Done.
OUTPUT

c_output_is(<<'CODE', <<'OUTPUT', "yoyo");
        #include <stdio.h>
	#include "parrot/parrot.h"
	#include "parrot/embed.h"

        void yoyo(Interp* interpreter, IntList** listP, int size)
        {
            int i;
            int x = 0;
            int distance = 1000;

            /* Set up the yoyo */
            for (i = 0; i < size; i++) {
                intlist_push(interpreter, *listP, x++);
            }

            /* Flick it out */
            for (i = 0; i < distance; i++) {
                intlist_push(interpreter, *listP, x++);
                if (intlist_get(interpreter, *listP, -1) != i + size)
                    printf("Out get failed on i=%d\n", i);
                if (intlist_shift(interpreter, listP) != i)
                    printf("Out shift failed on i=%d\n", i);
            }

            /* Suck it back */
            for (i = 0; i < distance + 10; i++) {
                intlist_unshift(interpreter, listP, x++);
                intlist_pop(interpreter, *listP);
            }

            /* Clean up the yoyo */
            for (i = 0; i < size; i++) {
                intlist_pop(interpreter, *listP);
            }
        }

        int main(int argc, char* argv[]) {
            int i;
            const char* failure;

            IntList* list;
            Interp* interpreter;

            interpreter = Parrot_new(NULL);
            if (interpreter == NULL) return 1;
            Parrot_init(interpreter);

            list = intlist_new(interpreter);
            if (list == NULL) return 1;

            for (i = 0; i < INTLIST_CHUNK_SIZE * 2.5; i++) {
                yoyo(interpreter, &list, i);
            }

            printf("Done.\n");
            return 0;
        }
CODE
Done.
OUTPUT

1;

/*
Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
$Id$

=head1 NAME

examples/mops/mops.c - Calculate M ops/s

=head1 SYNOPSIS

    % make examples/mops/mops
    % time examples/mops/mops

=head1 DESCRIPTION

A pure C implementation of the F<examples/mops/mops.pasm> example
program, for speed comparisons.

Calculates a value for M ops/s (million operations per second) using
integer arithmetic.

Prints out:

=over 4

=item * the number of look iterations, 

=item * the estimated number of ops performed,

=item * the elapsed time, and 

=item * the number of M op/s.

=back

=cut

*/

#include <parrot/parrot.h>
#include <stdio.h>


int
main(int argc, char *argv[])
{
    INTVAL I1;
    INTVAL I2;
    INTVAL I3;
    INTVAL I4;
    INTVAL I5;
    FLOATVAL N1;
    FLOATVAL N2;
    FLOATVAL N5;

    I2 = 0;                     /* set    I2, 0             */
    I3 = 1;                     /* set    I3, 1             */
    I4 = 100000000;             /* set    I4, 100000000     */
    /*                          */
    printf("Iterations:    %li\n", I4); /* print  "Iterations:    " */
    /* print  I4                */
    /* print  "\n"              */
    /*                          */
    I1 = 2;                     /* set    I1, 2             */
    I5 = I4 * I1;               /* mul    I5, I4, I1        */
    /*                          */
    printf("Estimated ops: %li\n", I5); /* print  "Estimated ops: " */
    /* print  I5                */
    /* print  "\n"              */
    /*                          */
    N1 = Parrot_floatval_time();/* time   N1                */
    /*                          */
  REDO:                        /* REDO:                    */
    I4 = I4 - I3;               /* sub    I4, I4, I3        */
    if ( I4 )
        goto REDO;              /* if     I4, REDO          */
    /*                          */
  DONE:                        /* DONE:                    */
    N5 = Parrot_floatval_time();/* time   N5                */
    /*                          */
    N2 = N5 - N1;               /* sub    N2, N5, N1        */
    /*                          */
    printf("Elapsed time:  %f\n", N2);  /* print  "Elapsed time:  " */
    /* print  N2                */
    /* print  "\n"              */
    /*                          */
    N1 = I5;                    /* iton   N1, I5            */
    N1 = N1 / N2;               /* div    N1, N1, N2        */
    N2 = 1000000.0;             /* set    N2, 1000000.0     */
    N1 = N1 / N2;               /* div    N1, N1, N2        */
    /*                          */
    printf("M op/s:        %f\n", N1);  /* print  "M op/s:        " */
    /* print  N1                */
    /* print  "\n"              */
    /*                          */
    return 0;                   /* end                      */
}

/*

=head1 SEE ALSO

F<examples/benchmarks/mops.pasm>,
F<examples/mops/mops.cs>,
F<examples/mops/mops.il>,
F<examples/mops/mops.p6>,
F<examples/mops/mops.pl>,
F<examples/mops/mops.ps>,
F<examples/mops/mops.py>,
F<examples/mops/mops.rb>,
F<examples/mops/mops.scheme>.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */

# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

Math/rand.pir - the ANSI C rand pseudorandom number generator

=head1 DESCRIPTION

The C<rand> function computes a sequence of pseudo-random integers in the
range 0 to C<RAND_MAX>.

The C<srand> function uses the argment as a seed for a new sequence of
pseudo-random numbers to be returned by subsequent calls to C<rand>.
If C<srand> is then called with the same seed value, the sequence of
pseudo-random numbers shall be repeated. If C<rand> is called before any calls
to C<srand> have been made, the same sequence shall be generated as when
C<srand> is first called with a seed value of 1.

Portage of the following C implementation, given as example by ISO/IEC 9899:1999.

  static unsigned long int next = 1;
  //
  int rand(void);
  {
      next = next * 1103515245 + 12345;
      return (unsigned int)(next/65536) % 32768;
  }
  //
  void srand(unsigned int seed)
  {
      next = seed;
  }

=head1 USAGE

    load_bytecode 'library/Math/rand.pbc'
    .local pmc rand
    rand = get_global [ 'Math'; 'Rand' ], 'rand'
    .local pmc srand
    srand = get_global [ 'Math'; 'Rand' ], 'srand'
    .local int seed
    srand(seed)
    $I0 = rand()
    .local pmc rand_max
    rand_max = get_global [ 'Math'; 'Rand' ], 'RAND_MAX'
    .local int RAND_MAX
    RAND_MAX = rand_max()

=cut

.namespace [ 'Math'; 'Rand' ]

.sub '__onload' :anon :load
#    print "__onload Math::Rand\n"
    new $P0, 'Integer'
    set $P0, 1
    set_global 'next', $P0
.end

.sub 'RAND_MAX'
    .return (32767)
.end

.sub 'rand'
    $P0 = get_global 'next'
    $I0 = $P0
    $I0 *= 1103515245
    $I0 += 12345
    set $P0, $I0
    $I0 /= 65536
    $I0 %= 32768
    .return ($I0)
.end

.sub 'srand'
    .param int seed
    $P0 = get_global 'next'
    set $P0, seed
.end


=back

=head1 AUTHORS

Francois Perrad

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

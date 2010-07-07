#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/op/sprintf2.t - Auxilliary tests for the sprintf opcode

=head1 SYNOPSIS

    % prove t/op/sprintf2.t

=head1 DESCRIPTION

Executes sprintf tests.

=cut


.sub main :main
    .include 'test_more.pir'

    plan(9)

    positive_length()
    negative_length()
    minus_option__positive_length()
    misc_w__minus_option()
    string__positive_length()
    string__negative_length()
    string__minus_flag()
    float_length_and_prec()
    float_neg_length_and_prec()

.end

.sub positive_length
  $P0 = new 'ResizablePMCArray'
  push $P0,4
  push $P0,12
  $S0 = sprintf '<%*d>', $P0
  is( $S0, '<  12>', 'positive length' )
.end

.sub negative_length
  $P0 = new 'ResizablePMCArray'
  push $P0,-4
  push $P0,12
  $S0 = sprintf '<%*d>', $P0
  is( $S0, '<12  >', 'negative length' )
.end

.sub minus_option__positive_length
  $P0 = new 'ResizablePMCArray'
  push $P0,4
  push $P0,12
  $S0 = sprintf '<%-*d>', $P0
  is( $S0, '<12  >', 'minus option, positive length' )
.end

.sub misc_w__minus_option
  $P0 = new 'ResizablePMCArray'
  push $P0,65
  push $P0,65
  push $P0,65
  push $P0,65
  push $P0,65
  push $P0,65
  push $P0,3
  push $P0,65
  push $P0,-4
  push $P0,65
  $S0 = sprintf '|%c|%0c|%-1c|%1c|%-6c|%6c|%*c|%*c|', $P0
  is( $S0, '|A|A|A|A|A     |     A|  A|A   |', 'misc w/ minus option' )
.end

.sub string__positive_length
  $P0 = new 'ResizablePMCArray'
  push $P0,4
  push $P0,"hi"
  $S0 = sprintf '<%*s>', $P0
  is( $S0, '<  hi>', 'string, positive length' )
.end

.sub string__negative_length
  $P0 = new 'ResizablePMCArray'
  push $P0,-4
  push $P0,"hi"
  $S0 = sprintf '<%*s>', $P0
  is( $S0, '<hi  >', 'string, negative length' )
.end

.sub string__minus_flag
  $P0 = new 'ResizablePMCArray'
  push $P0,4
  push $P0,"hi"
  $S0 = sprintf '<%-*s>', $P0
  is( $S0, '<hi  >', 'string, minus flag' )
.end

.sub float_length_and_prec
  $P0 = new 'ResizablePMCArray'
  push $P0,7
  push $P0,2
  push $P0,123.456
  $S0 = sprintf '<%*.*f>', $P0
  is( $S0, '< 123.46>', 'float length&prec' )
.end

.sub float_neg_length_and_prec
  $P0 = new 'ResizablePMCArray'
  push $P0,-7
  push $P0,2
  push $P0,123.456
  $S0 = sprintf '<%*.*f>', $P0
  is( $S0, '<123.46 >', 'float -length&prec' )
.end



# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

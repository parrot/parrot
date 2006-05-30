#! perl -w
# Copyright (C) 2006, The Perl Foundation.
# $Id: iterator.t  $

=head1 NAME

t/iterator.t - Lua iterators 

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/iterator.t

=head1 DESCRIPTION

See "Programming in Lua", section 7 "Iterators and the Generic for". 

=cut

use strict;

use Parrot::Test tests => 1;
use Test::More;
use FindBin;
use lib "$FindBin::Bin";

language_output_is( 'lua', <<'CODE', <<'OUT', 'list_iter' );
function list_iter (t)
    local i = 0
    local n = table.getn(t)
    return function ()
               i = i + 1
               if i <= n then
                   return t[i]
               else
                   return nil
               end
           end 
end

t = {10, 20, 30}
for element in list_iter(t) do
    print(element)
end
CODE
10
20
30
OUT


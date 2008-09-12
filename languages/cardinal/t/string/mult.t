require 'test'
plan 2

just_once = 'squAAK!'
twice = just_once * 2
is twice, "squAAK!squAAK!", '* operator on String'

ellipsis = '.' * 3
is ellipsis, '...', '* operator on String'

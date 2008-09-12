require 'test'
plan 2

str = "squaak! squaak!"
str.upcase
isnt str, 'SQUAAK! SQUAAK!', '.upcase on String'
some_other_str = str.upcase
is some_other_str, 'SQUAAK! SQUAAK!', '.upcase on String'

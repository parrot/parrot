require 'test'
plan 2

str = "squAAK! squAAK!"
str.downcase
isnt str, 'squaak! squaak!', '.downcase on String'
some_other_str = str.downcase
is some_other_str, 'squaak! squaak!', '.downcase on String'

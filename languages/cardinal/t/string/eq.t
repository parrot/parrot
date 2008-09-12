require 'test'
plan 2

str1 = "this is string\none"
str2 = "this is string\ntwo"
isnt str1, str2, '== for str1 and str2'

str3 = "lets see if str3 == str4"
str4 = "lets see if str3 == str4"
is str3, str4, '== for str1 and str2'

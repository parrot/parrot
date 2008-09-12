require 'test'
plan 2

str = "a long long time ago..."
str = str.capitalize
is str, "A long long time ago...", '.capitalize on String'

str = "a LONG LONG TIME AGO..."
str = str.capitalize
is str, "A long long time ago...", '.capitalize on String'

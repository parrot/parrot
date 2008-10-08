require 'test'
plan 2

pipe = open("| echo *.t")
p pipe.class
files = pipe.readline
p files
pipe.close

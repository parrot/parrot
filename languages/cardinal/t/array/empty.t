require 'test'
plan 2

a = [ 1, 2 ]
nothing = []
proclaim nothing.empty?, ".empty? on Array"
proclaim !a.empty?, ".empty? on Array"

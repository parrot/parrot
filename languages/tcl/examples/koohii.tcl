# Works with tclsh on OS X if you set your display encoding to UTF-8 
# This definitely does NOT work with tcl.pbc yet. Consider it a TODO.

# print out the kana for coffee.
fconfigure stdout -encoding utf-8
puts "\u30b3\u30fc\u30d2\u30fc"

require 'test'
plan 7

dynamic_languages = "If it walks like a parrot\nand if it squaaks like a parrot\nit probably is the elite vm!\n"
dynamic_languages = dynamic_languages.chomp()
is dynamic_languages, "If it walks like a parrot\nand if it squaaks like a parrot\nit probably is the elite vm!", '1st .chomp()' 
is dynamic_languages.chomp, "If it walks like a parrot\nand if it squaaks like a parrot\nit probably is the elite vm!", '2nd .chomp()' 
dl = dynamic_languages.chomp("elite vm!")
puts dl
is dl, "If it walks like a parrot\nand if it squaaks like a parrot\nit probably is the ", '3rd .chomp()'
dynamic_languages.chomp!("the ")
is dynamic_languages, "If it walks like a parrot\nand if it squaaks like a parrot\nit probably is ", '.chomp!()'
dynamic_languages = dynamic_languages.chop() 
is dynamic_languages, "If it walks like a parrot\nand if it squaaks like a parrot\nit probably is", '.chop()'
dynamic_languages.chop!()
is dynamic_languages, "If it walks like a parrot\nand if it squaaks like a parrot\nit probably i", '1st .chop!()'
s = ""
is s.chop(), "", '2nd .chop!()'



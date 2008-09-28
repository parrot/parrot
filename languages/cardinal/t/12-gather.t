require 'test'
plan 4

items = gather do
    take 0
    take 1
    take 2
end

is items.elems, 3, "basic gather"

items.each do |i|
    ok i < 3, "basic gather"
end

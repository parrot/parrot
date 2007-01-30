.sub main :main

  .local int x
  x = 2
  print x
  .namespace f
  .local int x
  x = 1
  print x
  .endnamespace f
  print x
  end
.end

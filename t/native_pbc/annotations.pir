.sub 'main'
.annotate "file", "annotations.pir"
.annotate "creator", "Parrot Foundation"
.annotate "line", 1
    say "Hi"
    say "line"
.annotate "line", 2
    .return ()
.end

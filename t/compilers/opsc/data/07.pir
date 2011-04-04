.sub "main" :main
    "hello"("Hello World")
    end
.end

.sub "hello"
    .param string arg
    say arg
.end

# BEGIN_RESULTS
# Hello World
# END_RESULTS

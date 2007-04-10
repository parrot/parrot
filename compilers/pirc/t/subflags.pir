.sub main :main

.end

.sub foo :load, :init

.end

.sub bar :vtable('get_string')

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

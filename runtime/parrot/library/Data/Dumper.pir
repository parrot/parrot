# Copyright (C) 2004-2009, Parrot Foundation.

.sub __library_data_dumper_onload :tag('load')
    .local pmc dd_class
    dd_class = get_class ['Data'; 'Dumper']
    if null dd_class goto load_library

    goto END

  load_library:
        load_bytecode "Data/Dumper/Default.pbc"
        newclass $P0, ['Data'; 'Dumper']
END:
    .return ()
.end

.namespace ['Data'; 'Dumper']

.sub dumper :method
    .param pmc dump
    .param string name           :optional
    .param int has_name          :opt_flag
    .param string indent         :optional
    .param int has_indent        :opt_flag
    .local pmc style

    if has_indent goto no_def_indent
    set indent, "    "
no_def_indent:
    # use a default name
    if has_name goto no_def_name
    set name, "VAR1"
no_def_name:
    # XXX: support different output styles
    .local pmc ddd_class

    push_eh ERROR2
        ddd_class = get_class ['Data'; 'Dumper'; 'Default']
        style     = ddd_class."new"()
    pop_eh

    style."prepare"( self, indent )
    style."dumpWithName"( name, name, dump )

    print "\n"

    .return ( 1 )

ERROR2:
    pop_eh
    print "can not find class ['Data'; 'Dumper'; 'Default']!\n"
    end
    .return ( 0 )
ERROR:
    print "Syntax:\n"
    print "dumper( pmc )\n"
    print "dumper( pmc, name )\n"
    print "dumper( pmc, name, indent )\n"
    .return ( 0 )
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

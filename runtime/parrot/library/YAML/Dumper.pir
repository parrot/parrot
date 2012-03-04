# Copyright (C) 2008-2009, Parrot Foundation.

.sub __library_data_dumper_onload :tag('load')
    .local pmc yd_class
    yd_class = get_class ['YAML'; 'Dumper']
    if null yd_class goto load_library

    goto END

  load_library:
        load_bytecode 'YAML/Dumper/Default.pbc'
        newclass $P0, ['YAML'; 'Dumper']
END:
    .return ()
.end

.namespace ['YAML'; 'Dumper']

.sub yaml :method
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
    .local pmc ydd_class

    push_eh ERROR2
        ydd_class = get_class ['YAML'; 'Dumper'; 'Default']
        style     = ydd_class."new"()
    pop_eh

    style."prepare"( self, indent )

    print "---\n{\n"

    style."dumpWithName"( name, name, dump )

    print ",\n}\n"

    .return ( 1 )

ERROR2:
    pop_eh
    print "can not find class ['YAML'; 'Dumper'; 'Default']!\n"
    end
    .return ( 0 )
ERROR:
    print "Syntax:\n"
    print "yaml( pmc )\n"
    print "yaml( pmc, name )\n"
    print "yaml( pmc, name, indent )\n"
    .return ( 0 )
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

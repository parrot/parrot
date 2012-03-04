# Copyright (C) 2004-2009, Parrot Foundation.

.macro export_dl_func(lib, name, sig)
    .local pmc edlftmp
    dlfunc edlftmp, .lib, .name, .sig
    set_global .name, edlftmp
.endm

.namespace ['Curses']
.sub __ncurses_init :tag('load')

loadlib $P1, 'libform'
if $P1 goto has_lib
loadlib $P1, 'cygform-8'
has_lib:
dlfunc $P2, $P1, 'new_field', 'piiiiii'
set_global 'new_field', $P2
dlfunc $P2, $P1, 'dup_field', 'ppii'
set_global 'dup_field', $P2
dlfunc $P2, $P1, 'link_field', 'ppii'
set_global 'link_field', $P2
dlfunc $P2, $P1, 'free_field', 'ip'
set_global 'free_field', $P2
dlfunc $P2, $P1, 'field_info', 'ip333333'
set_global 'field_info', $P2
dlfunc $P2, $P1, 'dynamic_field_info', 'ip333'
set_global 'dynamic_field_info', $P2
dlfunc $P2, $P1, 'set_max_field', 'ipi'
set_global 'set_max_field', $P2
dlfunc $P2, $P1, 'move_field', 'ipii'
set_global 'move_field', $P2
dlfunc $P2, $P1, 'set_new_page', 'ipl'
set_global 'set_new_page', $P2
dlfunc $P2, $P1, 'set_field_just', 'ipi'
set_global 'set_field_just', $P2
dlfunc $P2, $P1, 'field_just', 'ip'
set_global 'field_just', $P2
dlfunc $P2, $P1, 'set_field_fore', 'ipl'
set_global 'set_field_fore', $P2
dlfunc $P2, $P1, 'set_field_back', 'ipl'
set_global 'set_field_back', $P2
dlfunc $P2, $P1, 'set_field_pad', 'ipi'
set_global 'set_field_pad', $P2
dlfunc $P2, $P1, 'field_pad', 'ip'
set_global 'field_pad', $P2
dlfunc $P2, $P1, 'set_field_buffer', 'ipit'
set_global 'set_field_buffer', $P2
dlfunc $P2, $P1, 'set_field_status', 'ipl'
set_global 'set_field_status', $P2
dlfunc $P2, $P1, 'set_field_userptr', 'ipp'
set_global 'set_field_userptr', $P2
dlfunc $P2, $P1, 'set_field_opts', 'ipi'
set_global 'set_field_opts', $P2
dlfunc $P2, $P1, 'field_opts_on', 'ipi'
set_global 'field_opts_on', $P2
dlfunc $P2, $P1, 'field_opts_off', 'ipi'
set_global 'field_opts_off', $P2
dlfunc $P2, $P1, 'field_fore', 'lp'
set_global 'field_fore', $P2
dlfunc $P2, $P1, 'field_back', 'ip'
set_global 'field_back', $P2
dlfunc $P2, $P1, 'new_page', 'lp'
set_global 'new_page', $P2
dlfunc $P2, $P1, 'field_status', 'lp'
set_global 'field_status', $P2
dlfunc $P2, $P1, 'field_arg', 'pp'
set_global 'field_arg', $P2
dlfunc $P2, $P1, 'field_userptr', 'pp'
set_global 'field_userptr', $P2
dlfunc $P2, $P1, 'field_type', 'pp'
set_global 'field_type', $P2
dlfunc $P2, $P1, 'field_buffer', 'tpi'
set_global 'field_buffer', $P2
dlfunc $P2, $P1, 'field_opts', 'lp'
set_global 'field_opts', $P2
dlfunc $P2, $P1, 'new_form', 'pb'
set_global 'new_form', $P2
dlfunc $P2, $P1, 'current_field', 'pp'
set_global 'current_field', $P2
dlfunc $P2, $P1, 'form_win', 'pp'
set_global 'form_win', $P2
dlfunc $P2, $P1, 'form_sub', 'pp'
set_global 'form_sub', $P2
dlfunc $P2, $P1, 'free_form', 'ip'
set_global 'free_form', $P2
dlfunc $P2, $P1, 'set_form_fields', 'ipb'
set_global 'set_form_fields', $P2
dlfunc $P2, $P1, 'field_count', 'ip'
set_global 'field_count', $P2
dlfunc $P2, $P1, 'set_form_win', 'ipp'
set_global 'set_form_win', $P2
dlfunc $P2, $P1, 'set_form_sub', 'ipp'
set_global 'set_form_sub', $P2
dlfunc $P2, $P1, 'set_current_field', 'ipp'
set_global 'set_current_field', $P2
dlfunc $P2, $P1, 'field_index', 'ip'
set_global 'field_index', $P2
dlfunc $P2, $P1, 'set_form_page', 'ipi'
set_global 'set_form_page', $P2
dlfunc $P2, $P1, 'form_page', 'ip'
set_global 'form_page', $P2
dlfunc $P2, $P1, 'scale_form', 'ip33'
set_global 'scale_form', $P2
dlfunc $P2, $P1, 'post_form', 'ip'
set_global 'post_form', $P2
dlfunc $P2, $P1, 'unpost_form', 'ip'
set_global 'unpost_form', $P2
dlfunc $P2, $P1, 'pos_form_cursor', 'ip'
set_global 'pos_form_cursor', $P2
dlfunc $P2, $P1, 'form_driver', 'ipi'
set_global 'form_driver', $P2
dlfunc $P2, $P1, 'set_form_userptr', 'ipp'
set_global 'set_form_userptr', $P2
dlfunc $P2, $P1, 'set_form_opts', 'ipi'
set_global 'set_form_opts', $P2
dlfunc $P2, $P1, 'form_opts_on', 'ipi'
set_global 'form_opts_on', $P2
dlfunc $P2, $P1, 'form_opts_off', 'ipi'
set_global 'form_opts_off', $P2
dlfunc $P2, $P1, 'form_request_by_name', 'it'
set_global 'form_request_by_name', $P2
dlfunc $P2, $P1, 'form_request_name', 'ti'
set_global 'form_request_name', $P2
dlfunc $P2, $P1, 'form_userptr', 'pp'
set_global 'form_userptr', $P2
dlfunc $P2, $P1, 'form_opts', 'ip'
set_global 'form_opts', $P2
dlfunc $P2, $P1, 'data_ahead', 'lp'
set_global 'data_ahead', $P2
dlfunc $P2, $P1, 'data_behind', 'lp'
set_global 'data_behind', $P2

loadlib $P1, 'libpanel'
if $P1 goto has_panel_lib
loadlib $P1, 'cygpanel-8'
if $P1 goto has_panel_lib
goto no_panel_lib
has_panel_lib:
.export_dl_func($P1, 'new_panel', 'pp')
.export_dl_func($P1, 'bottom_panel', 'ip')
.export_dl_func($P1, 'top_panel', 'ip')
.export_dl_func($P1, 'show_panel', 'ip')
.export_dl_func($P1, 'update_panels', 'v')
.export_dl_func($P1, 'hide_panel', 'ip')
.export_dl_func($P1, 'panel_window', 'pp')
.export_dl_func($P1, 'replace_panel', 'ipp')
.export_dl_func($P1, 'move_panel', 'ipii')
.export_dl_func($P1, 'panel_hidden', 'ip')
.export_dl_func($P1, 'panel_above', 'pp')
.export_dl_func($P1, 'panel_below', 'pp')
.export_dl_func($P1, 'set_panel_userptr', 'ipp')
.export_dl_func($P1, 'panel_userptr', 'vp')
.export_dl_func($P1, 'del_panel', 'ip')
no_panel_lib:

loadlib $P1, 'libncurses'
if $P1 goto has_lib1
loadlib $P1, 'cygncurses-8'
has_lib1:
dlfunc $P2, $P1, 'keybound', 'tii'
set_global 'keybound', $P2

dlfunc $P2, $P1, 'curses_version', 't'
set_global 'curses_version', $P2
dlfunc $P2, $P1, 'assume_default_colors', 'iii'
set_global 'assume_default_colors', $P2
dlfunc $P2, $P1, 'define_key', 'iti'
set_global 'define_key', $P2
dlfunc $P2, $P1, 'keyok', 'iii'
set_global 'keyok', $P2
dlfunc $P2, $P1, 'resizeterm', 'iii'
set_global 'resizeterm', $P2
dlfunc $P2, $P1, 'use_default_colors', 'i'
set_global 'use_default_colors', $P2
dlfunc $P2, $P1, 'use_extended_names', 'ii'
set_global 'use_extended_names', $P2
dlfunc $P2, $P1, 'wresize', 'ipii'
set_global 'wresize', $P2
dlfunc $P2, $P1, 'addch', 'il'
set_global 'addch', $P2
dlfunc $P2, $P1, 'addchnstr', 'i4i'
set_global 'addchnstr', $P2
dlfunc $P2, $P1, 'addchstr', 'i4'
set_global 'addchstr', $P2
dlfunc $P2, $P1, 'addnstr', 'iti'
set_global 'addnstr', $P2
dlfunc $P2, $P1, 'addstr', 'it'
set_global 'addstr', $P2
dlfunc $P2, $P1, 'attroff', 'il'
set_global 'attroff', $P2
dlfunc $P2, $P1, 'attron', 'il'
set_global 'attron', $P2
dlfunc $P2, $P1, 'attrset', 'il'
set_global 'attrset', $P2
dlfunc $P2, $P1, 'attr_get', 'i42p'
set_global 'attr_get', $P2
dlfunc $P2, $P1, 'attr_off', 'ilp'
set_global 'attr_off', $P2
dlfunc $P2, $P1, 'attr_on', 'ilp'
set_global 'attr_on', $P2
dlfunc $P2, $P1, 'attr_set', 'ilsp'
set_global 'attr_set', $P2
dlfunc $P2, $P1, 'baudrate', 'i'
set_global 'baudrate', $P2
dlfunc $P2, $P1, 'beep', 'i'
set_global 'beep', $P2
dlfunc $P2, $P1, 'bkgd', 'il'
set_global 'bkgd', $P2
dlfunc $P2, $P1, 'bkgdset', 'vl'
set_global 'bkgdset', $P2
dlfunc $P2, $P1, 'border', 'villllllll'
set_global 'border', $P2
dlfunc $P2, $P1, 'box', 'ipll'
set_global 'box', $P2
dlfunc $P2, $P1, 'can_change_color', 'l'
set_global 'can_change_color', $P2
dlfunc $P2, $P1, 'cbreak', 'i'
set_global 'cbreak', $P2
dlfunc $P2, $P1, 'chgat', 'iilsp'
set_global 'chgat', $P2
dlfunc $P2, $P1, 'clear', 'i'
set_global 'clear', $P2
dlfunc $P2, $P1, 'clearok', 'ipl'
set_global 'clearok', $P2
dlfunc $P2, $P1, 'clrtobot', 'i'
set_global 'clrtobot', $P2
dlfunc $P2, $P1, 'clrtoeol', 'i'
set_global 'clrtoeol', $P2
dlfunc $P2, $P1, 'color_content', 'is222'
set_global 'color_content', $P2
dlfunc $P2, $P1, 'color_set', 'isp'
set_global 'color_set', $P2
dlfunc $P2, $P1, 'COLOR_PAIR', 'ii'
set_global 'COLOR_PAIR', $P2
dlfunc $P2, $P1, 'copywin', 'ippiiiiiiii'
set_global 'copywin', $P2
dlfunc $P2, $P1, 'curs_set', 'ii'
set_global 'curs_set', $P2
dlfunc $P2, $P1, 'def_prog_mode', 'i'
set_global 'def_prog_mode', $P2
dlfunc $P2, $P1, 'def_shell_mode', 'i'
set_global 'def_shell_mode', $P2
dlfunc $P2, $P1, 'delay_output', 'ii'
set_global 'delay_output', $P2
dlfunc $P2, $P1, 'delch', 'i'
set_global 'delch', $P2
dlfunc $P2, $P1, 'delscreen', 'vp'
set_global 'delscreen', $P2
dlfunc $P2, $P1, 'delwin', 'ip'
set_global 'delwin', $P2
dlfunc $P2, $P1, 'deleteln', 'i'
set_global 'deleteln', $P2
dlfunc $P2, $P1, 'derwin', 'ppiiii'
set_global 'derwin', $P2
dlfunc $P2, $P1, 'doupdate', 'i'
set_global 'doupdate', $P2
dlfunc $P2, $P1, 'dupwin', 'pp'
set_global 'dupwin', $P2
dlfunc $P2, $P1, 'echo', 'i'
set_global 'echo', $P2
dlfunc $P2, $P1, 'echochar', 'il'
set_global 'echochar', $P2
dlfunc $P2, $P1, 'erase', 'i'
set_global 'erase', $P2
dlfunc $P2, $P1, 'endwin', 'i'
set_global 'endwin', $P2
dlfunc $P2, $P1, 'erasechar', 'c'
set_global 'erasechar', $P2
dlfunc $P2, $P1, 'filter', 'v'
set_global 'filter', $P2
dlfunc $P2, $P1, 'flash', 'i'
set_global 'flash', $P2
dlfunc $P2, $P1, 'flushinp', 'i'
set_global 'flushinp', $P2
dlfunc $P2, $P1, 'getbkgd', 'lp'
set_global 'getbkgd', $P2
dlfunc $P2, $P1, 'getch', 'i'
set_global 'getch', $P2
dlfunc $P2, $P1, 'getnstr', 'iti'
set_global 'getnstr', $P2
dlfunc $P2, $P1, 'getstr', 'it'
set_global 'getstr', $P2
dlfunc $P2, $P1, 'getwin', 'pp'
set_global 'getwin', $P2
dlfunc $P2, $P1, 'halfdelay', 'ii'
set_global 'halfdelay', $P2
dlfunc $P2, $P1, 'has_colors', 'i'
set_global 'has_colors', $P2
dlfunc $P2, $P1, 'has_ic', 'i'
set_global 'has_ic', $P2
dlfunc $P2, $P1, 'has_il', 'i'
set_global 'has_il', $P2
dlfunc $P2, $P1, 'hline', 'ili'
set_global 'hline', $P2
dlfunc $P2, $P1, 'idcok', 'vpl'
set_global 'idcok', $P2
dlfunc $P2, $P1, 'idlok', 'ipl'
set_global 'idlok', $P2
dlfunc $P2, $P1, 'immedok', 'vpl'
set_global 'immedok', $P2
dlfunc $P2, $P1, 'inch', 'l'
set_global 'inch', $P2
dlfunc $P2, $P1, 'inchnstr', 'i4i'
set_global 'inchnstr', $P2
dlfunc $P2, $P1, 'inchstr', 'i4'
set_global 'inchstr', $P2
dlfunc $P2, $P1, 'initscr', 'p'
set_global 'initscr', $P2
dlfunc $P2, $P1, 'init_color', 'issss'
set_global 'init_color', $P2
dlfunc $P2, $P1, 'init_pair', 'isss'
set_global 'init_pair', $P2
dlfunc $P2, $P1, 'innstr', 'iti'
set_global 'innstr', $P2
dlfunc $P2, $P1, 'insstr', 'it'
set_global 'insstr', $P2
dlfunc $P2, $P1, 'instr', 'it'
set_global 'instr', $P2
dlfunc $P2, $P1, 'intrflush', 'ipl'
set_global 'intrflush', $P2
dlfunc $P2, $P1, 'isendwin', 'l'
set_global 'isendwin', $P2
dlfunc $P2, $P1, 'is_linetouched', 'lpi'
set_global 'is_linetouched', $P2
dlfunc $P2, $P1, 'is_wintouched', 'lp'
set_global 'is_wintouched', $P2
dlfunc $P2, $P1, 'keyname', 'ti'
set_global 'keyname', $P2
dlfunc $P2, $P1, 'keypad', 'ipl'
set_global 'keypad', $P2
dlfunc $P2, $P1, 'killchar', 'c'
set_global 'killchar', $P2
dlfunc $P2, $P1, 'leaveok', 'ipl'
set_global 'leaveok', $P2
dlfunc $P2, $P1, 'longname', 't'
set_global 'longname', $P2
dlfunc $P2, $P1, 'meta', 'ipl'
set_global 'meta', $P2
dlfunc $P2, $P1, 'move', 'iii'
set_global 'move', $P2
dlfunc $P2, $P1, 'mvaddch', 'iiil'
set_global 'mvaddch', $P2
dlfunc $P2, $P1, 'mvaddchnstr', 'iii4i'
set_global 'mvaddchnstr', $P2
dlfunc $P2, $P1, 'mvaddchstr', 'iii4'
set_global 'mvaddchstr', $P2
dlfunc $P2, $P1, 'mvaddnstr', 'iiiti'
set_global 'mvaddnstr', $P2
dlfunc $P2, $P1, 'mvaddstr', 'iiit'
set_global 'mvaddstr', $P2
dlfunc $P2, $P1, 'mvchgat', 'iiiilsp'
set_global 'mvchgat', $P2
#dlfunc $P2, $P1, 'mvcur', 'iiiii'
#set_global 'mvcur', $P2
dlfunc $P2, $P1, 'mvdelch', 'iii'
set_global 'mvdelch', $P2
dlfunc $P2, $P1, 'mvderwin', 'ipii'
set_global 'mvderwin', $P2
dlfunc $P2, $P1, 'mvgetch', 'iii'
set_global 'mvgetch', $P2
dlfunc $P2, $P1, 'mvgetnstr', 'iiiti'
set_global 'mvgetnstr', $P2
dlfunc $P2, $P1, 'mvgetstr', 'iiit'
set_global 'mvgetstr', $P2
dlfunc $P2, $P1, 'mvhline', 'iiili'
set_global 'mvhline', $P2
dlfunc $P2, $P1, 'mvinch', 'lii'
set_global 'mvinch', $P2
dlfunc $P2, $P1, 'mvinchnstr', 'iiiti'
set_global 'mvinchnstr', $P2
dlfunc $P2, $P1, 'mvinchstr', 'iii4'
set_global 'mvinchstr', $P2
dlfunc $P2, $P1, 'mvinnstr', 'iiiti'
set_global 'mvinnstr', $P2
dlfunc $P2, $P1, 'mvinsch', 'iiil'
set_global 'mvinsch', $P2
dlfunc $P2, $P1, 'mvinsnstr', 'iiiti'
set_global 'mvinsnstr', $P2
dlfunc $P2, $P1, 'mvinsstr', 'iiit'
set_global 'mvinsstr', $P2
dlfunc $P2, $P1, 'mvvline', 'iiili'
set_global 'mvvline', $P2
dlfunc $P2, $P1, 'mvwaddch', 'ipiil'
set_global 'mvwaddch', $P2
dlfunc $P2, $P1, 'mvwaddchnstr', 'ipii4i'
set_global 'mvwaddchnstr', $P2
dlfunc $P2, $P1, 'mvwaddchstr', 'ipii4'
set_global 'mvwaddchstr', $P2
dlfunc $P2, $P1, 'mvwaddnstr', 'ipiiti'
set_global 'mvwaddnstr', $P2
dlfunc $P2, $P1, 'mvwaddstr', 'ipiit'
set_global 'mvwaddstr', $P2
dlfunc $P2, $P1, 'mvwchgat', 'ipiiilsp'
set_global 'mvwchgat', $P2
dlfunc $P2, $P1, 'mvwdelch', 'ipii'
set_global 'mvwdelch', $P2
dlfunc $P2, $P1, 'mvwgetch', 'ipii'
set_global 'mvwgetch', $P2
dlfunc $P2, $P1, 'mvwgetnstr', 'ipiiti'
set_global 'mvwgetnstr', $P2
dlfunc $P2, $P1, 'mvwgetstr', 'ipiit'
set_global 'mvwgetstr', $P2
dlfunc $P2, $P1, 'mvwhline', 'ipiili'
set_global 'mvwhline', $P2
dlfunc $P2, $P1, 'mvwin', 'ipii'
set_global 'mvwin', $P2
dlfunc $P2, $P1, 'mvwinch', 'lpii'
set_global 'mvwinch', $P2
dlfunc $P2, $P1, 'mvwinchnstr', 'ipii4i'
set_global 'mvwinchnstr', $P2
dlfunc $P2, $P1, 'mvwinchstr', 'ipii4'
set_global 'mvwinchstr', $P2
dlfunc $P2, $P1, 'mvwinnstr', 'ipiiti'
set_global 'mvwinnstr', $P2
dlfunc $P2, $P1, 'mvwinsch', 'ipiil'
set_global 'mvwinsch', $P2
dlfunc $P2, $P1, 'mvwinsnstr', 'ipiiti'
set_global 'mvwinsnstr', $P2
dlfunc $P2, $P1, 'mvwinsstr', 'ipiit'
set_global 'mvwinsstr', $P2
dlfunc $P2, $P1, 'mvwinstr', 'ipiit'
set_global 'mvwinstr', $P2
dlfunc $P2, $P1, 'mvwvline', 'ipiili'
set_global 'mvwvline', $P2
dlfunc $P2, $P1, 'napms', 'ii'
set_global 'napms', $P2
dlfunc $P2, $P1, 'newpad', 'pii'
set_global 'newpad', $P2
dlfunc $P2, $P1, 'newterm', 'ptpp'
set_global 'newterm', $P2
dlfunc $P2, $P1, 'newwin', 'piiii'
set_global 'newwin', $P2
dlfunc $P2, $P1, 'nl', 'i'
set_global 'nl', $P2
dlfunc $P2, $P1, 'nocbreak', 'i'
set_global 'nocbreak', $P2
dlfunc $P2, $P1, 'nodelay', 'ipl'
set_global 'nodelay', $P2
dlfunc $P2, $P1, 'noecho', 'i'
set_global 'noecho', $P2
dlfunc $P2, $P1, 'nonl', 'i'
set_global 'nonl', $P2
dlfunc $P2, $P1, 'noqiflush', 'v'
set_global 'noqiflush', $P2
dlfunc $P2, $P1, 'noraw', 'i'
set_global 'noraw', $P2
dlfunc $P2, $P1, 'notimeout', 'ipl'
set_global 'notimeout', $P2
dlfunc $P2, $P1, 'overlay', 'ipp'
set_global 'overlay', $P2
dlfunc $P2, $P1, 'overwrite', 'ipp'
set_global 'overwrite', $P2
dlfunc $P2, $P1, 'pair_content', 'is22'
set_global 'pair_content', $P2
dlfunc $P2, $P1, 'PAIR_NUMBER', 'ii'
set_global 'PAIR_NUMBER', $P2
dlfunc $P2, $P1, 'pechochar', 'ipl'
set_global 'pechochar', $P2
dlfunc $P2, $P1, 'pnoutrefresh', 'ipiiiiii'
set_global 'pnoutrefresh', $P2
dlfunc $P2, $P1, 'prefresh', 'ipiiiiii'
set_global 'prefresh', $P2
dlfunc $P2, $P1, 'putp', 'it'
set_global 'putp', $P2
dlfunc $P2, $P1, 'putwin', 'ipp'
set_global 'putwin', $P2
dlfunc $P2, $P1, 'qiflush', 'v'
set_global 'qiflush', $P2
dlfunc $P2, $P1, 'raw', 'i'
set_global 'raw', $P2
dlfunc $P2, $P1, 'redrawwin', 'ip'
set_global 'redrawwin', $P2
dlfunc $P2, $P1, 'refresh', 'i'
set_global 'refresh', $P2
dlfunc $P2, $P1, 'resetty', 'i'
set_global 'resetty', $P2
dlfunc $P2, $P1, 'reset_prog_mode', 'i'
set_global 'reset_prog_mode', $P2
dlfunc $P2, $P1, 'reset_shell_mode', 'i'
set_global 'reset_shell_mode', $P2
dlfunc $P2, $P1, 'ripoffline', 'iiip'
set_global 'ripoffline', $P2
dlfunc $P2, $P1, 'savetty', 'i'
set_global 'savetty', $P2
dlfunc $P2, $P1, 'scr_dump', 'it'
set_global 'scr_dump', $P2
dlfunc $P2, $P1, 'scr_init', 'it'
set_global 'scr_init', $P2
dlfunc $P2, $P1, 'scrl', 'ii'
set_global 'scrl', $P2
dlfunc $P2, $P1, 'scroll', 'ip'
set_global 'scroll', $P2
dlfunc $P2, $P1, 'scrollok', 'ipl'
set_global 'scrollok', $P2
dlfunc $P2, $P1, 'scr_restore', 'it'
set_global 'scr_restore', $P2
dlfunc $P2, $P1, 'scr_set', 'it'
set_global 'scr_set', $P2
dlfunc $P2, $P1, 'setscrreg', 'iii'
set_global 'setscrreg', $P2
dlfunc $P2, $P1, 'set_term', 'pp'
set_global 'set_term', $P2
dlfunc $P2, $P1, 'slk_attroff', 'il'
set_global 'slk_attroff', $P2
dlfunc $P2, $P1, 'slk_attron', 'il'
set_global 'slk_attron', $P2
dlfunc $P2, $P1, 'slk_attrset', 'il'
set_global 'slk_attrset', $P2
dlfunc $P2, $P1, 'slk_attr', 'l'
set_global 'slk_attr', $P2
dlfunc $P2, $P1, 'slk_attr_set', 'ilsp'
set_global 'slk_attr_set', $P2
dlfunc $P2, $P1, 'slk_clear', 'i'
set_global 'slk_clear', $P2
dlfunc $P2, $P1, 'slk_color', 'is'
set_global 'slk_color', $P2
dlfunc $P2, $P1, 'slk_init', 'ii'
set_global 'slk_init', $P2
dlfunc $P2, $P1, 'slk_label', 'ti'
set_global 'slk_label', $P2
dlfunc $P2, $P1, 'slk_noutrefresh', 'i'
set_global 'slk_noutrefresh', $P2
dlfunc $P2, $P1, 'slk_refresh', 'i'
set_global 'slk_refresh', $P2
dlfunc $P2, $P1, 'slk_restore', 'i'
set_global 'slk_restore', $P2
dlfunc $P2, $P1, 'slk_set', 'iiti'
set_global 'slk_set', $P2
dlfunc $P2, $P1, 'slk_touch', 'i'
set_global 'slk_touch', $P2
dlfunc $P2, $P1, 'standout', 'i'
set_global 'standout', $P2
dlfunc $P2, $P1, 'standend', 'i'
set_global 'standend', $P2
dlfunc $P2, $P1, 'start_color', 'i'
set_global 'start_color', $P2
dlfunc $P2, $P1, 'subpad', 'ppiiii'
set_global 'subpad', $P2
dlfunc $P2, $P1, 'subwin', 'ppiiii'
set_global 'subwin', $P2
dlfunc $P2, $P1, 'syncok', 'ipl'
set_global 'syncok', $P2
dlfunc $P2, $P1, 'termattrs', 'l'
set_global 'termattrs', $P2
dlfunc $P2, $P1, 'termname', 't'
set_global 'termname', $P2
dlfunc $P2, $P1, 'tigetflag', 'it'
set_global 'tigetflag', $P2
dlfunc $P2, $P1, 'tigetnum', 'it'
set_global 'tigetnum', $P2
dlfunc $P2, $P1, 'tigetstr', 'tt'
set_global 'tigetstr', $P2
dlfunc $P2, $P1, 'timeout', 'vi'
set_global 'timeout', $P2
dlfunc $P2, $P1, 'typeahead', 'ii'
set_global 'typeahead', $P2
dlfunc $P2, $P1, 'ungetch', 'ii'
set_global 'ungetch', $P2
dlfunc $P2, $P1, 'untouchwin', 'ip'
set_global 'untouchwin', $P2
dlfunc $P2, $P1, 'use_env', 'vl'
set_global 'use_env', $P2
dlfunc $P2, $P1, 'vidattr', 'il'
set_global 'vidattr', $P2
dlfunc $P2, $P1, 'vidputs', 'ilp'
set_global 'vidputs', $P2
dlfunc $P2, $P1, 'vline', 'ili'
set_global 'vline', $P2
dlfunc $P2, $P1, 'waddch', 'ipl'
set_global 'waddch', $P2
dlfunc $P2, $P1, 'waddchnstr', 'ip4i'
set_global 'waddchnstr', $P2
dlfunc $P2, $P1, 'waddchstr', 'ip4'
set_global 'waddchstr', $P2
dlfunc $P2, $P1, 'waddnstr', 'ipti'
set_global 'waddnstr', $P2
dlfunc $P2, $P1, 'waddstr', 'ipt'
set_global 'waddstr', $P2
dlfunc $P2, $P1, 'wattron', 'ipi'
set_global 'wattron', $P2
dlfunc $P2, $P1, 'wattroff', 'ipi'
set_global 'wattroff', $P2
dlfunc $P2, $P1, 'wattrset', 'ipi'
set_global 'wattrset', $P2
dlfunc $P2, $P1, 'wattr_get', 'ip42p'
set_global 'wattr_get', $P2
dlfunc $P2, $P1, 'wattr_on', 'iplp'
set_global 'wattr_on', $P2
dlfunc $P2, $P1, 'wattr_off', 'iplp'
set_global 'wattr_off', $P2
dlfunc $P2, $P1, 'wattr_set', 'iplsp'
set_global 'wattr_set', $P2
dlfunc $P2, $P1, 'wbkgd', 'ipl'
set_global 'wbkgd', $P2
dlfunc $P2, $P1, 'wbkgdset', 'vpl'
set_global 'wbkgdset', $P2
dlfunc $P2, $P1, 'wborder', 'ipllllllll'
set_global 'wborder', $P2
dlfunc $P2, $P1, 'wchgat', 'ipilsp'
set_global 'wchgat', $P2
dlfunc $P2, $P1, 'wclear', 'ip'
set_global 'wclear', $P2
dlfunc $P2, $P1, 'wclrtobot', 'ip'
set_global 'wclrtobot', $P2
dlfunc $P2, $P1, 'wclrtoeol', 'ip'
set_global 'wclrtoeol', $P2
dlfunc $P2, $P1, 'wcolor_set', 'ipsp'
set_global 'wcolor_set', $P2
dlfunc $P2, $P1, 'wcursyncup', 'vp'
set_global 'wcursyncup', $P2
dlfunc $P2, $P1, 'wdelch', 'ip'
set_global 'wdelch', $P2
dlfunc $P2, $P1, 'wdeleteln', 'ip'
set_global 'wdeleteln', $P2
dlfunc $P2, $P1, 'wechochar', 'ipl'
set_global 'wechochar', $P2
dlfunc $P2, $P1, 'werase', 'ip'
set_global 'werase', $P2
dlfunc $P2, $P1, 'wgetch', 'ip'
set_global 'wgetch', $P2
dlfunc $P2, $P1, 'wgetnstr', 'ipti'
set_global 'wgetnstr', $P2
dlfunc $P2, $P1, 'wgetstr', 'ipt'
set_global 'wgetstr', $P2
dlfunc $P2, $P1, 'whline', 'ipli'
set_global 'whline', $P2
dlfunc $P2, $P1, 'winch', 'lp'
set_global 'winch', $P2
dlfunc $P2, $P1, 'winchnstr', 'ip4i'
set_global 'winchnstr', $P2
dlfunc $P2, $P1, 'winnstr', 'ipti'
set_global 'winnstr', $P2
dlfunc $P2, $P1, 'winsch', 'ipl'
set_global 'winsch', $P2
dlfunc $P2, $P1, 'winsdelln', 'ipi'
set_global 'winsdelln', $P2
dlfunc $P2, $P1, 'winsertln', 'ip'
set_global 'winsertln', $P2
dlfunc $P2, $P1, 'winsnstr', 'ipti'
set_global 'winsnstr', $P2
dlfunc $P2, $P1, 'winsstr', 'ipt'
set_global 'winsstr', $P2
dlfunc $P2, $P1, 'winstr', 'ipt'
set_global 'winstr', $P2
dlfunc $P2, $P1, 'wmove', 'ipii'
set_global 'wmove', $P2
dlfunc $P2, $P1, 'wnoutrefresh', 'ip'
set_global 'wnoutrefresh', $P2
dlfunc $P2, $P1, 'wredrawln', 'ipii'
set_global 'wredrawln', $P2
dlfunc $P2, $P1, 'wrefresh', 'ip'
set_global 'wrefresh', $P2
dlfunc $P2, $P1, 'wscrl', 'ipi'
set_global 'wscrl', $P2
dlfunc $P2, $P1, 'wsetscrreg', 'ipii'
set_global 'wsetscrreg', $P2
dlfunc $P2, $P1, 'wstandout', 'ip'
set_global 'wstandout', $P2
dlfunc $P2, $P1, 'wstandend', 'ip'
set_global 'wstandend', $P2
dlfunc $P2, $P1, 'wsyncdown', 'vp'
set_global 'wsyncdown', $P2
dlfunc $P2, $P1, 'wsyncup', 'vp'
set_global 'wsyncup', $P2
dlfunc $P2, $P1, 'wtimeout', 'vpi'
set_global 'wtimeout', $P2
dlfunc $P2, $P1, 'wtouchln', 'ipiii'
set_global 'wtouchln', $P2
dlfunc $P2, $P1, 'wvline', 'ipli'
set_global 'wvline', $P2
dlfunc $P2, $P1, 'getmouse', 'ip'
set_global 'getmouse', $P2
dlfunc $P2, $P1, 'ungetmouse', 'ip'
set_global 'ungetmouse', $P2
dlfunc $P2, $P1, 'mousemask', 'll4'
set_global 'mousemask', $P2
dlfunc $P2, $P1, 'wenclose', 'lpii'
set_global 'wenclose', $P2
dlfunc $P2, $P1, 'mouseinterval', 'ii'
set_global 'mouseinterval', $P2
dlfunc $P2, $P1, 'wmouse_trafo', 'lp33l'
set_global 'wmouse_trafo', $P2
dlfunc $P2, $P1, 'mouse_trafo', 'l33l'
set_global 'mouse_trafo', $P2
dlfunc $P2, $P1, 'mcprint', 'iti'
set_global 'mcprint', $P2
dlfunc $P2, $P1, 'has_key', 'ii'
set_global 'has_key', $P2
.export_dl_func($P1, 'getmaxx', 'ip')
.export_dl_func($P1, 'getmaxy', 'ip')

.begin_return
.end_return
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

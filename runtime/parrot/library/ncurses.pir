# Copyright (C) 2004-2009, Parrot Foundation.

.sub __ncurses_init :tag('load')

loadlib $P1, 'libform'
if $P1 goto has_lib
loadlib $P1, 'cygform-8'
has_lib:
dlfunc $P2, $P1, 'new_field', 'piiiiii'
set_global 'ncurses::new_field', $P2
dlfunc $P2, $P1, 'dup_field', 'ppii'
set_global 'ncurses::dup_field', $P2
dlfunc $P2, $P1, 'link_field', 'ppii'
set_global 'ncurses::link_field', $P2
dlfunc $P2, $P1, 'free_field', 'ip'
set_global 'ncurses::free_field', $P2
dlfunc $P2, $P1, 'field_info', 'ip333333'
set_global 'ncurses::field_info', $P2
dlfunc $P2, $P1, 'dynamic_field_info', 'ip333'
set_global 'ncurses::dynamic_field_info', $P2
dlfunc $P2, $P1, 'set_max_field', 'ipi'
set_global 'ncurses::set_max_field', $P2
dlfunc $P2, $P1, 'move_field', 'ipii'
set_global 'ncurses::move_field', $P2
dlfunc $P2, $P1, 'set_new_page', 'ipl'
set_global 'ncurses::set_new_page', $P2
dlfunc $P2, $P1, 'set_field_just', 'ipi'
set_global 'ncurses::set_field_just', $P2
dlfunc $P2, $P1, 'field_just', 'ip'
set_global 'ncurses::field_just', $P2
dlfunc $P2, $P1, 'set_field_fore', 'ipl'
set_global 'ncurses::set_field_fore', $P2
dlfunc $P2, $P1, 'set_field_back', 'ipl'
set_global 'ncurses::set_field_back', $P2
dlfunc $P2, $P1, 'set_field_pad', 'ipi'
set_global 'ncurses::set_field_pad', $P2
dlfunc $P2, $P1, 'field_pad', 'ip'
set_global 'ncurses::field_pad', $P2
dlfunc $P2, $P1, 'set_field_buffer', 'ipit'
set_global 'ncurses::set_field_buffer', $P2
dlfunc $P2, $P1, 'set_field_status', 'ipl'
set_global 'ncurses::set_field_status', $P2
dlfunc $P2, $P1, 'set_field_userptr', 'ipp'
set_global 'ncurses::set_field_userptr', $P2
dlfunc $P2, $P1, 'set_field_opts', 'ipi'
set_global 'ncurses::set_field_opts', $P2
dlfunc $P2, $P1, 'field_opts_on', 'ipi'
set_global 'ncurses::field_opts_on', $P2
dlfunc $P2, $P1, 'field_opts_off', 'ipi'
set_global 'ncurses::field_opts_off', $P2
dlfunc $P2, $P1, 'field_fore', 'lp'
set_global 'ncurses::field_fore', $P2
dlfunc $P2, $P1, 'field_back', 'ip'
set_global 'ncurses::field_back', $P2
dlfunc $P2, $P1, 'new_page', 'lp'
set_global 'ncurses::new_page', $P2
dlfunc $P2, $P1, 'field_status', 'lp'
set_global 'ncurses::field_status', $P2
dlfunc $P2, $P1, 'field_arg', 'pp'
set_global 'ncurses::field_arg', $P2
dlfunc $P2, $P1, 'field_userptr', 'pp'
set_global 'ncurses::field_userptr', $P2
dlfunc $P2, $P1, 'field_type', 'pp'
set_global 'ncurses::field_type', $P2
dlfunc $P2, $P1, 'field_buffer', 'tpi'
set_global 'ncurses::field_buffer', $P2
dlfunc $P2, $P1, 'field_opts', 'lp'
set_global 'ncurses::field_opts', $P2
dlfunc $P2, $P1, 'new_form', 'pb'
set_global 'ncurses::new_form', $P2
dlfunc $P2, $P1, 'current_field', 'pp'
set_global 'ncurses::current_field', $P2
dlfunc $P2, $P1, 'form_win', 'pp'
set_global 'ncurses::form_win', $P2
dlfunc $P2, $P1, 'form_sub', 'pp'
set_global 'ncurses::form_sub', $P2
dlfunc $P2, $P1, 'free_form', 'ip'
set_global 'ncurses::free_form', $P2
dlfunc $P2, $P1, 'set_form_fields', 'ipb'
set_global 'ncurses::set_form_fields', $P2
dlfunc $P2, $P1, 'field_count', 'ip'
set_global 'ncurses::field_count', $P2
dlfunc $P2, $P1, 'set_form_win', 'ipp'
set_global 'ncurses::set_form_win', $P2
dlfunc $P2, $P1, 'set_form_sub', 'ipp'
set_global 'ncurses::set_form_sub', $P2
dlfunc $P2, $P1, 'set_current_field', 'ipp'
set_global 'ncurses::set_current_field', $P2
dlfunc $P2, $P1, 'field_index', 'ip'
set_global 'ncurses::field_index', $P2
dlfunc $P2, $P1, 'set_form_page', 'ipi'
set_global 'ncurses::set_form_page', $P2
dlfunc $P2, $P1, 'form_page', 'ip'
set_global 'ncurses::form_page', $P2
dlfunc $P2, $P1, 'scale_form', 'ip33'
set_global 'ncurses::scale_form', $P2
dlfunc $P2, $P1, 'post_form', 'ip'
set_global 'ncurses::post_form', $P2
dlfunc $P2, $P1, 'unpost_form', 'ip'
set_global 'ncurses::unpost_form', $P2
dlfunc $P2, $P1, 'pos_form_cursor', 'ip'
set_global 'ncurses::pos_form_cursor', $P2
dlfunc $P2, $P1, 'form_driver', 'ipi'
set_global 'ncurses::form_driver', $P2
dlfunc $P2, $P1, 'set_form_userptr', 'ipp'
set_global 'ncurses::set_form_userptr', $P2
dlfunc $P2, $P1, 'set_form_opts', 'ipi'
set_global 'ncurses::set_form_opts', $P2
dlfunc $P2, $P1, 'form_opts_on', 'ipi'
set_global 'ncurses::form_opts_on', $P2
dlfunc $P2, $P1, 'form_opts_off', 'ipi'
set_global 'ncurses::form_opts_off', $P2
dlfunc $P2, $P1, 'form_request_by_name', 'it'
set_global 'ncurses::form_request_by_name', $P2
dlfunc $P2, $P1, 'form_request_name', 'ti'
set_global 'ncurses::form_request_name', $P2
dlfunc $P2, $P1, 'form_userptr', 'pp'
set_global 'ncurses::form_userptr', $P2
dlfunc $P2, $P1, 'form_opts', 'ip'
set_global 'ncurses::form_opts', $P2
dlfunc $P2, $P1, 'data_ahead', 'lp'
set_global 'ncurses::data_ahead', $P2
dlfunc $P2, $P1, 'data_behind', 'lp'
set_global 'ncurses::data_behind', $P2

loadlib $P1, 'libncurses'
if $P1 goto has_lib1
loadlib $P1, 'cygncurses-8'
has_lib1:
dlfunc $P2, $P1, 'keybound', 'tii'
set_global 'ncurses::keybound', $P2

dlfunc $P2, $P1, 'curses_version', 't'
set_global 'ncurses::curses_version', $P2
dlfunc $P2, $P1, 'assume_default_colors', 'iii'
set_global 'ncurses::assume_default_colors', $P2
dlfunc $P2, $P1, 'define_key', 'iti'
set_global 'ncurses::define_key', $P2
dlfunc $P2, $P1, 'keyok', 'iii'
set_global 'ncurses::keyok', $P2
dlfunc $P2, $P1, 'resizeterm', 'iii'
set_global 'ncurses::resizeterm', $P2
dlfunc $P2, $P1, 'use_default_colors', 'i'
set_global 'ncurses::use_default_colors', $P2
dlfunc $P2, $P1, 'use_extended_names', 'ii'
set_global 'ncurses::use_extended_names', $P2
dlfunc $P2, $P1, 'wresize', 'ipii'
set_global 'ncurses::wresize', $P2
dlfunc $P2, $P1, 'addch', 'il'
set_global 'ncurses::addch', $P2
dlfunc $P2, $P1, 'addchnstr', 'i4i'
set_global 'ncurses::addchnstr', $P2
dlfunc $P2, $P1, 'addchstr', 'i4'
set_global 'ncurses::addchstr', $P2
dlfunc $P2, $P1, 'addnstr', 'iti'
set_global 'ncurses::addnstr', $P2
dlfunc $P2, $P1, 'addstr', 'it'
set_global 'ncurses::addstr', $P2
dlfunc $P2, $P1, 'attroff', 'il'
set_global 'ncurses::attroff', $P2
dlfunc $P2, $P1, 'attron', 'il'
set_global 'ncurses::attron', $P2
dlfunc $P2, $P1, 'attrset', 'il'
set_global 'ncurses::attrset', $P2
dlfunc $P2, $P1, 'attr_get', 'i42p'
set_global 'ncurses::attr_get', $P2
dlfunc $P2, $P1, 'attr_off', 'ilp'
set_global 'ncurses::attr_off', $P2
dlfunc $P2, $P1, 'attr_on', 'ilp'
set_global 'ncurses::attr_on', $P2
dlfunc $P2, $P1, 'attr_set', 'ilsp'
set_global 'ncurses::attr_set', $P2
dlfunc $P2, $P1, 'baudrate', 'i'
set_global 'ncurses::baudrate', $P2
dlfunc $P2, $P1, 'beep', 'i'
set_global 'ncurses::beep', $P2
dlfunc $P2, $P1, 'bkgd', 'il'
set_global 'ncurses::bkgd', $P2
dlfunc $P2, $P1, 'bkgdset', 'vl'
set_global 'ncurses::bkgdset', $P2
dlfunc $P2, $P1, 'border', 'villllllll'
set_global 'ncurses::border', $P2
dlfunc $P2, $P1, 'box', 'ipll'
set_global 'ncurses::box', $P2
dlfunc $P2, $P1, 'can_change_color', 'l'
set_global 'ncurses::can_change_color', $P2
dlfunc $P2, $P1, 'cbreak', 'i'
set_global 'ncurses::cbreak', $P2
dlfunc $P2, $P1, 'chgat', 'iilsp'
set_global 'ncurses::chgat', $P2
dlfunc $P2, $P1, 'clear', 'i'
set_global 'ncurses::clear', $P2
dlfunc $P2, $P1, 'clearok', 'ipl'
set_global 'ncurses::clearok', $P2
dlfunc $P2, $P1, 'clrtobot', 'i'
set_global 'ncurses::clrtobot', $P2
dlfunc $P2, $P1, 'clrtoeol', 'i'
set_global 'ncurses::clrtoeol', $P2
dlfunc $P2, $P1, 'color_content', 'is222'
set_global 'ncurses::color_content', $P2
dlfunc $P2, $P1, 'color_set', 'isp'
set_global 'ncurses::color_set', $P2
dlfunc $P2, $P1, 'COLOR_PAIR', 'ii'
set_global 'ncurses::COLOR_PAIR', $P2
dlfunc $P2, $P1, 'copywin', 'ippiiiiiiii'
set_global 'ncurses::copywin', $P2
dlfunc $P2, $P1, 'curs_set', 'ii'
set_global 'ncurses::curs_set', $P2
dlfunc $P2, $P1, 'def_prog_mode', 'i'
set_global 'ncurses::def_prog_mode', $P2
dlfunc $P2, $P1, 'def_shell_mode', 'i'
set_global 'ncurses::def_shell_mode', $P2
dlfunc $P2, $P1, 'delay_output', 'ii'
set_global 'ncurses::delay_output', $P2
dlfunc $P2, $P1, 'delch', 'i'
set_global 'ncurses::delch', $P2
dlfunc $P2, $P1, 'delscreen', 'vp'
set_global 'ncurses::delscreen', $P2
dlfunc $P2, $P1, 'delwin', 'ip'
set_global 'ncurses::delwin', $P2
dlfunc $P2, $P1, 'deleteln', 'i'
set_global 'ncurses::deleteln', $P2
dlfunc $P2, $P1, 'derwin', 'ppiiii'
set_global 'ncurses::derwin', $P2
dlfunc $P2, $P1, 'doupdate', 'i'
set_global 'ncurses::doupdate', $P2
dlfunc $P2, $P1, 'dupwin', 'pp'
set_global 'ncurses::dupwin', $P2
dlfunc $P2, $P1, 'echo', 'i'
set_global 'ncurses::echo', $P2
dlfunc $P2, $P1, 'echochar', 'il'
set_global 'ncurses::echochar', $P2
dlfunc $P2, $P1, 'erase', 'i'
set_global 'ncurses::erase', $P2
dlfunc $P2, $P1, 'endwin', 'i'
set_global 'ncurses::endwin', $P2
dlfunc $P2, $P1, 'erasechar', 'c'
set_global 'ncurses::erasechar', $P2
dlfunc $P2, $P1, 'filter', 'v'
set_global 'ncurses::filter', $P2
dlfunc $P2, $P1, 'flash', 'i'
set_global 'ncurses::flash', $P2
dlfunc $P2, $P1, 'flushinp', 'i'
set_global 'ncurses::flushinp', $P2
dlfunc $P2, $P1, 'getbkgd', 'lp'
set_global 'ncurses::getbkgd', $P2
dlfunc $P2, $P1, 'getch', 'i'
set_global 'ncurses::getch', $P2
dlfunc $P2, $P1, 'getnstr', 'iti'
set_global 'ncurses::getnstr', $P2
dlfunc $P2, $P1, 'getstr', 'it'
set_global 'ncurses::getstr', $P2
dlfunc $P2, $P1, 'getwin', 'pp'
set_global 'ncurses::getwin', $P2
dlfunc $P2, $P1, 'halfdelay', 'ii'
set_global 'ncurses::halfdelay', $P2
dlfunc $P2, $P1, 'has_colors', 'i'
set_global 'ncurses::has_colors', $P2
dlfunc $P2, $P1, 'has_ic', 'i'
set_global 'ncurses::has_ic', $P2
dlfunc $P2, $P1, 'has_il', 'i'
set_global 'ncurses::has_il', $P2
dlfunc $P2, $P1, 'hline', 'ili'
set_global 'ncurses::hline', $P2
dlfunc $P2, $P1, 'idcok', 'vpl'
set_global 'ncurses::idcok', $P2
dlfunc $P2, $P1, 'idlok', 'ipl'
set_global 'ncurses::idlok', $P2
dlfunc $P2, $P1, 'immedok', 'vpl'
set_global 'ncurses::immedok', $P2
dlfunc $P2, $P1, 'inch', 'l'
set_global 'ncurses::inch', $P2
dlfunc $P2, $P1, 'inchnstr', 'i4i'
set_global 'ncurses::inchnstr', $P2
dlfunc $P2, $P1, 'inchstr', 'i4'
set_global 'ncurses::inchstr', $P2
dlfunc $P2, $P1, 'initscr', 'p'
set_global 'ncurses::tag('init')scr', $P2
dlfunc $P2, $P1, 'init_color', 'issss'
set_global 'ncurses::tag('init')_color', $P2
dlfunc $P2, $P1, 'init_pair', 'isss'
set_global 'ncurses::tag('init')_pair', $P2
dlfunc $P2, $P1, 'innstr', 'iti'
set_global 'ncurses::innstr', $P2
dlfunc $P2, $P1, 'insstr', 'it'
set_global 'ncurses::insstr', $P2
dlfunc $P2, $P1, 'instr', 'it'
set_global 'ncurses::instr', $P2
dlfunc $P2, $P1, 'intrflush', 'ipl'
set_global 'ncurses::intrflush', $P2
dlfunc $P2, $P1, 'isendwin', 'l'
set_global 'ncurses::isendwin', $P2
dlfunc $P2, $P1, 'is_linetouched', 'lpi'
set_global 'ncurses::is_linetouched', $P2
dlfunc $P2, $P1, 'is_wintouched', 'lp'
set_global 'ncurses::is_wintouched', $P2
dlfunc $P2, $P1, 'keyname', 'ti'
set_global 'ncurses::keyname', $P2
dlfunc $P2, $P1, 'keypad', 'ipl'
set_global 'ncurses::keypad', $P2
dlfunc $P2, $P1, 'killchar', 'c'
set_global 'ncurses::killchar', $P2
dlfunc $P2, $P1, 'leaveok', 'ipl'
set_global 'ncurses::leaveok', $P2
dlfunc $P2, $P1, 'longname', 't'
set_global 'ncurses::longname', $P2
dlfunc $P2, $P1, 'meta', 'ipl'
set_global 'ncurses::meta', $P2
dlfunc $P2, $P1, 'move', 'iii'
set_global 'ncurses::move', $P2
dlfunc $P2, $P1, 'mvaddch', 'iiil'
set_global 'ncurses::mvaddch', $P2
dlfunc $P2, $P1, 'mvaddchnstr', 'iii4i'
set_global 'ncurses::mvaddchnstr', $P2
dlfunc $P2, $P1, 'mvaddchstr', 'iii4'
set_global 'ncurses::mvaddchstr', $P2
dlfunc $P2, $P1, 'mvaddnstr', 'iiiti'
set_global 'ncurses::mvaddnstr', $P2
dlfunc $P2, $P1, 'mvaddstr', 'iiit'
set_global 'ncurses::mvaddstr', $P2
dlfunc $P2, $P1, 'mvchgat', 'iiiilsp'
set_global 'ncurses::mvchgat', $P2
#dlfunc $P2, $P1, 'mvcur', 'iiiii'
#set_global 'ncurses::mvcur', $P2
dlfunc $P2, $P1, 'mvdelch', 'iii'
set_global 'ncurses::mvdelch', $P2
dlfunc $P2, $P1, 'mvderwin', 'ipii'
set_global 'ncurses::mvderwin', $P2
dlfunc $P2, $P1, 'mvgetch', 'iii'
set_global 'ncurses::mvgetch', $P2
dlfunc $P2, $P1, 'mvgetnstr', 'iiiti'
set_global 'ncurses::mvgetnstr', $P2
dlfunc $P2, $P1, 'mvgetstr', 'iiit'
set_global 'ncurses::mvgetstr', $P2
dlfunc $P2, $P1, 'mvhline', 'iiili'
set_global 'ncurses::mvhline', $P2
dlfunc $P2, $P1, 'mvinch', 'lii'
set_global 'ncurses::mvinch', $P2
dlfunc $P2, $P1, 'mvinchnstr', 'iiiti'
set_global 'ncurses::mvinchnstr', $P2
dlfunc $P2, $P1, 'mvinchstr', 'iii4'
set_global 'ncurses::mvinchstr', $P2
dlfunc $P2, $P1, 'mvinnstr', 'iiiti'
set_global 'ncurses::mvinnstr', $P2
dlfunc $P2, $P1, 'mvinsch', 'iiil'
set_global 'ncurses::mvinsch', $P2
dlfunc $P2, $P1, 'mvinsnstr', 'iiiti'
set_global 'ncurses::mvinsnstr', $P2
dlfunc $P2, $P1, 'mvinsstr', 'iiit'
set_global 'ncurses::mvinsstr', $P2
dlfunc $P2, $P1, 'mvvline', 'iiili'
set_global 'ncurses::mvvline', $P2
dlfunc $P2, $P1, 'mvwaddch', 'ipiil'
set_global 'ncurses::mvwaddch', $P2
dlfunc $P2, $P1, 'mvwaddchnstr', 'ipii4i'
set_global 'ncurses::mvwaddchnstr', $P2
dlfunc $P2, $P1, 'mvwaddchstr', 'ipii4'
set_global 'ncurses::mvwaddchstr', $P2
dlfunc $P2, $P1, 'mvwaddnstr', 'ipiiti'
set_global 'ncurses::mvwaddnstr', $P2
dlfunc $P2, $P1, 'mvwaddstr', 'ipiit'
set_global 'ncurses::mvwaddstr', $P2
dlfunc $P2, $P1, 'mvwchgat', 'ipiiilsp'
set_global 'ncurses::mvwchgat', $P2
dlfunc $P2, $P1, 'mvwdelch', 'ipii'
set_global 'ncurses::mvwdelch', $P2
dlfunc $P2, $P1, 'mvwgetch', 'ipii'
set_global 'ncurses::mvwgetch', $P2
dlfunc $P2, $P1, 'mvwgetnstr', 'ipiiti'
set_global 'ncurses::mvwgetnstr', $P2
dlfunc $P2, $P1, 'mvwgetstr', 'ipiit'
set_global 'ncurses::mvwgetstr', $P2
dlfunc $P2, $P1, 'mvwhline', 'ipiili'
set_global 'ncurses::mvwhline', $P2
dlfunc $P2, $P1, 'mvwin', 'ipii'
set_global 'ncurses::mvwin', $P2
dlfunc $P2, $P1, 'mvwinch', 'lpii'
set_global 'ncurses::mvwinch', $P2
dlfunc $P2, $P1, 'mvwinchnstr', 'ipii4i'
set_global 'ncurses::mvwinchnstr', $P2
dlfunc $P2, $P1, 'mvwinchstr', 'ipii4'
set_global 'ncurses::mvwinchstr', $P2
dlfunc $P2, $P1, 'mvwinnstr', 'ipiiti'
set_global 'ncurses::mvwinnstr', $P2
dlfunc $P2, $P1, 'mvwinsch', 'ipiil'
set_global 'ncurses::mvwinsch', $P2
dlfunc $P2, $P1, 'mvwinsnstr', 'ipiiti'
set_global 'ncurses::mvwinsnstr', $P2
dlfunc $P2, $P1, 'mvwinsstr', 'ipiit'
set_global 'ncurses::mvwinsstr', $P2
dlfunc $P2, $P1, 'mvwinstr', 'ipiit'
set_global 'ncurses::mvwinstr', $P2
dlfunc $P2, $P1, 'mvwvline', 'ipiili'
set_global 'ncurses::mvwvline', $P2
dlfunc $P2, $P1, 'napms', 'ii'
set_global 'ncurses::napms', $P2
dlfunc $P2, $P1, 'newpad', 'pii'
set_global 'ncurses::newpad', $P2
dlfunc $P2, $P1, 'newterm', 'ptpp'
set_global 'ncurses::newterm', $P2
dlfunc $P2, $P1, 'newwin', 'piiii'
set_global 'ncurses::newwin', $P2
dlfunc $P2, $P1, 'nl', 'i'
set_global 'ncurses::nl', $P2
dlfunc $P2, $P1, 'nocbreak', 'i'
set_global 'ncurses::nocbreak', $P2
dlfunc $P2, $P1, 'nodelay', 'ipl'
set_global 'ncurses::nodelay', $P2
dlfunc $P2, $P1, 'noecho', 'i'
set_global 'ncurses::noecho', $P2
dlfunc $P2, $P1, 'nonl', 'i'
set_global 'ncurses::nonl', $P2
dlfunc $P2, $P1, 'noqiflush', 'v'
set_global 'ncurses::noqiflush', $P2
dlfunc $P2, $P1, 'noraw', 'i'
set_global 'ncurses::noraw', $P2
dlfunc $P2, $P1, 'notimeout', 'ipl'
set_global 'ncurses::notimeout', $P2
dlfunc $P2, $P1, 'overlay', 'ipp'
set_global 'ncurses::overlay', $P2
dlfunc $P2, $P1, 'overwrite', 'ipp'
set_global 'ncurses::overwrite', $P2
dlfunc $P2, $P1, 'pair_content', 'is22'
set_global 'ncurses::pair_content', $P2
dlfunc $P2, $P1, 'PAIR_NUMBER', 'ii'
set_global 'ncurses::PAIR_NUMBER', $P2
dlfunc $P2, $P1, 'pechochar', 'ipl'
set_global 'ncurses::pechochar', $P2
dlfunc $P2, $P1, 'pnoutrefresh', 'ipiiiiii'
set_global 'ncurses::pnoutrefresh', $P2
dlfunc $P2, $P1, 'prefresh', 'ipiiiiii'
set_global 'ncurses::prefresh', $P2
dlfunc $P2, $P1, 'putp', 'it'
set_global 'ncurses::putp', $P2
dlfunc $P2, $P1, 'putwin', 'ipp'
set_global 'ncurses::putwin', $P2
dlfunc $P2, $P1, 'qiflush', 'v'
set_global 'ncurses::qiflush', $P2
dlfunc $P2, $P1, 'raw', 'i'
set_global 'ncurses::raw', $P2
dlfunc $P2, $P1, 'redrawwin', 'ip'
set_global 'ncurses::redrawwin', $P2
dlfunc $P2, $P1, 'refresh', 'i'
set_global 'ncurses::refresh', $P2
dlfunc $P2, $P1, 'resetty', 'i'
set_global 'ncurses::resetty', $P2
dlfunc $P2, $P1, 'reset_prog_mode', 'i'
set_global 'ncurses::reset_prog_mode', $P2
dlfunc $P2, $P1, 'reset_shell_mode', 'i'
set_global 'ncurses::reset_shell_mode', $P2
dlfunc $P2, $P1, 'ripoffline', 'iiip'
set_global 'ncurses::ripoffline', $P2
dlfunc $P2, $P1, 'savetty', 'i'
set_global 'ncurses::savetty', $P2
dlfunc $P2, $P1, 'scr_dump', 'it'
set_global 'ncurses::scr_dump', $P2
dlfunc $P2, $P1, 'scr_init', 'it'
set_global 'ncurses::scr_init', $P2
dlfunc $P2, $P1, 'scrl', 'ii'
set_global 'ncurses::scrl', $P2
dlfunc $P2, $P1, 'scroll', 'ip'
set_global 'ncurses::scroll', $P2
dlfunc $P2, $P1, 'scrollok', 'ipl'
set_global 'ncurses::scrollok', $P2
dlfunc $P2, $P1, 'scr_restore', 'it'
set_global 'ncurses::scr_restore', $P2
dlfunc $P2, $P1, 'scr_set', 'it'
set_global 'ncurses::scr_set', $P2
dlfunc $P2, $P1, 'setscrreg', 'iii'
set_global 'ncurses::setscrreg', $P2
dlfunc $P2, $P1, 'set_term', 'pp'
set_global 'ncurses::set_term', $P2
dlfunc $P2, $P1, 'slk_attroff', 'il'
set_global 'ncurses::slk_attroff', $P2
dlfunc $P2, $P1, 'slk_attron', 'il'
set_global 'ncurses::slk_attron', $P2
dlfunc $P2, $P1, 'slk_attrset', 'il'
set_global 'ncurses::slk_attrset', $P2
dlfunc $P2, $P1, 'slk_attr', 'l'
set_global 'ncurses::slk_attr', $P2
dlfunc $P2, $P1, 'slk_attr_set', 'ilsp'
set_global 'ncurses::slk_attr_set', $P2
dlfunc $P2, $P1, 'slk_clear', 'i'
set_global 'ncurses::slk_clear', $P2
dlfunc $P2, $P1, 'slk_color', 'is'
set_global 'ncurses::slk_color', $P2
dlfunc $P2, $P1, 'slk_init', 'ii'
set_global 'ncurses::slk_init', $P2
dlfunc $P2, $P1, 'slk_label', 'ti'
set_global 'ncurses::slk_label', $P2
dlfunc $P2, $P1, 'slk_noutrefresh', 'i'
set_global 'ncurses::slk_noutrefresh', $P2
dlfunc $P2, $P1, 'slk_refresh', 'i'
set_global 'ncurses::slk_refresh', $P2
dlfunc $P2, $P1, 'slk_restore', 'i'
set_global 'ncurses::slk_restore', $P2
dlfunc $P2, $P1, 'slk_set', 'iiti'
set_global 'ncurses::slk_set', $P2
dlfunc $P2, $P1, 'slk_touch', 'i'
set_global 'ncurses::slk_touch', $P2
dlfunc $P2, $P1, 'standout', 'i'
set_global 'ncurses::standout', $P2
dlfunc $P2, $P1, 'standend', 'i'
set_global 'ncurses::standend', $P2
dlfunc $P2, $P1, 'start_color', 'i'
set_global 'ncurses::start_color', $P2
dlfunc $P2, $P1, 'subpad', 'ppiiii'
set_global 'ncurses::subpad', $P2
dlfunc $P2, $P1, 'subwin', 'ppiiii'
set_global 'ncurses::subwin', $P2
dlfunc $P2, $P1, 'syncok', 'ipl'
set_global 'ncurses::syncok', $P2
dlfunc $P2, $P1, 'termattrs', 'l'
set_global 'ncurses::termattrs', $P2
dlfunc $P2, $P1, 'termname', 't'
set_global 'ncurses::termname', $P2
dlfunc $P2, $P1, 'tigetflag', 'it'
set_global 'ncurses::tigetflag', $P2
dlfunc $P2, $P1, 'tigetnum', 'it'
set_global 'ncurses::tigetnum', $P2
dlfunc $P2, $P1, 'tigetstr', 'tt'
set_global 'ncurses::tigetstr', $P2
dlfunc $P2, $P1, 'timeout', 'vi'
set_global 'ncurses::timeout', $P2
dlfunc $P2, $P1, 'typeahead', 'ii'
set_global 'ncurses::typeahead', $P2
dlfunc $P2, $P1, 'ungetch', 'ii'
set_global 'ncurses::ungetch', $P2
dlfunc $P2, $P1, 'untouchwin', 'ip'
set_global 'ncurses::untouchwin', $P2
dlfunc $P2, $P1, 'use_env', 'vl'
set_global 'ncurses::use_env', $P2
dlfunc $P2, $P1, 'vidattr', 'il'
set_global 'ncurses::vidattr', $P2
dlfunc $P2, $P1, 'vidputs', 'ilp'
set_global 'ncurses::vidputs', $P2
dlfunc $P2, $P1, 'vline', 'ili'
set_global 'ncurses::vline', $P2
dlfunc $P2, $P1, 'waddch', 'ipl'
set_global 'ncurses::waddch', $P2
dlfunc $P2, $P1, 'waddchnstr', 'ip4i'
set_global 'ncurses::waddchnstr', $P2
dlfunc $P2, $P1, 'waddchstr', 'ip4'
set_global 'ncurses::waddchstr', $P2
dlfunc $P2, $P1, 'waddnstr', 'ipti'
set_global 'ncurses::waddnstr', $P2
dlfunc $P2, $P1, 'waddstr', 'ipt'
set_global 'ncurses::waddstr', $P2
dlfunc $P2, $P1, 'wattron', 'ipi'
set_global 'ncurses::wattron', $P2
dlfunc $P2, $P1, 'wattroff', 'ipi'
set_global 'ncurses::wattroff', $P2
dlfunc $P2, $P1, 'wattrset', 'ipi'
set_global 'ncurses::wattrset', $P2
dlfunc $P2, $P1, 'wattr_get', 'ip42p'
set_global 'ncurses::wattr_get', $P2
dlfunc $P2, $P1, 'wattr_on', 'iplp'
set_global 'ncurses::wattr_on', $P2
dlfunc $P2, $P1, 'wattr_off', 'iplp'
set_global 'ncurses::wattr_off', $P2
dlfunc $P2, $P1, 'wattr_set', 'iplsp'
set_global 'ncurses::wattr_set', $P2
dlfunc $P2, $P1, 'wbkgd', 'ipl'
set_global 'ncurses::wbkgd', $P2
dlfunc $P2, $P1, 'wbkgdset', 'vpl'
set_global 'ncurses::wbkgdset', $P2
dlfunc $P2, $P1, 'wborder', 'ipllllllll'
set_global 'ncurses::wborder', $P2
dlfunc $P2, $P1, 'wchgat', 'ipilsp'
set_global 'ncurses::wchgat', $P2
dlfunc $P2, $P1, 'wclear', 'ip'
set_global 'ncurses::wclear', $P2
dlfunc $P2, $P1, 'wclrtobot', 'ip'
set_global 'ncurses::wclrtobot', $P2
dlfunc $P2, $P1, 'wclrtoeol', 'ip'
set_global 'ncurses::wclrtoeol', $P2
dlfunc $P2, $P1, 'wcolor_set', 'ipsp'
set_global 'ncurses::wcolor_set', $P2
dlfunc $P2, $P1, 'wcursyncup', 'vp'
set_global 'ncurses::wcursyncup', $P2
dlfunc $P2, $P1, 'wdelch', 'ip'
set_global 'ncurses::wdelch', $P2
dlfunc $P2, $P1, 'wdeleteln', 'ip'
set_global 'ncurses::wdeleteln', $P2
dlfunc $P2, $P1, 'wechochar', 'ipl'
set_global 'ncurses::wechochar', $P2
dlfunc $P2, $P1, 'werase', 'ip'
set_global 'ncurses::werase', $P2
dlfunc $P2, $P1, 'wgetch', 'ip'
set_global 'ncurses::wgetch', $P2
dlfunc $P2, $P1, 'wgetnstr', 'ipti'
set_global 'ncurses::wgetnstr', $P2
dlfunc $P2, $P1, 'wgetstr', 'ipt'
set_global 'ncurses::wgetstr', $P2
dlfunc $P2, $P1, 'whline', 'ipli'
set_global 'ncurses::whline', $P2
dlfunc $P2, $P1, 'winch', 'lp'
set_global 'ncurses::winch', $P2
dlfunc $P2, $P1, 'winchnstr', 'ip4i'
set_global 'ncurses::winchnstr', $P2
dlfunc $P2, $P1, 'winnstr', 'ipti'
set_global 'ncurses::winnstr', $P2
dlfunc $P2, $P1, 'winsch', 'ipl'
set_global 'ncurses::winsch', $P2
dlfunc $P2, $P1, 'winsdelln', 'ipi'
set_global 'ncurses::winsdelln', $P2
dlfunc $P2, $P1, 'winsertln', 'ip'
set_global 'ncurses::winsertln', $P2
dlfunc $P2, $P1, 'winsnstr', 'ipti'
set_global 'ncurses::winsnstr', $P2
dlfunc $P2, $P1, 'winsstr', 'ipt'
set_global 'ncurses::winsstr', $P2
dlfunc $P2, $P1, 'winstr', 'ipt'
set_global 'ncurses::winstr', $P2
dlfunc $P2, $P1, 'wmove', 'ipii'
set_global 'ncurses::wmove', $P2
dlfunc $P2, $P1, 'wnoutrefresh', 'ip'
set_global 'ncurses::wnoutrefresh', $P2
dlfunc $P2, $P1, 'wredrawln', 'ipii'
set_global 'ncurses::wredrawln', $P2
dlfunc $P2, $P1, 'wrefresh', 'ip'
set_global 'ncurses::wrefresh', $P2
dlfunc $P2, $P1, 'wscrl', 'ipi'
set_global 'ncurses::wscrl', $P2
dlfunc $P2, $P1, 'wsetscrreg', 'ipii'
set_global 'ncurses::wsetscrreg', $P2
dlfunc $P2, $P1, 'wstandout', 'ip'
set_global 'ncurses::wstandout', $P2
dlfunc $P2, $P1, 'wstandend', 'ip'
set_global 'ncurses::wstandend', $P2
dlfunc $P2, $P1, 'wsyncdown', 'vp'
set_global 'ncurses::wsyncdown', $P2
dlfunc $P2, $P1, 'wsyncup', 'vp'
set_global 'ncurses::wsyncup', $P2
dlfunc $P2, $P1, 'wtimeout', 'vpi'
set_global 'ncurses::wtimeout', $P2
dlfunc $P2, $P1, 'wtouchln', 'ipiii'
set_global 'ncurses::wtouchln', $P2
dlfunc $P2, $P1, 'wvline', 'ipli'
set_global 'ncurses::wvline', $P2
dlfunc $P2, $P1, 'getmouse', 'ip'
set_global 'ncurses::getmouse', $P2
dlfunc $P2, $P1, 'ungetmouse', 'ip'
set_global 'ncurses::ungetmouse', $P2
dlfunc $P2, $P1, 'mousemask', 'll4'
set_global 'ncurses::mousemask', $P2
dlfunc $P2, $P1, 'wenclose', 'lpii'
set_global 'ncurses::wenclose', $P2
dlfunc $P2, $P1, 'mouseinterval', 'ii'
set_global 'ncurses::mouseinterval', $P2
dlfunc $P2, $P1, 'wmouse_trafo', 'lp33l'
set_global 'ncurses::wmouse_trafo', $P2
dlfunc $P2, $P1, 'mouse_trafo', 'l33l'
set_global 'ncurses::mouse_trafo', $P2
dlfunc $P2, $P1, 'mcprint', 'iti'
set_global 'ncurses::mcprint', $P2
dlfunc $P2, $P1, 'has_key', 'ii'
set_global 'ncurses::has_key', $P2

.begin_return
.end_return
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

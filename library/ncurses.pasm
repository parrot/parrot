.pcc_sub @LOAD __ncurses_init:
saveall
loadlib P1, 'libform'
dlfunc P2, P1, 'new_field', 'piiiiii'
store_global 'ncurses::new_field', P2
dlfunc P2, P1, 'dup_field', 'ppii'
store_global 'ncurses::dup_field', P2
dlfunc P2, P1, 'link_field', 'ppii'
store_global 'ncurses::link_field', P2
dlfunc P2, P1, 'free_field', 'ip'
store_global 'ncurses::free_field', P2
dlfunc P2, P1, 'field_info', 'ip333333'
store_global 'ncurses::field_info', P2
dlfunc P2, P1, 'dynamic_field_info', 'ip333'
store_global 'ncurses::dynamic_field_info', P2
dlfunc P2, P1, 'set_max_field', 'ipi'
store_global 'ncurses::set_max_field', P2
dlfunc P2, P1, 'move_field', 'ipii'
store_global 'ncurses::move_field', P2
dlfunc P2, P1, 'set_new_page', 'ipl'
store_global 'ncurses::set_new_page', P2
dlfunc P2, P1, 'set_field_just', 'ipi'
store_global 'ncurses::set_field_just', P2
dlfunc P2, P1, 'field_just', 'ip'
store_global 'ncurses::field_just', P2
dlfunc P2, P1, 'set_field_fore', 'ipl'
store_global 'ncurses::set_field_fore', P2
dlfunc P2, P1, 'set_field_back', 'ipl'
store_global 'ncurses::set_field_back', P2
dlfunc P2, P1, 'set_field_pad', 'ipi'
store_global 'ncurses::set_field_pad', P2
dlfunc P2, P1, 'field_pad', 'ip'
store_global 'ncurses::field_pad', P2
dlfunc P2, P1, 'set_field_buffer', 'ipit'
store_global 'ncurses::set_field_buffer', P2
dlfunc P2, P1, 'set_field_status', 'ipl'
store_global 'ncurses::set_field_status', P2
dlfunc P2, P1, 'set_field_userptr', 'ipp'
store_global 'ncurses::set_field_userptr', P2
dlfunc P2, P1, 'set_field_opts', 'ipi'
store_global 'ncurses::set_field_opts', P2
dlfunc P2, P1, 'field_opts_on', 'ipi'
store_global 'ncurses::field_opts_on', P2
dlfunc P2, P1, 'field_opts_off', 'ipi'
store_global 'ncurses::field_opts_off', P2
dlfunc P2, P1, 'field_fore', 'lp'
store_global 'ncurses::field_fore', P2
dlfunc P2, P1, 'field_back', 'ip'
store_global 'ncurses::field_back', P2
dlfunc P2, P1, 'new_page', 'lp'
store_global 'ncurses::new_page', P2
dlfunc P2, P1, 'field_status', 'lp'
store_global 'ncurses::field_status', P2
dlfunc P2, P1, 'field_arg', 'pp'
store_global 'ncurses::field_arg', P2
dlfunc P2, P1, 'field_userptr', 'pp'
store_global 'ncurses::field_userptr', P2
dlfunc P2, P1, 'field_type', 'pp'
store_global 'ncurses::field_type', P2
dlfunc P2, P1, 'field_buffer', 'tpi'
store_global 'ncurses::field_buffer', P2
dlfunc P2, P1, 'field_opts', 'lp'
store_global 'ncurses::field_opts', P2
dlfunc P2, P1, 'new_form', 'pb'
store_global 'ncurses::new_form', P2
dlfunc P2, P1, 'current_field', 'pp'
store_global 'ncurses::current_field', P2
dlfunc P2, P1, 'form_win', 'pp'
store_global 'ncurses::form_win', P2
dlfunc P2, P1, 'form_sub', 'pp'
store_global 'ncurses::form_sub', P2
dlfunc P2, P1, 'free_form', 'ip'
store_global 'ncurses::free_form', P2
dlfunc P2, P1, 'set_form_fields', 'ipb'
store_global 'ncurses::set_form_fields', P2
dlfunc P2, P1, 'field_count', 'ip'
store_global 'ncurses::field_count', P2
dlfunc P2, P1, 'set_form_win', 'ipp'
store_global 'ncurses::set_form_win', P2
dlfunc P2, P1, 'set_form_sub', 'ipp'
store_global 'ncurses::set_form_sub', P2
dlfunc P2, P1, 'set_current_field', 'ipp'
store_global 'ncurses::set_current_field', P2
dlfunc P2, P1, 'field_index', 'ip'
store_global 'ncurses::field_index', P2
dlfunc P2, P1, 'set_form_page', 'ipi'
store_global 'ncurses::set_form_page', P2
dlfunc P2, P1, 'form_page', 'ip'
store_global 'ncurses::form_page', P2
dlfunc P2, P1, 'scale_form', 'ip33'
store_global 'ncurses::scale_form', P2
dlfunc P2, P1, 'post_form', 'ip'
store_global 'ncurses::post_form', P2
dlfunc P2, P1, 'unpost_form', 'ip'
store_global 'ncurses::unpost_form', P2
dlfunc P2, P1, 'pos_form_cursor', 'ip'
store_global 'ncurses::pos_form_cursor', P2
dlfunc P2, P1, 'form_driver', 'ipi'
store_global 'ncurses::form_driver', P2
dlfunc P2, P1, 'set_form_userptr', 'ipp'
store_global 'ncurses::set_form_userptr', P2
dlfunc P2, P1, 'set_form_opts', 'ipi'
store_global 'ncurses::set_form_opts', P2
dlfunc P2, P1, 'form_opts_on', 'ipi'
store_global 'ncurses::form_opts_on', P2
dlfunc P2, P1, 'form_opts_off', 'ipi'
store_global 'ncurses::form_opts_off', P2
dlfunc P2, P1, 'form_request_by_name', 'it'
store_global 'ncurses::form_request_by_name', P2
dlfunc P2, P1, 'form_request_name', 'ti'
store_global 'ncurses::form_request_name', P2
dlfunc P2, P1, 'form_userptr', 'pp'
store_global 'ncurses::form_userptr', P2
dlfunc P2, P1, 'form_opts', 'ip'
store_global 'ncurses::form_opts', P2
dlfunc P2, P1, 'data_ahead', 'lp'
store_global 'ncurses::data_ahead', P2
dlfunc P2, P1, 'data_behind', 'lp'
store_global 'ncurses::data_behind', P2

loadlib P1, 'libncurses'

dlfunc P2, P1, 'keybound', 'tii'
store_global 'ncurses::keybound', P2

dlfunc P2, P1, 'curses_version', 't'
store_global 'ncurses::curses_version', P2
dlfunc P2, P1, 'assume_default_colors', 'iii'
store_global 'ncurses::assume_default_colors', P2
dlfunc P2, P1, 'define_key', 'iti'
store_global 'ncurses::define_key', P2
dlfunc P2, P1, 'keyok', 'iii'
store_global 'ncurses::keyok', P2
dlfunc P2, P1, 'resizeterm', 'iii'
store_global 'ncurses::resizeterm', P2
dlfunc P2, P1, 'use_default_colors', 'i'
store_global 'ncurses::use_default_colors', P2
dlfunc P2, P1, 'use_extended_names', 'ii'
store_global 'ncurses::use_extended_names', P2
dlfunc P2, P1, 'wresize', 'ipii'
store_global 'ncurses::wresize', P2
dlfunc P2, P1, 'addch', 'il'
store_global 'ncurses::addch', P2
dlfunc P2, P1, 'addchnstr', 'i4i'
store_global 'ncurses::addchnstr', P2
dlfunc P2, P1, 'addchstr', 'i4'
store_global 'ncurses::addchstr', P2
dlfunc P2, P1, 'addnstr', 'iti'
store_global 'ncurses::addnstr', P2
dlfunc P2, P1, 'addstr', 'it'
store_global 'ncurses::addstr', P2
dlfunc P2, P1, 'attroff', 'il'
store_global 'ncurses::attroff', P2
dlfunc P2, P1, 'attron', 'il'
store_global 'ncurses::attron', P2
dlfunc P2, P1, 'attrset', 'il'
store_global 'ncurses::attrset', P2
dlfunc P2, P1, 'attr_get', 'i42p'
store_global 'ncurses::attr_get', P2
dlfunc P2, P1, 'attr_off', 'ilp'
store_global 'ncurses::attr_off', P2
dlfunc P2, P1, 'attr_on', 'ilp'
store_global 'ncurses::attr_on', P2
dlfunc P2, P1, 'attr_set', 'ilsp'
store_global 'ncurses::attr_set', P2
dlfunc P2, P1, 'baudrate', 'i'
store_global 'ncurses::baudrate', P2
dlfunc P2, P1, 'beep', 'i'
store_global 'ncurses::beep', P2
dlfunc P2, P1, 'bkgd', 'il'
store_global 'ncurses::bkgd', P2
dlfunc P2, P1, 'bkgdset', 'vl'
store_global 'ncurses::bkgdset', P2
dlfunc P2, P1, 'border', 'villllllll'
store_global 'ncurses::border', P2
dlfunc P2, P1, 'box', 'ipll'
store_global 'ncurses::box', P2
dlfunc P2, P1, 'can_change_color', 'l'
store_global 'ncurses::can_change_color', P2
dlfunc P2, P1, 'cbreak', 'i'
store_global 'ncurses::cbreak', P2
dlfunc P2, P1, 'chgat', 'iilsp'
store_global 'ncurses::chgat', P2
dlfunc P2, P1, 'clear', 'i'
store_global 'ncurses::clear', P2
dlfunc P2, P1, 'clearok', 'ipl'
store_global 'ncurses::clearok', P2
dlfunc P2, P1, 'clrtobot', 'i'
store_global 'ncurses::clrtobot', P2
dlfunc P2, P1, 'clrtoeol', 'i'
store_global 'ncurses::clrtoeol', P2
dlfunc P2, P1, 'color_content', 'is222'
store_global 'ncurses::color_content', P2
dlfunc P2, P1, 'color_set', 'isp'
store_global 'ncurses::color_set', P2
dlfunc P2, P1, 'COLOR_PAIR', 'ii'
store_global 'ncurses::COLOR_PAIR', P2
dlfunc P2, P1, 'copywin', 'ippiiiiiiii'
store_global 'ncurses::copywin', P2
dlfunc P2, P1, 'curs_set', 'ii'
store_global 'ncurses::curs_set', P2
dlfunc P2, P1, 'def_prog_mode', 'i'
store_global 'ncurses::def_prog_mode', P2
dlfunc P2, P1, 'def_shell_mode', 'i'
store_global 'ncurses::def_shell_mode', P2
dlfunc P2, P1, 'delay_output', 'ii'
store_global 'ncurses::delay_output', P2
dlfunc P2, P1, 'delch', 'i'
store_global 'ncurses::delch', P2
dlfunc P2, P1, 'delscreen', 'vp'
store_global 'ncurses::delscreen', P2
dlfunc P2, P1, 'delwin', 'ip'
store_global 'ncurses::delwin', P2
dlfunc P2, P1, 'deleteln', 'i'
store_global 'ncurses::deleteln', P2
dlfunc P2, P1, 'derwin', 'ppiiii'
store_global 'ncurses::derwin', P2
dlfunc P2, P1, 'doupdate', 'i'
store_global 'ncurses::doupdate', P2
dlfunc P2, P1, 'dupwin', 'pp'
store_global 'ncurses::dupwin', P2
dlfunc P2, P1, 'echo', 'i'
store_global 'ncurses::echo', P2
dlfunc P2, P1, 'echochar', 'il'
store_global 'ncurses::echochar', P2
dlfunc P2, P1, 'erase', 'i'
store_global 'ncurses::erase', P2
dlfunc P2, P1, 'endwin', 'i'
store_global 'ncurses::endwin', P2
dlfunc P2, P1, 'erasechar', 'c'
store_global 'ncurses::erasechar', P2
dlfunc P2, P1, 'filter', 'v'
store_global 'ncurses::filter', P2
dlfunc P2, P1, 'flash', 'i'
store_global 'ncurses::flash', P2
dlfunc P2, P1, 'flushinp', 'i'
store_global 'ncurses::flushinp', P2
dlfunc P2, P1, 'getbkgd', 'lp'
store_global 'ncurses::getbkgd', P2
dlfunc P2, P1, 'getch', 'i'
store_global 'ncurses::getch', P2
dlfunc P2, P1, 'getnstr', 'iti'
store_global 'ncurses::getnstr', P2
dlfunc P2, P1, 'getstr', 'it'
store_global 'ncurses::getstr', P2
dlfunc P2, P1, 'getwin', 'pp'
store_global 'ncurses::getwin', P2
dlfunc P2, P1, 'halfdelay', 'ii'
store_global 'ncurses::halfdelay', P2
dlfunc P2, P1, 'has_colors', 'i'
store_global 'ncurses::has_colors', P2
dlfunc P2, P1, 'has_ic', 'i'
store_global 'ncurses::has_ic', P2
dlfunc P2, P1, 'has_il', 'i'
store_global 'ncurses::has_il', P2
dlfunc P2, P1, 'hline', 'ili'
store_global 'ncurses::hline', P2
dlfunc P2, P1, 'idcok', 'vpl'
store_global 'ncurses::idcok', P2
dlfunc P2, P1, 'idlok', 'ipl'
store_global 'ncurses::idlok', P2
dlfunc P2, P1, 'immedok', 'vpl'
store_global 'ncurses::immedok', P2
dlfunc P2, P1, 'inch', 'l'
store_global 'ncurses::inch', P2
dlfunc P2, P1, 'inchnstr', 'i4i'
store_global 'ncurses::inchnstr', P2
dlfunc P2, P1, 'inchstr', 'i4'
store_global 'ncurses::inchstr', P2
dlfunc P2, P1, 'initscr', 'p'
store_global 'ncurses::initscr', P2
dlfunc P2, P1, 'init_color', 'issss'
store_global 'ncurses::init_color', P2
dlfunc P2, P1, 'init_pair', 'isss'
store_global 'ncurses::init_pair', P2
dlfunc P2, P1, 'innstr', 'iti'
store_global 'ncurses::innstr', P2
dlfunc P2, P1, 'insstr', 'it'
store_global 'ncurses::insstr', P2
dlfunc P2, P1, 'instr', 'it'
store_global 'ncurses::instr', P2
dlfunc P2, P1, 'intrflush', 'ipl'
store_global 'ncurses::intrflush', P2
dlfunc P2, P1, 'isendwin', 'l'
store_global 'ncurses::isendwin', P2
dlfunc P2, P1, 'is_linetouched', 'lpi'
store_global 'ncurses::is_linetouched', P2
dlfunc P2, P1, 'is_wintouched', 'lp'
store_global 'ncurses::is_wintouched', P2
dlfunc P2, P1, 'keyname', 'ti'
store_global 'ncurses::keyname', P2
dlfunc P2, P1, 'keypad', 'ipl'
store_global 'ncurses::keypad', P2
dlfunc P2, P1, 'killchar', 'c'
store_global 'ncurses::killchar', P2
dlfunc P2, P1, 'leaveok', 'ipl'
store_global 'ncurses::leaveok', P2
dlfunc P2, P1, 'longname', 't'
store_global 'ncurses::longname', P2
dlfunc P2, P1, 'meta', 'ipl'
store_global 'ncurses::meta', P2
dlfunc P2, P1, 'move', 'iii'
store_global 'ncurses::move', P2
dlfunc P2, P1, 'mvaddch', 'iiil'
store_global 'ncurses::mvaddch', P2
dlfunc P2, P1, 'mvaddchnstr', 'iii4i'
store_global 'ncurses::mvaddchnstr', P2
dlfunc P2, P1, 'mvaddchstr', 'iii4'
store_global 'ncurses::mvaddchstr', P2
dlfunc P2, P1, 'mvaddnstr', 'iiiti'
store_global 'ncurses::mvaddnstr', P2
dlfunc P2, P1, 'mvaddstr', 'iiit'
store_global 'ncurses::mvaddstr', P2
dlfunc P2, P1, 'mvchgat', 'iiiilsp'
store_global 'ncurses::mvchgat', P2
dlfunc P2, P1, 'mvcur', 'iiiii'
store_global 'ncurses::mvcur', P2
dlfunc P2, P1, 'mvdelch', 'iii'
store_global 'ncurses::mvdelch', P2
dlfunc P2, P1, 'mvderwin', 'ipii'
store_global 'ncurses::mvderwin', P2
dlfunc P2, P1, 'mvgetch', 'iii'
store_global 'ncurses::mvgetch', P2
dlfunc P2, P1, 'mvgetnstr', 'iiiti'
store_global 'ncurses::mvgetnstr', P2
dlfunc P2, P1, 'mvgetstr', 'iiit'
store_global 'ncurses::mvgetstr', P2
dlfunc P2, P1, 'mvhline', 'iiili'
store_global 'ncurses::mvhline', P2
dlfunc P2, P1, 'mvinch', 'lii'
store_global 'ncurses::mvinch', P2
dlfunc P2, P1, 'mvinchnstr', 'iiiti'
store_global 'ncurses::mvinchnstr', P2
dlfunc P2, P1, 'mvinchstr', 'iii4'
store_global 'ncurses::mvinchstr', P2
dlfunc P2, P1, 'mvinnstr', 'iiiti'
store_global 'ncurses::mvinnstr', P2
dlfunc P2, P1, 'mvinsch', 'iiil'
store_global 'ncurses::mvinsch', P2
dlfunc P2, P1, 'mvinsnstr', 'iiiti'
store_global 'ncurses::mvinsnstr', P2
dlfunc P2, P1, 'mvinsstr', 'iiit'
store_global 'ncurses::mvinsstr', P2
dlfunc P2, P1, 'mvvline', 'iiili'
store_global 'ncurses::mvvline', P2
dlfunc P2, P1, 'mvwaddch', 'ipiil'
store_global 'ncurses::mvwaddch', P2
dlfunc P2, P1, 'mvwaddchnstr', 'ipii4i'
store_global 'ncurses::mvwaddchnstr', P2
dlfunc P2, P1, 'mvwaddchstr', 'ipii4'
store_global 'ncurses::mvwaddchstr', P2
dlfunc P2, P1, 'mvwaddnstr', 'ipiiti'
store_global 'ncurses::mvwaddnstr', P2
dlfunc P2, P1, 'mvwaddstr', 'ipiit'
store_global 'ncurses::mvwaddstr', P2
dlfunc P2, P1, 'mvwchgat', 'ipiiilsp'
store_global 'ncurses::mvwchgat', P2
dlfunc P2, P1, 'mvwdelch', 'ipii'
store_global 'ncurses::mvwdelch', P2
dlfunc P2, P1, 'mvwgetch', 'ipii'
store_global 'ncurses::mvwgetch', P2
dlfunc P2, P1, 'mvwgetnstr', 'ipiiti'
store_global 'ncurses::mvwgetnstr', P2
dlfunc P2, P1, 'mvwgetstr', 'ipiit'
store_global 'ncurses::mvwgetstr', P2
dlfunc P2, P1, 'mvwhline', 'ipiili'
store_global 'ncurses::mvwhline', P2
dlfunc P2, P1, 'mvwin', 'ipii'
store_global 'ncurses::mvwin', P2
dlfunc P2, P1, 'mvwinch', 'lpii'
store_global 'ncurses::mvwinch', P2
dlfunc P2, P1, 'mvwinchnstr', 'ipii4i'
store_global 'ncurses::mvwinchnstr', P2
dlfunc P2, P1, 'mvwinchstr', 'ipii4'
store_global 'ncurses::mvwinchstr', P2
dlfunc P2, P1, 'mvwinnstr', 'ipiiti'
store_global 'ncurses::mvwinnstr', P2
dlfunc P2, P1, 'mvwinsch', 'ipiil'
store_global 'ncurses::mvwinsch', P2
dlfunc P2, P1, 'mvwinsnstr', 'ipiiti'
store_global 'ncurses::mvwinsnstr', P2
dlfunc P2, P1, 'mvwinsstr', 'ipiit'
store_global 'ncurses::mvwinsstr', P2
dlfunc P2, P1, 'mvwinstr', 'ipiit'
store_global 'ncurses::mvwinstr', P2
dlfunc P2, P1, 'mvwvline', 'ipiili'
store_global 'ncurses::mvwvline', P2
dlfunc P2, P1, 'napms', 'ii'
store_global 'ncurses::napms', P2
dlfunc P2, P1, 'newpad', 'pii'
store_global 'ncurses::newpad', P2
dlfunc P2, P1, 'newterm', 'ptpp'
store_global 'ncurses::newterm', P2
dlfunc P2, P1, 'newwin', 'piiii'
store_global 'ncurses::newwin', P2
dlfunc P2, P1, 'nl', 'i'
store_global 'ncurses::nl', P2
dlfunc P2, P1, 'nocbreak', 'i'
store_global 'ncurses::nocbreak', P2
dlfunc P2, P1, 'nodelay', 'ipl'
store_global 'ncurses::nodelay', P2
dlfunc P2, P1, 'noecho', 'i'
store_global 'ncurses::noecho', P2
dlfunc P2, P1, 'nonl', 'i'
store_global 'ncurses::nonl', P2
dlfunc P2, P1, 'noqiflush', 'v'
store_global 'ncurses::noqiflush', P2
dlfunc P2, P1, 'noraw', 'i'
store_global 'ncurses::noraw', P2
dlfunc P2, P1, 'notimeout', 'ipl'
store_global 'ncurses::notimeout', P2
dlfunc P2, P1, 'overlay', 'ipp'
store_global 'ncurses::overlay', P2
dlfunc P2, P1, 'overwrite', 'ipp'
store_global 'ncurses::overwrite', P2
dlfunc P2, P1, 'pair_content', 'is22'
store_global 'ncurses::pair_content', P2
dlfunc P2, P1, 'PAIR_NUMBER', 'ii'
store_global 'ncurses::PAIR_NUMBER', P2
dlfunc P2, P1, 'pechochar', 'ipl'
store_global 'ncurses::pechochar', P2
dlfunc P2, P1, 'pnoutrefresh', 'ipiiiiii'
store_global 'ncurses::pnoutrefresh', P2
dlfunc P2, P1, 'prefresh', 'ipiiiiii'
store_global 'ncurses::prefresh', P2
dlfunc P2, P1, 'putp', 'it'
store_global 'ncurses::putp', P2
dlfunc P2, P1, 'putwin', 'ipp'
store_global 'ncurses::putwin', P2
dlfunc P2, P1, 'qiflush', 'v'
store_global 'ncurses::qiflush', P2
dlfunc P2, P1, 'raw', 'i'
store_global 'ncurses::raw', P2
dlfunc P2, P1, 'redrawwin', 'ip'
store_global 'ncurses::redrawwin', P2
dlfunc P2, P1, 'refresh', 'i'
store_global 'ncurses::refresh', P2
dlfunc P2, P1, 'resetty', 'i'
store_global 'ncurses::resetty', P2
dlfunc P2, P1, 'reset_prog_mode', 'i'
store_global 'ncurses::reset_prog_mode', P2
dlfunc P2, P1, 'reset_shell_mode', 'i'
store_global 'ncurses::reset_shell_mode', P2
dlfunc P2, P1, 'ripoffline', 'iiip'
store_global 'ncurses::ripoffline', P2
dlfunc P2, P1, 'savetty', 'i'
store_global 'ncurses::savetty', P2
dlfunc P2, P1, 'scr_dump', 'it'
store_global 'ncurses::scr_dump', P2
dlfunc P2, P1, 'scr_init', 'it'
store_global 'ncurses::scr_init', P2
dlfunc P2, P1, 'scrl', 'ii'
store_global 'ncurses::scrl', P2
dlfunc P2, P1, 'scroll', 'ip'
store_global 'ncurses::scroll', P2
dlfunc P2, P1, 'scrollok', 'ipl'
store_global 'ncurses::scrollok', P2
dlfunc P2, P1, 'scr_restore', 'it'
store_global 'ncurses::scr_restore', P2
dlfunc P2, P1, 'scr_set', 'it'
store_global 'ncurses::scr_set', P2
dlfunc P2, P1, 'setscrreg', 'iii'
store_global 'ncurses::setscrreg', P2
dlfunc P2, P1, 'set_term', 'pp'
store_global 'ncurses::set_term', P2
dlfunc P2, P1, 'slk_attroff', 'il'
store_global 'ncurses::slk_attroff', P2
dlfunc P2, P1, 'slk_attron', 'il'
store_global 'ncurses::slk_attron', P2
dlfunc P2, P1, 'slk_attrset', 'il'
store_global 'ncurses::slk_attrset', P2
dlfunc P2, P1, 'slk_attr', 'l'
store_global 'ncurses::slk_attr', P2
dlfunc P2, P1, 'slk_attr_set', 'ilsp'
store_global 'ncurses::slk_attr_set', P2
dlfunc P2, P1, 'slk_clear', 'i'
store_global 'ncurses::slk_clear', P2
dlfunc P2, P1, 'slk_color', 'is'
store_global 'ncurses::slk_color', P2
dlfunc P2, P1, 'slk_init', 'ii'
store_global 'ncurses::slk_init', P2
dlfunc P2, P1, 'slk_label', 'ti'
store_global 'ncurses::slk_label', P2
dlfunc P2, P1, 'slk_noutrefresh', 'i'
store_global 'ncurses::slk_noutrefresh', P2
dlfunc P2, P1, 'slk_refresh', 'i'
store_global 'ncurses::slk_refresh', P2
dlfunc P2, P1, 'slk_restore', 'i'
store_global 'ncurses::slk_restore', P2
dlfunc P2, P1, 'slk_set', 'iiti'
store_global 'ncurses::slk_set', P2
dlfunc P2, P1, 'slk_touch', 'i'
store_global 'ncurses::slk_touch', P2
dlfunc P2, P1, 'standout', 'i'
store_global 'ncurses::standout', P2
dlfunc P2, P1, 'standend', 'i'
store_global 'ncurses::standend', P2
dlfunc P2, P1, 'start_color', 'i'
store_global 'ncurses::start_color', P2
dlfunc P2, P1, 'subpad', 'ppiiii'
store_global 'ncurses::subpad', P2
dlfunc P2, P1, 'subwin', 'ppiiii'
store_global 'ncurses::subwin', P2
dlfunc P2, P1, 'syncok', 'ipl'
store_global 'ncurses::syncok', P2
dlfunc P2, P1, 'termattrs', 'l'
store_global 'ncurses::termattrs', P2
dlfunc P2, P1, 'termname', 't'
store_global 'ncurses::termname', P2
dlfunc P2, P1, 'tigetflag', 'it'
store_global 'ncurses::tigetflag', P2
dlfunc P2, P1, 'tigetnum', 'it'
store_global 'ncurses::tigetnum', P2
dlfunc P2, P1, 'tigetstr', 'tt'
store_global 'ncurses::tigetstr', P2
dlfunc P2, P1, 'timeout', 'vi'
store_global 'ncurses::timeout', P2
dlfunc P2, P1, 'typeahead', 'ii'
store_global 'ncurses::typeahead', P2
dlfunc P2, P1, 'ungetch', 'ii'
store_global 'ncurses::ungetch', P2
dlfunc P2, P1, 'untouchwin', 'ip'
store_global 'ncurses::untouchwin', P2
dlfunc P2, P1, 'use_env', 'vl'
store_global 'ncurses::use_env', P2
dlfunc P2, P1, 'vidattr', 'il'
store_global 'ncurses::vidattr', P2
dlfunc P2, P1, 'vidputs', 'ilp'
store_global 'ncurses::vidputs', P2
dlfunc P2, P1, 'vline', 'ili'
store_global 'ncurses::vline', P2
dlfunc P2, P1, 'waddch', 'ipl'
store_global 'ncurses::waddch', P2
dlfunc P2, P1, 'waddchnstr', 'ip4i'
store_global 'ncurses::waddchnstr', P2
dlfunc P2, P1, 'waddchstr', 'ip4'
store_global 'ncurses::waddchstr', P2
dlfunc P2, P1, 'waddnstr', 'ipti'
store_global 'ncurses::waddnstr', P2
dlfunc P2, P1, 'waddstr', 'ipt'
store_global 'ncurses::waddstr', P2
dlfunc P2, P1, 'wattron', 'ipi'
store_global 'ncurses::wattron', P2
dlfunc P2, P1, 'wattroff', 'ipi'
store_global 'ncurses::wattroff', P2
dlfunc P2, P1, 'wattrset', 'ipi'
store_global 'ncurses::wattrset', P2
dlfunc P2, P1, 'wattr_get', 'ip42p'
store_global 'ncurses::wattr_get', P2
dlfunc P2, P1, 'wattr_on', 'iplp'
store_global 'ncurses::wattr_on', P2
dlfunc P2, P1, 'wattr_off', 'iplp'
store_global 'ncurses::wattr_off', P2
dlfunc P2, P1, 'wattr_set', 'iplsp'
store_global 'ncurses::wattr_set', P2
dlfunc P2, P1, 'wbkgd', 'ipl'
store_global 'ncurses::wbkgd', P2
dlfunc P2, P1, 'wbkgdset', 'vpl'
store_global 'ncurses::wbkgdset', P2
dlfunc P2, P1, 'wborder', 'ipllllllll'
store_global 'ncurses::wborder', P2
dlfunc P2, P1, 'wchgat', 'ipilsp'
store_global 'ncurses::wchgat', P2
dlfunc P2, P1, 'wclear', 'ip'
store_global 'ncurses::wclear', P2
dlfunc P2, P1, 'wclrtobot', 'ip'
store_global 'ncurses::wclrtobot', P2
dlfunc P2, P1, 'wclrtoeol', 'ip'
store_global 'ncurses::wclrtoeol', P2
dlfunc P2, P1, 'wcolor_set', 'ipsp'
store_global 'ncurses::wcolor_set', P2
dlfunc P2, P1, 'wcursyncup', 'vp'
store_global 'ncurses::wcursyncup', P2
dlfunc P2, P1, 'wdelch', 'ip'
store_global 'ncurses::wdelch', P2
dlfunc P2, P1, 'wdeleteln', 'ip'
store_global 'ncurses::wdeleteln', P2
dlfunc P2, P1, 'wechochar', 'ipl'
store_global 'ncurses::wechochar', P2
dlfunc P2, P1, 'werase', 'ip'
store_global 'ncurses::werase', P2
dlfunc P2, P1, 'wgetch', 'ip'
store_global 'ncurses::wgetch', P2
dlfunc P2, P1, 'wgetnstr', 'ipti'
store_global 'ncurses::wgetnstr', P2
dlfunc P2, P1, 'wgetstr', 'ipt'
store_global 'ncurses::wgetstr', P2
dlfunc P2, P1, 'whline', 'ipli'
store_global 'ncurses::whline', P2
dlfunc P2, P1, 'winch', 'lp'
store_global 'ncurses::winch', P2
dlfunc P2, P1, 'winchnstr', 'ip4i'
store_global 'ncurses::winchnstr', P2
dlfunc P2, P1, 'winnstr', 'ipti'
store_global 'ncurses::winnstr', P2
dlfunc P2, P1, 'winsch', 'ipl'
store_global 'ncurses::winsch', P2
dlfunc P2, P1, 'winsdelln', 'ipi'
store_global 'ncurses::winsdelln', P2
dlfunc P2, P1, 'winsertln', 'ip'
store_global 'ncurses::winsertln', P2
dlfunc P2, P1, 'winsnstr', 'ipti'
store_global 'ncurses::winsnstr', P2
dlfunc P2, P1, 'winsstr', 'ipt'
store_global 'ncurses::winsstr', P2
dlfunc P2, P1, 'winstr', 'ipt'
store_global 'ncurses::winstr', P2
dlfunc P2, P1, 'wmove', 'ipii'
store_global 'ncurses::wmove', P2
dlfunc P2, P1, 'wnoutrefresh', 'ip'
store_global 'ncurses::wnoutrefresh', P2
dlfunc P2, P1, 'wredrawln', 'ipii'
store_global 'ncurses::wredrawln', P2
dlfunc P2, P1, 'wrefresh', 'ip'
store_global 'ncurses::wrefresh', P2
dlfunc P2, P1, 'wscrl', 'ipi'
store_global 'ncurses::wscrl', P2
dlfunc P2, P1, 'wsetscrreg', 'ipii'
store_global 'ncurses::wsetscrreg', P2
dlfunc P2, P1, 'wstandout', 'ip'
store_global 'ncurses::wstandout', P2
dlfunc P2, P1, 'wstandend', 'ip'
store_global 'ncurses::wstandend', P2
dlfunc P2, P1, 'wsyncdown', 'vp'
store_global 'ncurses::wsyncdown', P2
dlfunc P2, P1, 'wsyncup', 'vp'
store_global 'ncurses::wsyncup', P2
dlfunc P2, P1, 'wtimeout', 'vpi'
store_global 'ncurses::wtimeout', P2
dlfunc P2, P1, 'wtouchln', 'ipiii'
store_global 'ncurses::wtouchln', P2
dlfunc P2, P1, 'wvline', 'ipli'
store_global 'ncurses::wvline', P2
dlfunc P2, P1, 'getmouse', 'ip'
store_global 'ncurses::getmouse', P2
dlfunc P2, P1, 'ungetmouse', 'ip'
store_global 'ncurses::ungetmouse', P2
dlfunc P2, P1, 'mousemask', 'll4'
store_global 'ncurses::mousemask', P2
dlfunc P2, P1, 'wenclose', 'lpii'
store_global 'ncurses::wenclose', P2
dlfunc P2, P1, 'mouseinterval', 'ii'
store_global 'ncurses::mouseinterval', P2
dlfunc P2, P1, 'wmouse_trafo', 'lp33l'
store_global 'ncurses::wmouse_trafo', P2
dlfunc P2, P1, 'mouse_trafo', 'l33l'
store_global 'ncurses::mouse_trafo', P2
dlfunc P2, P1, 'mcprint', 'iti'
store_global 'ncurses::mcprint', P2
dlfunc P2, P1, 'has_key', 'ii'
store_global 'ncurses::has_key', P2
restoreall
invoke P1

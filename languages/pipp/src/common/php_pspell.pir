# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_pspell.pir - PHP pspell  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool pspell_add_to_personal(int pspell, string word)>

Adds a word to a personal list

NOT IMPLEMENTED.

=cut

.sub 'pspell_add_to_personal'
    not_implemented()
.end

=item C<bool pspell_add_to_session(int pspell, string word)>

Adds a word to the current session

NOT IMPLEMENTED.

=cut

.sub 'pspell_add_to_session'
    not_implemented()
.end

=item C<bool pspell_check(int pspell, string word)>

Returns true if word is valid

NOT IMPLEMENTED.

=cut

.sub 'pspell_check'
    not_implemented()
.end

=item C<bool pspell_clear_session(int pspell)>

Clears the current session

NOT IMPLEMENTED.

=cut

.sub 'pspell_clear_session'
    not_implemented()
.end

=item C<int pspell_config_create(string language [, string spelling [, string jargon [, string encoding]]])>

Create a new config to be used later to create a manager

NOT IMPLEMENTED.

=cut

.sub 'pspell_config_create'
    not_implemented()
.end

=item C<bool pspell_config_data_dir(int conf, string directory)>

location of language data files

NOT IMPLEMENTED.

=cut

.sub 'pspell_config_data_dir'
    not_implemented()
.end

=item C<bool pspell_config_dict_dir(int conf, string directory)>

location of the main word list

NOT IMPLEMENTED.

=cut

.sub 'pspell_config_dict_dir'
    not_implemented()
.end

=item C<bool pspell_config_ignore(int conf, int ignore)>

Ignore words <= n chars

NOT IMPLEMENTED.

=cut

.sub 'pspell_config_ignore'
    not_implemented()
.end

=item C<bool pspell_config_mode(int conf, long mode)>

Select mode for config (PSPELL_FAST, PSPELL_NORMAL or PSPELL_BAD_SPELLERS)

NOT IMPLEMENTED.

=cut

.sub 'pspell_config_mode'
    not_implemented()
.end

=item C<bool pspell_config_personal(int conf, string personal)>

Use a personal dictionary for this config

NOT IMPLEMENTED.

=cut

.sub 'pspell_config_personal'
    not_implemented()
.end

=item C<bool pspell_config_repl(int conf, string repl)>

Use a personal dictionary with replacement pairs for this config

NOT IMPLEMENTED.

=cut

.sub 'pspell_config_repl'
    not_implemented()
.end

=item C<bool pspell_config_runtogether(int conf, bool runtogether)>

Consider run-together words as valid components

NOT IMPLEMENTED.

=cut

.sub 'pspell_config_runtogether'
    not_implemented()
.end

=item C<bool pspell_config_save_repl(int conf, bool save)>

Save replacement pairs when personal list is saved for this config

NOT IMPLEMENTED.

=cut

.sub 'pspell_config_save_repl'
    not_implemented()
.end

=item C<int pspell_new(string language [, string spelling [, string jargon [, string encoding [, int mode]]]])>

Load a dictionary

NOT IMPLEMENTED.

=cut

.sub 'pspell_new'
    not_implemented()
.end

=item C<int pspell_new_config(int config)>

Load a dictionary based on the given config

NOT IMPLEMENTED.

=cut

.sub 'pspell_new_config'
    not_implemented()
.end

=item C<int pspell_new_personal(string personal, string language [, string spelling [, string jargon [, string encoding [, int mode]]]])>

Load a dictionary with a personal wordlist

NOT IMPLEMENTED.

=cut

.sub 'pspell_new_personal'
    not_implemented()
.end

=item C<bool pspell_save_wordlist(int pspell)>

Saves the current (personal) wordlist

NOT IMPLEMENTED.

=cut

.sub 'pspell_save_wordlist'
    not_implemented()
.end

=item C<bool pspell_store_replacement(int pspell, string misspell, string correct)>

Notify the dictionary of a user-selected replacement

NOT IMPLEMENTED.

=cut

.sub 'pspell_store_replacement'
    not_implemented()
.end

=item C<array pspell_suggest(int pspell, string word)>

Returns array of suggestions

NOT IMPLEMENTED.

=cut

.sub 'pspell_suggest'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

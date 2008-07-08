# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_date.pir - PHP date  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C< DateTime::__construct([string time[, DateTimeZone object]])>

Creates new DateTime object


NOT IMPLEMENTED.

=cut

.sub 'DateTime::__construct'
    not_implemented()
.end

=item C< DateTimeZone::__construct(string timezone)>

Creates new DateTimeZone object.


NOT IMPLEMENTED.

=cut

.sub 'DateTimeZone::__construct'
    not_implemented()
.end

=item C<bool checkdate(int month, int day, int year)>

Returns true(1) if it is a valid date in gregorian calendar

NOT IMPLEMENTED.

=cut

.sub 'checkdate'
    not_implemented()
.end

=item C<string date(string format [, long timestamp])>

Format a local date/time

NOT IMPLEMENTED.

=cut

.sub 'date'
    not_implemented()
.end

=item C<DateTime date_create([string time[, DateTimeZone object]])>

Returns new DateTime object


NOT IMPLEMENTED.

=cut

.sub 'date_create'
    not_implemented()
.end

=item C<void date_date_set(DateTime object, long year, long month, long day)>

Sets the date.


NOT IMPLEMENTED.

=cut

.sub 'date_date_set'
    not_implemented()
.end

=item C<string date_default_timezone_get()>

Gets the default timezone used by all date/time functions in a script

NOT IMPLEMENTED.

=cut

.sub 'date_default_timezone_get'
    not_implemented()
.end

=item C<bool date_default_timezone_set(string timezone_identifier)>

Sets the default timezone used by all date/time functions in a script

NOT IMPLEMENTED.

=cut

.sub 'date_default_timezone_set'
    not_implemented()
.end

=item C<string date_format(DateTime object, string format)>

Returns date formatted according to given format


NOT IMPLEMENTED.

=cut

.sub 'date_format'
    not_implemented()
.end

=item C<void date_isodate_set(DateTime object, long year, long week[, long day])>

Sets the ISO date.


NOT IMPLEMENTED.

=cut

.sub 'date_isodate_set'
    not_implemented()
.end

=item C<void date_modify(DateTime object, string modify)>

Alters the timestamp.


NOT IMPLEMENTED.

=cut

.sub 'date_modify'
    not_implemented()
.end

=item C<long date_offset_get(DateTime object)>

Returns the DST offset.


NOT IMPLEMENTED.

=cut

.sub 'date_offset_get'
    not_implemented()
.end

=item C<array date_parse(string date)>

Returns associative array with detailed info about given date


NOT IMPLEMENTED.

=cut

.sub 'date_parse'
    not_implemented()
.end

=item C<array date_sun_info(long time, float latitude, float longitude)>

Returns an array with information about sun set/rise and twilight begin/end

NOT IMPLEMENTED.

=cut

.sub 'date_sun_info'
    not_implemented()
.end

=item C<mixed date_sunrise(mixed time [, int format [, float latitude [, float longitude [, float zenith [, float gmt_offset]]]]])>

Returns time of sunrise for a given day and location

NOT IMPLEMENTED.

=cut

.sub 'date_sunrise'
    not_implemented()
.end

=item C<mixed date_sunset(mixed time [, int format [, float latitude [, float longitude [, float zenith [, float gmt_offset]]]]])>

Returns time of sunset for a given day and location

NOT IMPLEMENTED.

=cut

.sub 'date_sunset'
    not_implemented()
.end

=item C<void date_time_set(DateTime object, long hour, long minute[, long second])>

Sets the time.


NOT IMPLEMENTED.

=cut

.sub 'date_time_set'
    not_implemented()
.end

=item C<DateTimeZone date_timezone_get(DateTime object)>

Return new DateTimeZone object relative to give DateTime


NOT IMPLEMENTED.

=cut

.sub 'date_timezone_get'
    not_implemented()
.end

=item C<void date_timezone_set(DateTime object, DateTimeZone object)>

Sets the timezone for the DateTime object.


NOT IMPLEMENTED.

=cut

.sub 'date_timezone_set'
    not_implemented()
.end

=item C<array getdate([int timestamp])>

Get date/time information

NOT IMPLEMENTED.

=cut

.sub 'getdate'
    not_implemented()
.end

=item C<string gmdate(string format [, long timestamp])>

Format a GMT date/time

NOT IMPLEMENTED.

=cut

.sub 'gmdate'
    not_implemented()
.end

=item C<int gmmktime([int hour [, int min [, int sec [, int mon [, int day [, int year]]]]]])>

Get UNIX timestamp for a GMT date

NOT IMPLEMENTED.

=cut

.sub 'gmmktime'
    not_implemented()
.end

=item C<string gmstrftime(string format [, int timestamp])>

Format a GMT/UCT time/date according to locale settings

NOT IMPLEMENTED.

=cut

.sub 'gmstrftime'
    not_implemented()
.end

=item C<int idate(string format [, int timestamp])>

Format a local time/date as integer

NOT IMPLEMENTED.

=cut

.sub 'idate'
    not_implemented()
.end

=item C<array localtime([int timestamp [, bool associative_array]])>

Returns the results of the C system call localtime as an associative array if the associative_array argument is set to 1 other wise it is a regular array

NOT IMPLEMENTED.

=cut

.sub 'localtime'
    not_implemented()
.end

=item C<int mktime([int hour [, int min [, int sec [, int mon [, int day [, int year]]]]]])>

Get UNIX timestamp for a date

NOT IMPLEMENTED.

=cut

.sub 'mktime'
    not_implemented()
.end

=item C<string strftime(string format [, int timestamp])>

Format a local time/date according to locale settings

NOT IMPLEMENTED.

=cut

.sub 'strftime'
    not_implemented()
.end

=item C<int strtotime(string time [, int now ])>

Convert string representation of date and time to a timestamp

NOT IMPLEMENTED.

=cut

.sub 'strtotime'
    not_implemented()
.end

=item C<int time(void)>

Return current UNIX timestamp

NOT IMPLEMENTED.

=cut

.sub 'time'
    not_implemented()
.end

=item C<array timezone_abbreviations_list()>

Returns associative array containing dst, offset and the timezone name


NOT IMPLEMENTED.

=cut

.sub 'timezone_abbreviations_list'
    not_implemented()
.end

=item C<array timezone_identifiers_list()>

Returns numerically index array with all timezone identifiers.


NOT IMPLEMENTED.

=cut

.sub 'timezone_identifiers_list'
    not_implemented()
.end

=item C<string timezone_name_from_abbr(string abbr[, long gmtOffset[, long isdst]])>

Returns the timezone name from abbrevation


NOT IMPLEMENTED.

=cut

.sub 'timezone_name_from_abbr'
    not_implemented()
.end

=item C<string timezone_name_get(DateTimeZone object)>

Returns the name of the timezone.


NOT IMPLEMENTED.

=cut

.sub 'timezone_name_get'
    not_implemented()
.end

=item C<long timezone_offset_get(DateTimeZone object, DateTime object)>

Returns the timezone offset.


NOT IMPLEMENTED.

=cut

.sub 'timezone_offset_get'
    not_implemented()
.end

=item C<DateTimeZone timezone_open(string timezone)>

Returns new DateTimeZone object


NOT IMPLEMENTED.

=cut

.sub 'timezone_open'
    not_implemented()
.end

=item C<array timezone_transitions_get(DateTimeZone object)>

Returns numeracilly indexed array containing associative array for all transitions for the timezone.


NOT IMPLEMENTED.

=cut

.sub 'timezone_transitions_get'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

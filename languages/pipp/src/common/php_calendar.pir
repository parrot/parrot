# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_calendar.pir - PHP calendar  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int cal_days_in_month(int calendar, int month, int year)>

Returns the number of days in a month for a given year and calendar

NOT IMPLEMENTED.

=cut

.sub 'cal_days_in_month'
    not_implemented()
.end

=item C<array cal_from_jd(int jd, int calendar)>

Converts from Julian Day Count to a supported calendar and return extended information

NOT IMPLEMENTED.

=cut

.sub 'cal_from_jd'
    not_implemented()
.end

=item C<array cal_info([int calendar])>

Returns information about a particular calendar

NOT IMPLEMENTED.

=cut

.sub 'cal_info'
    not_implemented()
.end

=item C<int cal_to_jd(int calendar, int month, int day, int year)>

Converts from a supported calendar to Julian Day Count

NOT IMPLEMENTED.

=cut

.sub 'cal_to_jd'
    not_implemented()
.end

=item C<int frenchtojd(int month, int day, int year)>

Converts a french republic calendar date to julian day count

NOT IMPLEMENTED.

=cut

.sub 'frenchtojd'
    not_implemented()
.end

=item C<int gregoriantojd(int month, int day, int year)>

Converts a gregorian calendar date to julian day count

NOT IMPLEMENTED.

=cut

.sub 'gregoriantojd'
    not_implemented()
.end

=item C<mixed jddayofweek(int juliandaycount [, int mode])>

Returns name or number of day of week from julian day count

NOT IMPLEMENTED.

=cut

.sub 'jddayofweek'
    not_implemented()
.end

=item C<string jdmonthname(int juliandaycount, int mode)>

Returns name of month for julian day count

NOT IMPLEMENTED.

=cut

.sub 'jdmonthname'
    not_implemented()
.end

=item C<string jdtofrench(int juliandaycount)>

Converts a julian day count to a french republic calendar date

NOT IMPLEMENTED.

=cut

.sub 'jdtofrench'
    not_implemented()
.end

=item C<string jdtogregorian(int juliandaycount)>

Converts a julian day count to a gregorian calendar date

NOT IMPLEMENTED.

=cut

.sub 'jdtogregorian'
    not_implemented()
.end

=item C<string jdtojewish(int juliandaycount [, bool hebrew [, int fl]])>

Converts a julian day count to a jewish calendar date

NOT IMPLEMENTED.

=cut

.sub 'jdtojewish'
    not_implemented()
.end

=item C<string jdtojulian(int juliandaycount)>

Convert a julian day count to a julian calendar date

NOT IMPLEMENTED.

=cut

.sub 'jdtojulian'
    not_implemented()
.end

=item C<int jewishtojd(int month, int day, int year)>

Converts a jewish calendar date to a julian day count

NOT IMPLEMENTED.

=cut

.sub 'jewishtojd'
    not_implemented()
.end

=item C<int juliantojd(int month, int day, int year)>

Converts a julian calendar date to julian day count

NOT IMPLEMENTED.

=cut

.sub 'juliantojd'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

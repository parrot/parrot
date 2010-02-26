#! parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id:  $

=head1 NAME

t/dynoplibs/random-range.t - Tests random range behavior of math_ops lib.

=head1 SYNOPSIS

        % prove t/dynoblibs/random-range.t

=head1 DESCRIPTION

Tests random range using chi-square

=cut

.loadlib 'math_ops'
.sub add_chi2_entry
	.param pmc table
	.param int nu
	.param num p_10
	.param num p_05
	.param num p_025
	.param num p_01
	.param num p_001

	$P0 = new ['FixedFloatArray']
	$P0 = 5

	$P0[0] = p_10
	$P0[1] = p_05
	$P0[2] = p_025
	$P0[3] = p_01
	$P0[4] = p_001

	table[nu] = $P0
.end

.sub compute_chi_square
	.param pmc histogram
	.param int num_samples

	.local int possible_values
	possible_values = elements histogram

	.local num expected
	expected = num_samples
	expected /= possible_values

	.local num K
	K = 0.0

	$I0 = possible_values
	if $I0 == 0 goto end
chi2_loop:
	dec $I0

	# Compute:  (O - E)^2 / E
	$N0 = histogram[$I0]
	$N0 -= expected
	$N0 *= $N0
	$N0 /= expected

	K += $N0

	unless $I0 == 0 goto chi2_loop

	#~ print "Chi-squared K is: "
	#~ say K
end:
	.return (K)
.end

.sub make_chi2_table
	# This info comes from http://itl.nist.gov/div898/handbook/eda/section3/eda3674.htm
	# Obtained 26 Feb 2010 -- Austin

	#	Probability of exceeding the critical value
	# nu	0.10	0.05	0.025	0.01	0.001

	.local pmc table
	table = new ['ResizablePMCArray']

	add_chi2_entry(table, 1, 2.706, 3.841, 5.024, 6.635, 10.828)
	add_chi2_entry(table, 2, 4.605, 5.991, 7.378, 9.210, 13.816)
	add_chi2_entry(table, 3, 6.251, 7.815, 9.348, 11.345, 16.266)
	add_chi2_entry(table, 4, 7.779, 9.488, 11.143, 13.277, 18.467)
	add_chi2_entry(table, 5, 9.236, 11.070, 12.833, 15.086, 20.515)
	add_chi2_entry(table, 6, 10.645, 12.592, 14.449, 16.812, 22.458)
	add_chi2_entry(table, 7, 12.017, 14.067, 16.013, 18.475, 24.322)
	add_chi2_entry(table, 8, 13.362, 15.507, 17.535, 20.090, 26.125)
	add_chi2_entry(table, 9, 14.684, 16.919, 19.023, 21.666, 27.877)
	add_chi2_entry(table, 10, 15.987, 18.307, 20.483, 23.209, 29.588)
	add_chi2_entry(table, 11, 17.275, 19.675, 21.920, 24.725, 31.264)
	add_chi2_entry(table, 12, 18.549, 21.026, 23.337, 26.217, 32.910)
	add_chi2_entry(table, 13, 19.812, 22.362, 24.736, 27.688, 34.528)
	add_chi2_entry(table, 14, 21.064, 23.685, 26.119, 29.141, 36.123)
	add_chi2_entry(table, 15, 22.307, 24.996, 27.488, 30.578, 37.697)
	add_chi2_entry(table, 16, 23.542, 26.296, 28.845, 32.000, 39.252)
	add_chi2_entry(table, 17, 24.769, 27.587, 30.191, 33.409, 40.790)
	add_chi2_entry(table, 18, 25.989, 28.869, 31.526, 34.805, 42.312)
	add_chi2_entry(table, 19, 27.204, 30.144, 32.852, 36.191, 43.820)
	add_chi2_entry(table, 20, 28.412, 31.410, 34.170, 37.566, 45.315)
	add_chi2_entry(table, 21, 29.615, 32.671, 35.479, 38.932, 46.797)
	add_chi2_entry(table, 22, 30.813, 33.924, 36.781, 40.289, 48.268)
	add_chi2_entry(table, 23, 32.007, 35.172, 38.076, 41.638, 49.728)
	add_chi2_entry(table, 24, 33.196, 36.415, 39.364, 42.980, 51.179)
	add_chi2_entry(table, 25, 34.382, 37.652, 40.646, 44.314, 52.620)
	add_chi2_entry(table, 26, 35.563, 38.885, 41.923, 45.642, 54.052)
	add_chi2_entry(table, 27, 36.741, 40.113, 43.195, 46.963, 55.476)
	add_chi2_entry(table, 28, 37.916, 41.337, 44.461, 48.278, 56.892)
	add_chi2_entry(table, 29, 39.087, 42.557, 45.722, 49.588, 58.301)
	add_chi2_entry(table, 30, 40.256, 43.773, 46.979, 50.892, 59.703)
	add_chi2_entry(table, 31, 41.422, 44.985, 48.232, 52.191, 61.098)
	add_chi2_entry(table, 32, 42.585, 46.194, 49.480, 53.486, 62.487)
	add_chi2_entry(table, 33, 43.745, 47.400, 50.725, 54.776, 63.870)
	add_chi2_entry(table, 34, 44.903, 48.602, 51.966, 56.061, 65.247)
	add_chi2_entry(table, 35, 46.059, 49.802, 53.203, 57.342, 66.619)
	add_chi2_entry(table, 36, 47.212, 50.998, 54.437, 58.619, 67.985)
	add_chi2_entry(table, 37, 48.363, 52.192, 55.668, 59.893, 69.347)
	add_chi2_entry(table, 38, 49.513, 53.384, 56.896, 61.162, 70.703)
	add_chi2_entry(table, 39, 50.660, 54.572, 58.120, 62.428, 72.055)
	add_chi2_entry(table, 40, 51.805, 55.758, 59.342, 63.691, 73.402)
	add_chi2_entry(table, 41, 52.949, 56.942, 60.561, 64.950, 74.745)
	add_chi2_entry(table, 42, 54.090, 58.124, 61.777, 66.206, 76.084)
	add_chi2_entry(table, 43, 55.230, 59.304, 62.990, 67.459, 77.419)
	add_chi2_entry(table, 44, 56.369, 60.481, 64.201, 68.710, 78.750)
	add_chi2_entry(table, 45, 57.505, 61.656, 65.410, 69.957, 80.077)
	add_chi2_entry(table, 46, 58.641, 62.830, 66.617, 71.201, 81.400)
	add_chi2_entry(table, 47, 59.774, 64.001, 67.821, 72.443, 82.720)
	add_chi2_entry(table, 48, 60.907, 65.171, 69.023, 73.683, 84.037)
	add_chi2_entry(table, 49, 62.038, 66.339, 70.222, 74.919, 85.351)
	add_chi2_entry(table, 50, 63.167, 67.505, 71.420, 76.154, 86.661)
	add_chi2_entry(table, 51, 64.295, 68.669, 72.616, 77.386, 87.968)
	add_chi2_entry(table, 52, 65.422, 69.832, 73.810, 78.616, 89.272)
	add_chi2_entry(table, 53, 66.548, 70.993, 75.002, 79.843, 90.573)
	add_chi2_entry(table, 54, 67.673, 72.153, 76.192, 81.069, 91.872)
	add_chi2_entry(table, 55, 68.796, 73.311, 77.380, 82.292, 93.168)
	add_chi2_entry(table, 56, 69.919, 74.468, 78.567, 83.513, 94.461)
	add_chi2_entry(table, 57, 71.040, 75.624, 79.752, 84.733, 95.751)
	add_chi2_entry(table, 58, 72.160, 76.778, 80.936, 85.950, 97.039)
	add_chi2_entry(table, 59, 73.279, 77.931, 82.117, 87.166, 98.324)
	add_chi2_entry(table, 60, 74.397, 79.082, 83.298, 88.379, 99.607)
	add_chi2_entry(table, 61, 75.514, 80.232, 84.476, 89.591, 100.888)
	add_chi2_entry(table, 62, 76.630, 81.381, 85.654, 90.802, 102.166)
	add_chi2_entry(table, 63, 77.745, 82.529, 86.830, 92.010, 103.442)
	add_chi2_entry(table, 64, 78.860, 83.675, 88.004, 93.217, 104.716)
	add_chi2_entry(table, 65, 79.973, 84.821, 89.177, 94.422, 105.988)
	add_chi2_entry(table, 66, 81.085, 85.965, 90.349, 95.626, 107.258)
	add_chi2_entry(table, 67, 82.197, 87.108, 91.519, 96.828, 108.526)
	add_chi2_entry(table, 68, 83.308, 88.250, 92.689, 98.028, 109.791)
	add_chi2_entry(table, 69, 84.418, 89.391, 93.856, 99.228, 111.055)
	add_chi2_entry(table, 70, 85.527, 90.531, 95.023, 100.425, 112.317)
	add_chi2_entry(table, 71, 86.635, 91.670, 96.189, 101.621, 113.577)
	add_chi2_entry(table, 72, 87.743, 92.808, 97.353, 102.816, 114.835)
	add_chi2_entry(table, 73, 88.850, 93.945, 98.516, 104.010, 116.092)
	add_chi2_entry(table, 74, 89.956, 95.081, 99.678, 105.202, 117.346)
	add_chi2_entry(table, 75, 91.061, 96.217, 100.839, 106.393, 118.599)
	add_chi2_entry(table, 76, 92.166, 97.351, 101.999, 107.583, 119.850)
	add_chi2_entry(table, 77, 93.270, 98.484, 103.158, 108.771, 121.100)
	add_chi2_entry(table, 78, 94.374, 99.617, 104.316, 109.958, 122.348)
	add_chi2_entry(table, 79, 95.476, 100.749, 105.473, 111.144, 123.594)
	add_chi2_entry(table, 80, 96.578, 101.879, 106.629, 112.329, 124.839)
	add_chi2_entry(table, 81, 97.680, 103.010, 107.783, 113.512, 126.083)
	add_chi2_entry(table, 82, 98.780, 104.139, 108.937, 114.695, 127.324)
	add_chi2_entry(table, 83, 99.880, 105.267, 110.090, 115.876, 128.565)
	add_chi2_entry(table, 84, 100.980, 106.395, 111.242, 117.057, 129.804)
	add_chi2_entry(table, 85, 102.079, 107.522, 112.393, 118.236, 131.041)
	add_chi2_entry(table, 86, 103.177, 108.648, 113.544, 119.414, 132.277)
	add_chi2_entry(table, 87, 104.275, 109.773, 114.693, 120.591, 133.512)
	add_chi2_entry(table, 88, 105.372, 110.898, 115.841, 121.767, 134.746)
	add_chi2_entry(table, 89, 106.469, 112.022, 116.989, 122.942, 135.978)
	add_chi2_entry(table, 90, 107.565, 113.145, 118.136, 124.116, 137.208)
	add_chi2_entry(table, 91, 108.661, 114.268, 119.282, 125.289, 138.438)
	add_chi2_entry(table, 92, 109.756, 115.390, 120.427, 126.462, 139.666)
	add_chi2_entry(table, 93, 110.850, 116.511, 121.571, 127.633, 140.893)
	add_chi2_entry(table, 94, 111.944, 117.632, 122.715, 128.803, 142.119)
	add_chi2_entry(table, 95, 113.038, 118.752, 123.858, 129.973, 143.344)
	add_chi2_entry(table, 96, 114.131, 119.871, 125.000, 131.141, 144.567)
	add_chi2_entry(table, 97, 115.223, 120.990, 126.141, 132.309, 145.789)
	add_chi2_entry(table, 98, 116.315, 122.108, 127.282, 133.476, 147.010)
	add_chi2_entry(table, 99, 117.407, 123.225, 128.422, 134.642, 148.230)
	add_chi2_entry(table, 100, 118.498, 124.342, 129.561, 135.807, 149.449)

	.return (table)
.end

.sub make_random_hist
	.param int min
	.param int max
	.param int num_samples

	if max > min goto get_pv
	die "Max must be > min"

get_pv:
	.local int possible_values
	possible_values = max - min
	inc possible_values

	.local pmc histogram
	histogram = new ['FixedIntegerArray']
	histogram = possible_values

	$I0 = max - min
init:
	histogram[$I0] = 0
	dec $I0
	unless $I0 < 0 goto init

	$I0 = num_samples
	if $I0 == 0 goto loop_done
loop:
	.local int random
	random = rand min, max

	random -= min
	$I1 = histogram[random]
	inc $I1
	histogram[random] = $I1

	dec $I0
	unless $I0 <= 0 goto loop
loop_done:

	.return (histogram)
.end

.sub print_histogram
	.param pmc histogram
	.param int num_samples

	.local num expected
	expected = num_samples
	$I0 = elements histogram
	expected /= $I0

	.local pmc sprintf_args
	sprintf_args = new ['FixedPMCArray']
	sprintf_args = 2

	$I0 = elements histogram
hist_loop:
	dec $I0

	$N0 = histogram[$I0]
	$N0 /= expected
	$P0 = box $N0
	sprintf_args[0] = $P0

	$N1 = $N0 * 40
	$I1 = $N1
	$I1 -= 6	# width of printed $N0, plus space
	if $I1 > 0 goto make_stars
	$I1 = 0
make_stars:

	$S0 = repeat '*', $I1
	$P0 = box $S0
	sprintf_args[1] = $P0

	$S0 = sprintf "%5.3f %s", sprintf_args
	say $S0

	unless $I0 <= 0 goto hist_loop

end:
.end

.sub test_histogram
	.param pmc histogram
	.param num K
	.param pmc table

	.local int degrees_of_freedom
	$I0 = elements histogram
	degrees_of_freedom = $I0 - 1

	.local pmc sprintf_args
	sprintf_args = new ['ResizablePMCArray']
	$P0 = box degrees_of_freedom
	push sprintf_args, $P0

	$I0 = exists table[degrees_of_freedom]
	if $I0 goto get_data

	$S0 = sprintf "Don't have chi2 data for %d degrees of freedom", sprintf_args
	skip(1, $S0)
	goto end

get_data:

	.local pmc chi2_data
	chi2_data = table[degrees_of_freedom]
	$N0 = chi2_data[0]

	$I0 = islt K, $N0

	$P0 = box $N0
	unshift sprintf_args, $P0
	$P0= box K
	unshift sprintf_args, $P0

	$S0 = sprintf "K (%5.3f) should be less than limit (%5.3f) for %d degrees of freedom", sprintf_args
	todo($I0, $S0)

end:
	.return ($I0)
.end

.sub test_random_range
	.param int range
	.param int times
	.param pmc table

	.local int num_samples
	num_samples = range * times

	.local int min, max
	min = 10
	max = min + range

	.local pmc histogram
	histogram = make_random_hist(min, max, num_samples)

	.local num K
	K = compute_chi_square(histogram, num_samples)

	$I0 = test_histogram(histogram, K, table)

	#if $I0 goto end
	#print_histogram(histogram, num_samples)
end:
.end

.sub main :main
	.include 'test_more.pir'

	.const int TIMES = 10000

	.local int num_tries
	num_tries = 101

	plan(num_tries)

	$S0 = "Running tests expecting #TIMES# hits per bucket"
	$P0 = split '#', $S0
	$S0 = TIMES
	$P0[1] = $S0
	$S0 = join '', $P0
	diag($S0)

	.local pmc table
	table = make_chi2_table()

	$I0 = 0
loop:
	inc $I0
	test_random_range($I0, TIMES, table)
	if $I0 < num_tries goto loop

.end
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

#! perl -w
################################################################################
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$
################################################################################

=head1 NAME

tools/dev/lib_deps.pl - List libc dependencies

=head1 SYNOPSIS

    % perl tools/dev/lib_deps.pl [object | source] file1 [file2 ...]

=head1 DESCRIPTION

This script is intended to give us an idea of what C<libc> functions
this build depends upon.

=head2 Options

=over 4

=item C<object>

In C<object> mode, it expects a list of all parrot's object files. It
runs C<nm> on each and determines what external functions are being
called. Note that it assumes a gnu-ish C<nm>.

=item C<source>

In C<source> mode, it uses a the C<cxref> program
(L<http://www.gedanken.demon.co.uk/cxref/>) to extract information from
the program source about what functions are being called, what includes
are used, etc.  This mode is potentially more thorough, but a bit more
magical and therefore less conclusive.

=back

=cut

################################################################################

use strict;
use File::Find;

my %defined_in;
my %referenced_in;
my %ansi_c89_symbol;
my %ansi_c89_header;

my ($mode, @files) = @ARGV;

if ($mode !~ /^(source|object)$/ || ! @files) {
    die "Usage: $0 object <object files..>\n" .
        "       $0 source <source files..>\n";
}

while (<DATA>) {
    next if /^\s*#/; chomp;
    my ($symbol, $file) = /(\S+)\s+(\S+)/;
    $ansi_c89_symbol{$symbol} = $file unless ($symbol eq "UNDEF");
    push @{$ansi_c89_header{$file}}, $symbol;
}

if ($mode eq "object") {
    do_object();
} else {
    do_source();
}

exit(0);

##############################################################################

sub do_source {

    if ($files[0] eq "all_source") {
        # do a little "find" action for now.
        
        @files = ();
        File::Find::find({wanted => sub {
                              /^.*\.[ch]\z/s &&
                                push @files, $File::Find::name;
                          }}, '.');
    }

    # note: need to run this a second time so the database is built.
    # should just use the build process to do it the first time.
    my $cmd = "cxref -raw -Iinclude -xref @files";
    print "Running cxref (pass 1)\n";
    system("$cmd > /dev/null 2>/dev/null");
    print "Running cxref (pass 2)\n";
    open(F, "$cmd 2>/dev/null|")
      || die "Can't run $cmd.\n";

    my %external_calls;
    my %internal_calls;
    my %variable_visible;
    my %system_include;
    my ($file, $function, $variable);
    while (<F>) {
        
        if (/----------------------------------------/) {
            undef $file if defined($file);
            next;
        }

        if (/^INCLUDES : '(.*)' \[System file\]/) {
            next if ($1 =~ /^include\//);
            $system_include{$1}{$file}++;
            next;
        }
        
        if (! $file && /^FILE : '(.*)'$/) {
            $file = $1;
            next;
        }
        
        # skip anything between files.
        next unless $file;
        
        # beginning of function block
        if (/FUNCTION : (.*) \[(.*)\]/) {
            $function = $1;
            my $function_scope = $2;
            
            next;
        }
        
        # end of function block
        if ($function && /^\s*$/) {
            undef $function;
            next;
        }

        # beginning of variable block
        if (/VARIABLE : (.*) \[(.*)\]/) {
            $variable = $1;
            my $variable_scope = $2;
            if ($variable_scope eq "Local") {
                $variable_visible{$file}{$1}++;
            } else {
                $variable_visible{"ALL"}{$1}++;
            }
            
            next;
        }
        
        # end of variable block
        if ($variable && /^\s*$/) {
            undef $variable;
            next;
        }
        
        if ($function) {
            if (/Calls (.*) : (.*)/) {                                
                # calling another function within parrot.
                $internal_calls{$1}{"$file:$function"}++ 
                  unless ($variable_visible{$file}{$1} || 
                          $variable_visible{ALL}{$1});
            } elsif (/Calls (.*)/) {
                # calling a function outside of parrot!
                $external_calls{$1}{"$file:$function"}++
                  unless ($variable_visible{$file}{$1} ||
                          $variable_visible{ALL}{$1});
            }
        }
    }
    
    close(F);

    # filter out things that start with _.  Probably internal libc stuff.
    my @external_calls = grep { ! /^_/ } sort keys %external_calls;
    my @internal_calls = grep { ! /^_/ } sort keys %internal_calls;
    my @non_ansi_external_calls = grep { ! exists($ansi_c89_symbol{$_}) } @external_calls;
    
    printf("Found %d functions which are defined and called within the %d supplied source files.\n", scalar(@internal_calls), scalar(@files));
    printf("Found %d external functions which were called.\n", scalar(@external_calls));
    printf("Of these, %d are not defined by ANSI C89:\n", scalar(@non_ansi_external_calls));
    
    foreach (@non_ansi_external_calls) {
        print "    $_:\n";
        foreach (sort keys %{$external_calls{$_}}) {
            print "        $_\n";
        }
    }

    print "\nThe following non-ansi system includes are used:\n";
    foreach my $include (sort keys %system_include) {
        if (! exists($ansi_c89_header{$include})) {
            print "    $include, included by:\n";
            foreach my $file (sort keys %{$system_include{$include}}) {
                print "        $file\n";
            }
        }
    }
}


sub do_object {
    foreach my $obj (@files) {
        open(F, "nm -a $obj|") || die "Can't run nm on $obj\n";
        
        while(<F>) {
            chomp;
            
            my ($type, $symbol) = /^........ (\S) (.*)/;
            
            if ($type eq 'U') {
                $defined_in{$symbol} ||= undef;
		push @{$referenced_in{$symbol}}, $obj;
            } else {
                $defined_in{$symbol} .= "$obj ";
            }
        }
        
        close(F);
    }

    # omit symbols which begin with _.  These are likely to be internal
    # variables used by libc macros.
    my @symbols = grep { ! /^_/ } sort keys %defined_in;
    
    my @external_symbols = sort grep { ! defined($defined_in{$_}) } @symbols;
    my @internal_symbols = sort grep { defined($defined_in{$_}) } @symbols;
    my @non_ansi_external_symbols = grep { ! exists($ansi_c89_symbol{$_}) } @external_symbols;
    
    printf("Found %d symbols defined within the %d supplied object files.\n", scalar(@internal_symbols), scalar(@files));
    printf("Found %d external symbols\n", scalar(@external_symbols));
    printf("Of these, %d are not defined by ANSI C89:\n", scalar(@non_ansi_external_symbols));

    print "    $_ (in " . (join ',', @{$referenced_in{$_}}) . ")\n" foreach (@non_ansi_external_symbols);
}

    
__END__
# The following symbols are available in a C89 Hosted Implementation
# (not sure if I got this right- it came from a C99 reference, so some 99isms
#  might have slipped in)
abort       stdlib.h
abs         stdlib.h
acos        math.h
acosf       math.h
acosh       math.h
acoshf      math.h
acoshl      math.h
acosl       math.h
arg         complex.h
asctime     time.h
asin        math.h
asinf       math.h
asinh       math.h
asinhf      math.h
asinhl      math.h
asinl       math.h
atan        math.h
atan2       math.h
atan2f      math.h
atan2l      math.h
atanf       math.h
atanh       math.h
atanhf      math.h
atanhl      math.h
atanl       math.h
atexit      stdlib.h
atof        stdlib.h
atoi        stdlib.h
atol        stdlib.h
atoll       stdlib.h
bsearch     stdlib.h
cabs        complex.h
cabsf       complex.h
cabsl       complex.h
cacos       complex.h
cacosf      complex.h
cacosh      complex.h
cacoshf     complex.h
cacoshl     complex.h
cacosl      complex.h
calloc      stdlib.h
carg        complex.h
cargf       complex.h
cargl       complex.h
casin       complex.h
casinf      complex.h
casinh      complex.h
casinhf     complex.h
casinhl     complex.h
casinl      complex.h
catan       complex.h
catanf      complex.h
catanh      complex.h
catanhf     complex.h
catanhl     complex.h
catanl      complex.h
cbrt        math.h
cbrtf       math.h
cbrtl       math.h
ccos        complex.h
ccosf       complex.h
ccosh       complex.h
ccoshf      complex.h
ccoshl      complex.h
ccosl       complex.h
ceil        math.h
ceilf       math.h
ceill       math.h
cexp        complex.h
cexpf       complex.h
cexpl       complex.h
cimag       complex.h
cimagf      complex.h
cimagl      complex.h
clearerr    stdio.h
clock       time.h
clog        complex.h
clogf       complex.h
clogl       complex.h
conj        complex.h
conjf       complex.h
conjl       complex.h
copysign    math.h
copysignf   math.h
copysignl   math.h
cos         math.h
cosf        math.h
cosh        math.h
coshf       math.h
coshl       math.h
cosl        math.h
cpow        complex.h
cpowf       complex.h
cpowl       complex.h
cproj       complex.h
cprojf      complex.h
cprojl      complex.h
creal       complex.h
crealf      complex.h
creall      complex.h
csin        complex.h
csinf       complex.h
csinh       complex.h
csinhf      complex.h
csinhl      complex.h
csinl       complex.h
csqrt       complex.h
csqrtf      complex.h
csqrtl      complex.h
ctan        complex.h
ctanf       complex.h
ctanh       complex.h
ctanhf      complex.h
ctanhl      complex.h
ctanl       complex.h
ctime       time.h
difftime    time.h
div         stdlib.h
erf         math.h
erfc        math.h
erfcf       math.h
erfcl       math.h
erff        math.h
erfl        math.h
errno       errno.h
exit        stdlib.h
exp         math.h
exp2        math.h
exp2f       math.h
exp2l       math.h
expf        math.h
expl        math.h
expm1       math.h
expm1f      math.h
expm1l      math.h
fabs        math.h
fabsf       math.h
fabsl       math.h
fclose      stdio.h
fdim        math.h
fdimf       math.h
fdiml       math.h
feof        stdio.h
ferror      stdio.h
fflush      stdio.h
fgetc       stdio.h
fgetpos     stdio.h
fgets       stdio.h
floor       math.h
floorf      math.h
floorl      math.h
fma         math.h
fmaf        math.h
fmal        math.h
fmax        math.h
fmaxf       math.h
fmaxl       math.h
fmin        math.h
fminf       math.h
fminl       math.h
fmod        math.h
fmodf       math.h
fmodl       math.h
fopen       stdio.h
fpclassify  math.h
fprintf     stdio.h
fputc       stdio.h
fputs       stdio.h
fread       stdio.h
free        stdlib.h
freopen     stdio.h
frexp       math.h
frexpf      math.h
frexpl      math.h
fscanf      stdio.h
fseek       stdio.h
fsetpos     stdio.h
ftell       stdio.h
fwrite      stdio.h
getc        stdio.h
getchar     stdio.h
getenv      stdlib.h
gets        stdio.h
gmtime      time.h
hypot       math.h
hypotf      math.h
hypotl      math.h
ilogb       math.h
ilogbf      math.h
ilogbl      math.h
imag        complex.h
isalnum     ctype.h
isalpha     ctype.h
isblank     ctype.h
iscntrl     ctype.h
isdigit     ctype.h
isfinite    math.h
isgraph     ctype.h
isgreater   math.h
isgreatereq math.h
isinf       math.h
isless      math.h
islessequal math.h
islessgreat math.h
islower     ctype.h
isnan       math.h
isnormal    math.h
isprint     ctype.h
ispunct     ctype.h
isspace     ctype.h
isunordered math.h
isupper     ctype.h
isxdigit    ctype.h
labs        stdlib.h
ldexp       math.h
ldexpf      math.h
ldexpl      math.h
ldiv        stdlib.h
lgamma      math.h
lgammaf     math.h
lgammal     math.h
llabs       stdlib.h
llrint      math.h
llrintf     math.h
llrintl     math.h
llround     math.h
llroundf    math.h
llroundl    math.h
localeconv  locale.h
localtime   time.h
log         math.h
log10       math.h
log10f      math.h
log10l      math.h
log1p       math.h
log1pf      math.h
log1pl      math.h
log2        math.h
log2f       math.h
log2l       math.h
logb        math.h
logbf       math.h
logbl       math.h
logf        math.h
logl        math.h
longjmp     setjmp.h
lrint       math.h
lrintf      math.h
lrintl      math.h
lround      math.h
lroundf     math.h
lroundl     math.h
malloc      stdlib.h
mblen       stdlib.h
mbstowcs    stdlib.h
mbtowc      stdlib.h
memchr      string.h
memcmp      string.h
memcpy      string.h
memmove     string.h
memset      string.h
mktime      time.h
modf        math.h
modff       math.h
modfl       math.h
nan         math.h
nanf        math.h
nanl        math.h
nearbyint   math.h
nearbyintf  math.h
nearbyintl  math.h
nextafter   math.h
nextafterf  math.h
nextafterl  math.h
nexttoward  math.h
nexttowardf math.h
nexttowardl math.h
perror      stdio.h
pow         math.h
printf      stdio.h
putc        stdio.h
putchar     stdio.h
puts        stdio.h
qsort       stdlib.h
raise       signal.h
rand        stdlib.h
real        complex.h
realloc     stdlib.h
remainder   math.h
remainderf  math.h
remainderl  math.h
remove      stdio.h
remquo      math.h
remquof     math.h
remquol     math.h
rename      stdio.h
rewind      stdio.h
rint        math.h
rintf       math.h
rintl       math.h
round       math.h
roundf      math.h
roundl      math.h
scalbln     math.h
scalblnf    math.h
scalblnl    math.h
scalbn      math.h
scalbnf     math.h
scalbnl     math.h
scanf       stdio.h
setbuf      stdio.h
setlocale   locale.h
setvbuf     stdio.h
signal      signal.h
signbit     math.h
sin         math.h
sinf        math.h
sinh        math.h
sinhf       math.h
sinhl       math.h
sinl        math.h
sprintf     stdio.h
sqrt        math.h
sqrtf       math.h
sqrtl       math.h
srand       stdlib.h
sscanf      stdio.h
stderr      stdio.h
stdin       stdio.h
stdout      stdio.h
strcat      string.h
strchr      string.h
strcmp      string.h
strcoll     string.h
strcpy      string.h
strcspn     string.h
strerror    string.h
strftime    time.h
strlen      string.h
strncat     string.h
strncmp     string.h
strncpy     string.h
strpbrk     string.h
strrchr     string.h
strspn      string.h
strstr      string.h
strtod      stdlib.h
strtof      stdlib.h
strtok      string.h
strtol      stdlib.h
strtold     stdlib.h
strtoll     stdlib.h
strtoul     stdlib.h
strtoull    stdlib.h
strxfrm     string.h
system      stdlib.h
tan         math.h
tanf        math.h
tanh        math.h
tanhf       math.h
tanhl       math.h
tanl        math.h
tgamma      math.h
tgammaf     math.h
tgammal     math.h
time        time.h
tmpfile     stdio.h
tmpnam      stdio.h
tolower     ctype.h
toupper     ctype.h
trunc       math.h
truncf      math.h
truncl      math.h
ungetc      stdio.h
vfprintf    stdio.h
vfscanf     stdio.h
vprintf     stdio.h
vscanf      stdio.h
vsprintf    stdio.h
vsscanf     stdio.h
UNDEF       assert.h
UNDEF       stdarg.h

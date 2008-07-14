#! perl
# $Id$

use strict;
use warnings;
use Fatal qw( open close );

unless (scalar(@ARGV) == 1) {
    print <<'USAGE';
Usage:
    genskel.pl php_path
USAGE
    exit 1;
}
my $php_path = shift @ARGV;
#my $php_path = '/home/user/checkout/PHP/php-5.2.6';

my %ext = (
    builtin        => [ 'Zend/zend_builtin_functions.c' ],

    array          => [ 'ext/standard/array.c' ],
    assert         => [ 'ext/standard/assert.c' ],
    base64         => [ 'ext/standard/base64.c' ],
    basic          => [ 'ext/standard/basic_functions.c' ],
    bcmath         => [ 'ext/bcmath/bcmath.c' ],
    browscap       => [ 'ext/standard/browscap.c' ],
    bz2            => [ 'ext/bz2/bz2.c' ],
    calendar       => [ 'ext/calendar/calendar.c' ],
    com_dotnet     => [
        'ext/com_dotnet/com_variant.c',
        'ext/com_dotnet/com_com.c',
        'ext/com_dotnet/com_persist.c',
    ],
    crc32          => [ 'ext/standard/crc32.c' ],
    crypt          => [ 'ext/standard/crypt.c' ],
    ctype          => [ 'ext/ctype/ctype.c' ],
    curl           => [ 'ext/curl/interface.c', 'ext/curl/multi.c' ],
    cyr_convert    => [ 'ext/standard/cyr_convert.c' ],
    date           => [ 'ext/date/php_date.c' ],
    datetime       => [ 'ext/standard/datetime.c' ],
    dba            => [ 'ext/dba/dba.c' ],
    dbase          => [ 'ext/dbase/dbase.c' ],
    dir            => [ 'ext/standard/dir.c' ],
    dl             => [ 'ext/standard/dl.c' ],
    dns            => [ 'ext/standard/dns.c' ],
    dom            => [
        'ext/dom/php_dom.c',
        'ext/dom/attr.c',
        'ext/dom/cdatasection.c',
        'ext/dom/characterdata.c',
        'ext/dom/comment.c',
        'ext/dom/document.c',
        'ext/dom/documentfragment.c',
        'ext/dom/domconfiguration.c',
        'ext/dom/domerrorhandler.c',
        'ext/dom/domimplementation.c',
        'ext/dom/domimplementationlist.c',
        'ext/dom/domimplementationsource.c',
        'ext/dom/domstringlist.c',
        'ext/dom/element.c',
        'ext/dom/entityreference.c',
        'ext/dom/namednodemap.c',
        'ext/dom/namelist.c',
        'ext/dom/node.c',
        'ext/dom/nodelist.c',
        'ext/dom/processinginstruction.c',
        'ext/dom/string_extend.c',
        'ext/dom/text.c',
        'ext/dom/userdatahandler.c',
        'ext/dom/xpath.c',
    ],
    exec           => [ 'ext/standard/exec.c' ],
    exif           => [ 'ext/exif/exif.c' ],
#    fbsql          => [ 'ext/fbsql/php_fbsql.c' ], STATUS: unknown
#    fdf            => [ 'ext/fdf/fdf.c' ], ?
    file           => [ 'ext/standard/file.c' ],
    filestat       => [ 'ext/standard/filestat.c' ],
    filter         => [ 'ext/filter/filter.c' ],
    formatted_print=> [ 'ext/standard/formatted_print.c' ],
    fsock          => [ 'ext/standard/fsock.c' ],
    ftok           => [ 'ext/standard/ftok.c' ],
    ftp            => [ 'ext/ftp/php_ftp.c' ],
    gd             => [ 'ext/gd/gd.c' ],
    gettext        => [ 'ext/gettext/gettext.c' ],
    gmp            => [ 'ext/gmp/gmp.c' ],
#    hash           => [ 'ext/hash/hash.c', 'ext/hash/hash_md.c', 'ext/hash/hash_sha.c' ], ?
    head           => [ 'ext/standard/head.c' ],
    html           => [ 'ext/standard/html.c' ],
    http           => [ 'ext/standard/http.c' ],
    iconv          => [ 'ext/iconv/iconv.c' ],
    image          => [ 'ext/standard/image.c' ],
    imap           => [ 'ext/imap/php_imap.c' ],
    info           => [ 'ext/standard/info.c' ],
    interbase      => [
        'ext/interbase/ibase_blobs.c',
        'ext/interbase/ibase_events.c',
        'ext/interbase/ibase_query.c',
        'ext/interbase/ibase_service.c',
        'ext/interbase/interbase.c',
    ],
    iptc           => [ 'ext/standard/iptc.c' ],
    json           => [ 'ext/json/json.c' ],
    lcg            => [ 'ext/standard/lcg.c' ],
    ldap           => [ 'ext/ldap/ldap.c' ],
    levenshtein    => [ 'ext/standard/levenshtein.c' ],
#    libxml         => [ 'ext/libxml/libxml.c' ], ?
    link           => [ 'ext/standard/link.c' ],
    math           => [ 'ext/standard/math.c' ],
    mail           => [ 'ext/standard/mail.c' ],
    mbstring       => [ 'ext/mbstring/mbstring.c', 'ext/mbstring/php_mbregex.c' ],
    mcrypt         => [ 'ext/mcrypt/mcrypt.c' ],
    md5            => [ 'ext/standard/md5.c' ],
    metaphone      => [ 'ext/standard/metaphone.c' ],
    mhash          => [ 'ext/mhash/mhash.c' ],
    microtime      => [ 'ext/standard/microtime.c' ],
#    mime_magic     => [ 'ext/mime_magic/mime_magic.c' ], Deprecated
    ming           => [ 'ext/ming/ming.c' ],
    msql           => [ 'ext/msql/php_msql.c' ],
    mssql          => [ 'ext/mssql/php_mssql.c' ],
    mysql          => [ 'ext/mysql/php_mysql.c' ],
    mysqli         => [
        'ext/mysqli/mysqli_api.c',
        'ext/mysqli/mysqli_embedded.c',
        'ext/mysqli/mysqli_nonapi.c',
        'ext/mysqli/mysqli_repl.c',
        'ext/mysqli/mysqli_report.c',
    ],
#    ncurses        => [ 'ext/ncurses/ncurses_functions.c' ], MAINTENANCE: Unknown
    oci8           => [ 'ext/oci8/oci8_interface.c' ],
    odbc           => [ 'ext/odbc/birdstep.c', 'ext/odbc/php_odbc.c' ],
    openssl        => [ 'ext/openssl/openssl.c' ],
    pack           => [ 'ext/standard/pack.c' ],
    pageinfo       => [ 'ext/standard/pageinfo.c' ],
    pcntl          => [ 'ext/pcntl/pcntl.c', 'ext/pcntl/php_signal.c' ],
    pcre           => [ 'ext/pcre/php_pcre.c' ],
    pdo            => [ 'ext/pdo/pdo.c', 'ext/pdo/pdo_dbh.c', 'ext/pdo/pdo_stmt.c' ],
    pdo_dblib      => [
        'ext/pdo_dblib/dblib_stmt.c',
        'ext/pdo_dblib/pdo_dblib.c',
        'ext/pdo_dblib/dblib_driver.c'
    ],
#    pdo_firebird   => [],
#    pdo_mysql      => [],
#    pdo_oci        => [],
#    pdo_odbc       => [],
    pdo_pgsql      => [ 'ext/pdo_pgsql/pgsql_driver.c' ],
#    pdo_sqlite     => [],
    pgsql          => [ 'ext/pgsql/pgsql.c' ],
    posix          => [ 'ext/posix/posix.c' ],
    proc_open      => [ 'ext/standard/proc_open.c' ],
    pspell         => [ 'ext/pspell/pspell.c' ],
    quot_print     => [ 'ext/standard/quot_print.c' ],
    rand           => [ 'ext/standard/rand.c' ],
#    readline       => [ 'ext/readline/readline.c' ], MAINTENANCE: Unknown
    recode         => [ 'ext/recode/recode.c' ],
    reflection     => [ 'ext/reflection/php_reflection.c' ],
    reg            => [ 'ext/standard/reg.c' ],
    session        => [ 'ext/session/session.c' ],
    sha1           => [ 'ext/standard/sha1.c' ],
    shmop          => [ 'ext/shmop/shmop.c' ],
    simplexml      => [ 'ext/simplexml/simplexml.c' ],
    snmp           => [ 'ext/snmp/snmp.c' ],
    soap           => [ 'ext/soap/soap.c' ],
    sockets        => [ 'ext/sockets/sockets.c' ],
    soundex        => [ 'ext/standard/soundex.c' ],
    spl            => [
        'ext/spl/php_spl.c',
        'ext/spl/spl_array.c',
        'ext/spl/spl_directory.c',
        'ext/spl/spl_iterators.c',
        'ext/spl/spl_observer.c',
        'ext/spl/spl_sxe.c',
    ],
    sqlite         => [ 'ext/sqlite/sqlite.c' ],
    streamsfuncs   => [ 'ext/standard/streamsfuncs.c' ],
    string         => [ 'ext/standard/string.c' ],
#    sybase         => [ 'ext/sybase/php_sybase_db.c' ], STATUS: Not Working
    sybase_ct      => [ 'ext/sybase_ct/php_sybase_ct.c' ],
    syslog         => [ 'ext/standard/syslog.c' ],
    sysvmsg        => [ 'ext/sysvmsg/sysvmsg.c' ],
    sysvsem        => [ 'ext/sysvsem/sysvsem.c' ],
    sysvshm        => [ 'ext/sysvshm/sysvshm.c' ],
    tidy           => [ 'ext/tidy/tidy.c' ],
    tokenizer      => [ 'ext/tokenizer/tokenizer.c' ],
    type           => [ 'ext/standard/type.c' ],
    uniqid         => [ 'ext/standard/uniqid.c' ],
    url            => [ 'ext/standard/url.c' ],
    user_filters   => [ 'ext/standard/user_filters.c' ],
    uuencode       => [ 'ext/standard/uuencode.c' ],
    var            => [ 'ext/standard/var.c' ],
    versioning     => [ 'ext/standard/versioning.c' ],
    wddx           => [ 'ext/wddx/wddx.c' ],
    xml            => [ 'ext/xml/xml.c' ],
    xmlreader      => [ 'ext/xmlreader/php_xmlreader.c' ],
    xmlrpc         => [ 'ext/xmlrpc/xmlrpc-epi-php.c' ],
    xmlwriter      => [ 'ext/xmlwriter/php_xmlwriter.c' ],
    xsl            => [ 'ext/xsl/php_xsl.c', 'ext/xsl/xsltprocessor.c' ],
    zip            => [ 'ext/zip/php_zip.c' ],
    zlib           => [ 'ext/zlib/zlib.c' ],
);


my $total = 0;
while (my ($mod, $paths) = each (%ext)) {
    my @funcs;
    foreach my $path (@{$paths}) {
        my $php_src = $php_path . '/'. $path;
        open my $IN, '<', $php_src;
        while (<$IN>) {
            if (/^\/\*\s+{{{\s+proto\s+(?:public\s+)?(?:static\s+)?(.*)/) {
                my $proto = $1;
                my $doc = q{};
                if ($proto !~ /\*\/$/) {
                    while (<$IN>) {
                        if (/(.*)\*\/\s*$/) {
                            my $line = $1;
                            $line =~ s/^\s*//;
                            $line =~ s/\s*$//;
                            $doc .= $line;
                            last;
                        }
                        my $line = $_;
                        $line =~ s/^\s*//;
                        $line =~ s/\s*\n$//;
                        $doc .= $line . "\n";
                    }
                }
                push @funcs, [ $proto, $doc ];
            }
        }
        close $IN;
    }
    my $std = ($paths->[0] =~ /standard/) ? 'Standard' : q{};
    my $filename = 'php_' . $mod . '.pir';
    open my $OUT, '>', $filename;
    print $OUT <<"HEADER";
# Copyright (C) 2008, The Perl Foundation.
# \$Id:  \$

=head1 NAME

$filename - PHP $mod $std Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

HEADER
    my @funcs2;
    foreach (@funcs) {
        my ($proto, $doc) = @{$_};
        my $type;
        my $func;
        my $params;
        if ($proto =~ /^(\S+)\s+(\S+)\s*\((.*)\)/) {
            $type = $1;
            $func = $2;
            $params = $3;
        }
        elsif ($proto =~ /^(\S+)\s*\((.*)\)/) {
            $type = q{};
            $func = $1;
            $params = $2;
        }
        else {
            warn "Can't handle $proto\n";
        }
        push @funcs2, [ $type, $func, $params, $doc ];
    }
    foreach (sort { $a->[1] cmp $b->[1] } @funcs2) {
        my ($type, $func, $params, $doc) = @{$_};
        print $OUT <<"SKEL";
=item C<$type $func($params)>

$doc

NOT IMPLEMENTED.

=cut

.sub '$func'
    not_implemented()
.end

SKEL
    }
    print $OUT <<"TRAILER";
=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
TRAILER
    close $OUT;
    my $nb = scalar @funcs2;
    print "$mod : $nb functions\n";
    $total += $nb;
}
print "Total : $total\n";

open my $STD, '>', 'php_standard.pir';
print $STD <<'HEADER';
# Copyright (C) 2008, The Perl Foundation.
# $Id$

.include 'languages/pipp/src/common/php_API.pir'

HEADER
foreach (sort keys %ext) {
    my $files = $ext{$_};
    if ($files->[0] =~ /standard|Zend/) {
        print $STD ".include 'languages/pipp/src/common/php_",$_,".pir'\n";
    }
}
    print $STD <<"TRAILER";

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
TRAILER
close $STD;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

#! perl -w

# Create Kate syntax highlighting XML file for IMCC
# Language:	Parrot IMCC
# Maintainer:	Andy Bussey <andybussey@yahoo.co.uk>
# Last change:	2003 Aug 19

my $parrot = $ARGV[0];

if ($parrot eq '-h') {
    print "kate_syntax.pl\n\n",
        "Create Kate syntax highlighting file for Parrot IMCC.\n",
        "Supply the path to your Parrot directory as the only\n",
        "argument. The XML file will be written to the standard\n",
        "output.\n\n";
    exit;
}

$parrot =~ s/\/$//;

my @imcc_oplike = qw(.sym .arg prototyped non_prototyped .class
    .endclass .param inc dec new defined addr global clone saveall
    restoreall);
my @imcc_spdirec = qw(.pcc_call .result .return .local .const .globalconst
    end goto if unless call branch jump jsr ret invoke invokecc throw 
    rethrow die_hard .emit .eom .sub .end .pcc_begin
    .pcc_end .pcc_sub .pcc_begin_return .pcc_end_return .pcc_begin_yield
    .pcc_end_yield .namespace .endnamespace .macro .include);
my @pod_start = qw(head[1-6] over back item for begin end pod);
my $pod_start_rx = join '|', @pod_start;
my @imcc_basic_types = qw(int float string);
my $parrot_pmcsh_file = "include/parrot/core_pmcs.h";
my $date = localtime(time);


opendir PARROT, "$parrot" or die "Supply Parrot directory as argument!";
my @ops_files = map { "$parrot/$_"} grep /\.ops$/, readdir PARROT;
closedir PARROT;


print <<END;
<?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE language SYSTEM "language.dtd">
 <!-- Created automatically by kate_syntax.pl  $date -->

<language name="IMCC" version="0.2" kateversion="2.0" section="Sources" extensions="*.imc;*.pasm" mimetype="">

  <highlighting>

    <list name="special_directives">
END

my %ops;
for my $dir (@imcc_spdirec) {
    $dir =~ s/\.//g;
    print "      <item>$dir</item>\n";
    $ops{$dir} = 1;
}

print <<END;
    </list>
    
    <list name="ops">
END

for my $ops_file (@ops_files) {
    open OPS, "<$ops_file" or die "Can't read $ops_file!";
    while (<OPS>) {
        next unless (/^(inline\s+)?op\s+([a-zA-Z]\w*)/);
        my $op = $2;
        $op =~ s/\.//g;
        next if ($ops{$op});
        print "      <item>$op</item>\n";
        $ops{$op} = 1;
    }
}

for my $op (@imcc_oplike) {
    $op =~ s/\.//g;
    next if ($ops{$op});
    print "      <item>$op</item>\n";
    $ops{$op} = 1;
}

print <<END;
    </list>

    <list name="types">
END

my %types;
for my $type (@imcc_basic_types) {
    $type =~ s/\./\&046;/g;
    next if ($types{$type});
    print "      <item>$type</item>\n";
    $types{$type} = 1;
}

open TYPES, "<$parrot/$parrot_pmcsh_file" or
  die "Can't read $parrot/$parrot_pmcsh_file!";
while (<TYPES>) {
    next unless (/^\s+enum_class_(\w+)\,/);
    my $type = $1;
    $type =~ s/\./\&046;/g;
    print "      <item>$type</item>\n";
    $types{$type} = 1;
}

print <<END;
    </list>

    <contexts>

      <context name="default" attribute="Normal Text" lineEndContext="#stay">
          <RegExpr attribute="Label" context="#stay" String="[_\\w]+\\:" />
          <keyword attribute="Op" context="#stay" String="ops" />
          <keyword attribute="Special Directive" context="#stay" String="special_directives" />
          <keyword attribute="Type" context="#stay" String="types" />
          <RegExpr attribute="Comment" context="#stay" String="#.*\$" />
          <RegExpr attribute="Comment" context="pod" String="^\\=($pod_start_rx).*" />
          <HlCOct attribute="Octal" context="#stay" />
          <HlCHex attribute="Hex" context="#stay" />
          <Float attribute="Float" context="#stay" />
          <Int attribute="Int" context="#stay" />
END

print <<END;
          <RegExpr attribute="Register" context="#stay" String="[INSP](\\d|[12]\\d|3[01])" />
          <RegExpr attribute="TempRegister" context="#stay" String="\\\$[INSP]\\d+" />
          <RegExpr attribute="String" context="string" String="'" />
          <RegExpr attribute="String Interp" context="string_interp" String="&quot;" />
          <RegExpr attribute="Identifier" context="#stay" String="[a-zA-Z_][\\w_]*" />
      </context>

END

print <<END;
      <context name="pod" attribute="Comment" lineEndContext="#stay">
          <LineContinue attribute="Comment" context="#stay" />
          <RegExpr attribute="Comment" context="#stay" String="[^\=]*" />
          <RegExpr attribute="Comment" context="#pop" String="^\\=cut\\s*\$" />
      </context>

END

print <<END;
      <context name="string" attribute="String" lineEndContext="#pop">
          <RegExpr attribute="String" context="#stay" String="'" />
      </context>

END

print <<END;
      <context name="string_interp" attribute="String Interp" lineEndContext="#pop">
          <HlCStringChar attribute="SpChar" context="#stay" />
          <RegExpr attribute="String Interp" context="#pop" String="&quot;" />
      </context>

    </contexts>

END

print <<END;
    <itemDatas>
      <itemData name="Normal Text" defStyleNum="dsNormal" />
      <itemData name="Op" defStyleNum="dsNormal" color="#000080" selColor="#ffffff" bold="0" italic="0" />
      <itemData name="Special Directive" defStyleNum="dsKeyword" />
      <itemData name="Type" defStyleNum="dsDataType" />
      <itemData name="Comment" defStyleNum="dsComment" />
      <itemData name="Octal" defStyleNum="dsBaseN" />
      <itemData name="Hex" defStyleNum="dsBaseN" />
      <itemData name="Float" defStyleNum="dsFloat" />
      <itemData name="Int" defStyleNum="dsDecVal" />
      <itemData name="Label" defStyleNum="dsKeyword" />
      <itemData name="Register" defStyleNum="dsDecVal" />
      <itemData name="TempRegister" defStyleNum="dsDecVal" />
      <itemData name="String" defStyleNum="dsString" color="#FF6C6C" selColor="#FF6C6C" bold="0" italic="0" />
      <itemData name="String Interp" defStyleNum="dsString" />
      <itemData name="Identifier" defStyleNum="dsDataType" color="#C00000" selColor="#C00000" bold="0" italic="0" />
      <itemData name="SpChar" defStyleNum="dsChar" />
    </itemDatas>

  </highlighting>

END

print <<END;
  <general>

    <comments>
      <comment name="singleLine" start="#" />
    </comments>

    <keywords casesensitive="1" />

  </general>

</language>

END

my %translate = (
       "\r" => "\n",
   chr(128) => q{A},
   chr(129) => q{A},
   chr(130) => q{C},
   chr(131) => q{E},
   chr(132) => q{N},
   chr(133) => q{O},
   chr(176) => q{[inf]},
   chr(177) => q{[+-]},
   chr(178) => q{<=},
   chr(179) => q{>=},
   chr(180) => q{[JPY]},
   chr(249) => q{},
   chr(250) => q{},
   chr(251) => q{},
   chr(252) => q{},
   chr(253) => q{},
   chr(254) => q{},
   chr(255) => q{},
);

while (<>) {
# XXX: s///
#    s{(.)}
#     { defined %translate{$1}
#            ?? %translate{$1}
#            :: $1
#     }ges;
    print;
}

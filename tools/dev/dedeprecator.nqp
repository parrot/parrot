#!/usr/bin/env parrot-nqp

# Copyright (C) 2011-2012, Parrot Foundation.

=begin README
dedepracator: find deprecations in your Parrot code

This script, fed with a yaml file with Parrot deprecations
(you probably want it to be Parrot's api.yaml), will scan your code
for a deprecations and warn you about them.

Usage:

# scan the current directory for deprecations
$ dedeprecator.nqp

# scan test.pir for deprecations, using api.yaml
$ dedeprecator.nqp test.pir

# scan bar.pir and baz.pir using the alternate api.yaml file
$ dedeprecator.nqp --apiyaml /somewhere/else/foo.yaml bar.pir baz.pir

# in case you forgot everything
$ dedeprecator.nqp -h
# or
$ dedeprecator.nqp --help
=end README

INIT {
    pir::load_bytecode("YAML/Tiny.pbc");
}

sub check_pir($file, @regexes) {
    my @deprecations;

    my $fh := pir::new('FileHandle');
    $fh.open($file);
    $fh.encoding('utf8');
    my $line := 1;
    while $fh.readline -> $l {
        for @regexes -> $regex {
            my $r := $regex[0];
            if $l ~~ / $r / {
                @deprecations.push("$file:$line: { $regex[2] }");
            }
        }
        $line++;
    }
    $fh.close;

    return @deprecations;
}

MAIN(pir::getinterp()[2]);
sub MAIN(@ARGS) {
    my $name := @ARGS.shift;
    my @files;
    my $apiyaml := 'api.yaml';
# getopt
    my $arg;
    while pir::elements(@ARGS) {
        $arg := @ARGS.shift;
        if $arg eq '--help' || $arg eq '-h' {
            USAGE($name);
        } elsif $arg eq '--apiyaml' {
            unless pir::elements(@ARGS) {
                say("--apiyaml requires an argument");
                USAGE($name);
            }
            $apiyaml := @ARGS.shift;
        } else {
            @files.push($arg);
        }
    }
# prepare the regexes
    my $parser := YAML::Tiny.new;
    my $api;
    try {
        $api := $parser.read_string(slurp($apiyaml));
        CATCH {
            say("Failed parsing '$apiyaml'\n"
                ~ "Make sure that it exists and is a valid YAML");
            pir::exit(1);
        }
    }
    my @regs_pir;
    for $api[0] {
        if $_<detection> && $_<detection><regex> {
           if $_<detection><regex><pir> {
               my $r := $_<detection><regex><pir>;
                @regs_pir.push(
                    [Regex::P6Regex::Compiler.compile($r), $r, $_<name>]
                );
           }
        }
    }
# if no files are given, find all files in the current directory,
# recursively
    unless pir::elements(@files) {
        my $os := pir::new('OS');
        my @candidates := $os.readdir('.');
        while pir::elements(@candidates) {
            my $file := @candidates.shift;
            # this probably can be written better
            next if $file ~~ /[^ '.' $] | [^ '..' $]
                              | ['/..' $] | ['/.' $]/;
            @files.push($file);
            try { # try is isdir said funny
                for $os.readdir($file) {
                    @candidates.push("$file/$_");
                }
            }
        }
    }
# check the given files
    for @files -> $f {
        if $f ~~ / '.pir' $ / {
            my @d;
            try {
                @d := check_pir($f, @regs_pir);
                CATCH {
                    say("Failed checking $f: $!");
                }
            }
            if pir::elements(@d) {
                say(@d.join("\n"));
            }
        }
    }
}

sub USAGE($name) {
    say("Usage: $name [--apiyaml <api.yaml file>] [<files to check>]");
    pir::exit(1);
}

# vim: ft=perl6

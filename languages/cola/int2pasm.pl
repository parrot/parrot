#!/usr/bin/perl
#
# Cola compiler for Parrot
#
# Copyright (C) 2002 Melvin Smith
#
# int2pasm.pl
#
# Really simple script to translate "3 address" code emitted by Cola
# compiler into Parrot assember.
#
# Does limited register recycling but doesn't check for reg spilling
# so for now, any method or expression that uses more than the
# available registers would blow up. With 32 registers and the limited
# reg recycling this should work for most small scale code.

use strict;

my @SREGS = (0..31);
my @IREGS = (0..31);
my @NREGS = (0..31);
my @PREGS = (0..31);

my %regmap = (
    'S' => \@SREGS,
    'I' => \@IREGS,
    'N' => \@NREGS,
    'P' => \@PREGS,
    'string' => \@SREGS,
    'int' => \@IREGS,
    'float' => \@NREGS,
    'pmc' => \@PREGS
);

my %regtypemap = (
    'string' => 'S',
    'int' => 'I',
    'float' => 'N',
    'pmc' => 'P'
);

my @regs_avail = ();
my %regs = ();
my $reg;
my $readsyms = 0;

my %i_ops = (
    '+'    =>    'add',
    '-'    =>    'sub',
    '/'    =>    'div',
    '*'    =>    'mul',
    '%'    =>    'mod',
    'arg'    =>    'save',
    'push'    =>    'save',
    'pop'    =>    'restore_i',
);

my %n_ops = (
    '+'    =>    'add',
    '-'    =>    'sub',
    '/'    =>    'div',
    '*'    =>    'mul',
    '%'    =>    'mod',
    'arg'    =>    'save',
    'push'    =>    'save',
    'pop'    =>    'restore_i',
);

my %s_ops = (
    '+'    =>    'concat',
    'arg'    =>    'save',
    'push'    =>    'save',
    'pop'    =>    'restore_s',
    '[]'    =>    'substr'
);

my %rel_ops = (
    '=='    =>    'eq',
    '!='    =>    'ne',
    '>'        =>    'gt',
    '<'        =>    'lt',
    '>='    =>    'ge',
    '<='    =>    'le'
);

# Pull register off array with pop
sub reset_reg_tracker {
    @SREGS = (0..31);
    @IREGS = (0..31);
    @NREGS = (0..31);
    @PREGS = (0..31);
    %regs = ();
}

sub alloc_reg {
    my $type = shift;
    my $name = shift;
    if(length $type > 0) {
        my $ttype = $type;
        $type = $regtypemap{$type};
        if(!defined $type) {
            #print "No register type mapping for $ttype\n";

            #!!!!! Temporary hack, map unknown types to PMC
            #until translator can read Symbol table emitted
            #by compiler.
            $type = 'P'; 
        }
    }
    if($regs{$name}) {
        return $regs{$name};
    }
    
    my $stack = $regmap{$type};
    if(defined $stack) {
        my $reg = pop @$stack;
        if(!defined $reg) {
            warn "Oops: No more $type registers\n";
            return undef;
        }
        #print "#Allocing reg $type$reg\n";
        return "$type$reg";
    } else {
        die "No register type [$type]\n";
    }
}

sub free_reg {
    my $reg = shift;
    my $type = substr($reg, 0, 1);
    my $stack = $regmap{$type};
    if(defined $stack) {
        #print "#Freeing reg type [$type] ($reg)\n";
        $reg = substr($reg, 1);
        if($reg >= 0 && $reg <= 31) {
            push @$stack, $reg;
        } else {
            die "Invalid '$type' register #$reg\n";
        }
    } else {
        die "Attempt to free invalid register type [$type]\n";
    }
}

##
sub is_rval {
    my $var = shift;
    if($var =~ /^\$R/) {
        return 1;
    }
    return 0;    
}

sub reg_assign {
    my $lexical = shift;
    my $type = shift;
    #print "reg_assign($lexical,$type)\n";
    # Literal
    if($lexical =~ /^(\d|[.+-]|\"|\')/) {return $lexical;}

    # Map symbolic to Parrot reg
    # For now temporary symbolics are treated
    # as named vars.
    if($regs{$lexical}) {
        return $regs{$lexical};
    }

    if($lexical =~ /^\$([RL])(\d+)/) {
        #!!! HACK - Assign PMC regs to unknown types for now
    #    if($type =~ /^(i32|f32|str)/) {
        {
            my $r = &alloc_reg($type);
            $regs{$lexical} = $r;
            return $r;
        }
        die "Don't know how to assign register to type $type\n";
    }

    die("Use of undeclared lexical [$lexical]");
}

# Look for symbol table tag
while(<>) {
    if(/^<symbols>/) {
        &read_symbols();
    }
    elsif(/^<program>/) {
        &read_program();
    }
}

sub read_program {
    my $label;
    while(<>) {
        s/^\s*//;
        s/\s*$//;
        last if(/^<\/program>/);
    
        my ($line) = $_;
        $label = '';

        print STDERR ">>$line\n";

        # Allow "here document" syntax to emit straight
        # Parrot code without symbolic registers.
        if($line =~ /^emit<<EOF$/) {
            while($line = <>) {
                last if($line =~ /^EOF\s*$/);
                print $line;
            }
            next;
        }
    
        # Pull of optional label and emit
        if($line =~ /(^\w+:)\s*(.*)$/) {
            $line = $2;
            print "$1\n";
            next if($line eq '');
        }

        if($line =~ /^#/ || $line eq '') {
            print "\t$line\n"; next;
        }

        # Trim trailing comments
        $line = &trim_comment($line);

        # .directives
        if($line =~ /^\.(.*)/) {
            &directive($1);
            next;
        }

        # Standard assignment with unary or binary expression    
        #if( $line =~ /^(\S+)\s+=\s+(.+)/ ) {
        if($line =~ /^(\S+?)\s+=\s+(.+)/) {
            &assign_expr($1, $2);
            next;
        }

        if($line =~ /^if (\S+) ([=!<>]{1,2}) (\"[^"\n]*["\n]|\S+) goto (\S+)/) {
            my $op = rel_op_to_parrot($2);
            if($op ne '') {
                my $branch = $4;
                my ($arg1, $arg2) = (&reg_assign($1), &reg_assign($3));
                print "\t$op $arg1, $arg2, $branch\n";
                if(&is_rval($1)) { &free_reg($arg1); }
                if(&is_rval($3)) { &free_reg($arg2); }
                next;
            }
            die("int2pasm: Invalid if statement\n");
        }    

        if($line =~ /^goto (.+)/) {
            print "\tbranch $1\n";
            next;
        }
        
        if($line =~ /^(dec|inc) (.+)/) {
            my $arg = &reg_assign($2);
            print "\t$1 $arg\n";    next;
        }
    
        # Get arg off local stack
        if($line =~ /^pop (.+)$/) {
            my $rest = $1;
            my $reg;
            my ($type, $name) = $rest =~ /(\S+)\s+(\S+)/;
            if($name =~ /^(\d|[.]|\"|\')/) { $reg = $name; }
            else {
                #$regs{$name} = &alloc_reg($type);
                #$reg = $regs{$name};
                $reg = &reg_assign($name, $type);
            }
            print "\trestore $reg\n";    next;
        }
    
        # Save arg on local stack
        if($line =~ /^push (.+)/) {
            my $rest = $1;
            my $reg;
            my ($type, $name) = $rest =~ /(\S+)\s+(\S+)/;
            if($name =~ /^(\d|[.]|\"|\')/) { $reg = $name; }
            else {
                #$regs{$name} = &alloc_reg($type);
                #$reg = $regs{$name};
                $reg = &reg_assign($name, $type);
            }
            print "\tsave $reg\n";    next;
        }
    
        # Save arg on argument stack
        if($line =~ /^pusharg (.+)/) {
            my $arg = &reg_assign($1);
            print "\tsave $arg\n";
            next;
        }
    
        # Get arg off argument stack
        if($line =~ /^shift (.+)/) {
            my $arg = &reg_assign($1);
            print "\trestore $arg\n";
            next;
        }

        if($line =~ /call (.*)/) {
            print "\tbsr $1\n";
            next;
        }
    
        if($line =~ /ret\b/) {
            print "\tpopn\n\tpops\n\tpopi\n\tret\n";
            next;
        }
    
        if($line =~ /end\b/) {
            print "\tend\n";
            next;
        }

        die("int2pasm.pl: Don't understand line:\n[$line] ");
    }

    print STDERR "int2pasm finished successfully.\n";
}

sub directive {
    my $line = shift;
    my ($dir, $rest) = $line =~ /(\w+)(.*)/;
    if( $dir eq 'local' ) {
        my ($type, $name) = $rest =~ /(\w+)\s+(\w+)/;
        $regs{$name} = &alloc_reg($type);
        #print "\t#directive [local,$type,$name]\n";
    }
    elsif( $dir eq 'param' ) {
        my ($type, $name) = $rest =~ /(\w+)\s+(\w+)/;
        my $reg;
        $reg = &alloc_reg($type);
        $regs{$name} = $reg;
        #print "\t#directive [param,$type,$name]\n";
        print "\trestore $reg\n";
    }
    elsif( $dir eq 'sub' ) {
        my ($name) = $rest =~ /(\w+)/;
        &reset_reg_tracker();
        #$ireg = 0;
        #$sreg = 0;
        #$nreg = 0;
        print "$name:\tpushi\n\tpushs\n\tpushn\n";
    }
    elsif( $dir =~ /^(class|namespace)/ ) {
        # Ignored for now
    }
}

# Intermediate assignments can either have registers, identifiers,
# member accesses or element access.
# An assignment may not have member or element access on both sides
# of a single statement, the compiler should emit a temporary in
# between. This is typical of most architectures, you can't move
# from indirect to indirect address (I think).
sub assign_expr {
    my $left = shift;
    my $right = shift;
    my $type;
    my $op;
    my $offset;
    
    if( $left =~ /^\((\w+)\)(.*)$/ ) {
        $left = $2;
        $type = $1;
    }
    else {
        warn("# Error: assign_expr: No type for lvalue");
        $type = 'i32';
    }

    my $targ;
        
    # Check to see if target is indirection
    # Only strings are supported for now, hence the
    # hard-coded hackfu.
    if( $left =~ m{(\$?\w+)(\[\])(\$?\w+)} ) {
        $targ = &reg_assign($1, $type);
        $offset = &reg_assign($3, 'i32');
           my $saverval = $3;
        $op = &op_to_parrot($targ, $2);
        if( $right =~ /^(\S+|"[^"\n]*["\n])/ ) {
            my $src = &reg_assign($1, $type);
            print "\t$op $targ, $offset, 1, $src\n";
            #if(&is_rval($saverval)) { &free_reg($offset); }
            if(&is_rval($1)) { &free_reg($src); }
            return;
        }
        die "Invalid expression on right hand of assignment to indirect address\n ";
    }
    
    $targ = &reg_assign($left, $type);

    # Binary op
    # Free registers allocated for rvalues used on right
    # hand of assignments. This is a simple little technique
    # which is easier than doing correct register allocation
    # via graph coloring.
    # FIXME: This regex has outlived its usefulness!
    if( $right =~ m{^("[^"\n]*["\n]|[^"]+)\s+([-+*/%])\s+("[^"\n"]*["\n]|[^"]+)} ) {
        my ($arg2, $arg3) = (&reg_assign($1, $type), &reg_assign($3, $type));
        $op = &op_to_parrot($targ, $2);
        print "\t$op $targ, $arg2, $arg3\n";
        if(&is_rval($1)) { &free_reg($arg2); }
        if(&is_rval($3)) { &free_reg($arg3); }
    }
    elsif( $right =~ m{(\$?\w+)(\[\])(\$?\w+)} ) {
        my ($arg2, $arg3) = (&reg_assign($1, $type), &reg_assign($3, $type));
        $op = &op_to_parrot($targ, $2);
        if($op eq 'substr') {
            print "\t$op $targ, $arg2, $arg3, 1\n";
        }
        else {
            print "\t$op $targ, $arg2, $arg3\n";
        }
        if(&is_rval($1)) { &free_reg($arg2); }
        if(&is_rval($3)) { &free_reg($arg3); }
    }
    elsif( $right =~ /new\s+(\w+)/ ) {
        # All aggregate types map to a generic Parrot type for now
        my $native_type = 'PerlString';
        print "\tnew $targ, $native_type\n";
        # Set typeid of the Parrot structure to the high level
        # language type.
        #set_type_name $targ, $type
    }
    else {
        # Simple assign
        #print STDERR "#simple assignment\n";
        $reg = &reg_assign($right, $type);
        print "\tset $targ, $reg\n";
        if(&is_rval($right)) {
            &free_reg($reg);
        }
    }
}

sub op_to_parrot {
    my $targ = shift;
    my $op = shift;
    if($targ =~ /^I/i) {
        $op = $i_ops{$op};
    }
    elsif($targ =~ /^S/i) {
        $op = $s_ops{$op};
    }
    elsif($targ =~ /^N/i) {
        $op = $n_ops{$op};
    }

    if(!defined $op) {
        die("Unknown intermediate op $_[0]");
    }
    return $op;
}

sub rel_op_to_parrot {
    my $oldop = shift;
    my $op = $rel_ops{$oldop};

    if(!defined $op) {
        die("Unknown relational op $oldop");
    }
    return $op;
}

# Very simple, doesn't work right for all cases 
# such as quotes in the comment string
sub trim_comment {
    $_[0] =~ s/#[^'"]*?$//;
    return $_[0];    
}

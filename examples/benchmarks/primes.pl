#!/usr/bin/perl
my $i1 = 1;
my $i2 = 50000;
my $i3;
my $i4;
my $i5;
my $i6 = 0;
my $i7;
printf("N primes up to ");
printf("%d", $i2);
printf(" is: ");

 REDO:
    $i3 = 2;
$i4 = $i1 / 2;
 LOOP:
    $i5 = $i1 % $i3;
  if ($i5) {goto OK;}
  goto NEXT;
 OK:
  $i3++;
  if ($i3 <= $i4) {goto LOOP;}
     $i6++;
     $i7 = $i1;
 NEXT:
  $i1++;
  if ($i1 <= $i2) {goto REDO;}
  print $i6, "\nlast is: $i7\n"



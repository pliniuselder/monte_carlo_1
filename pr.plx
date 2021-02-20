#!/usr/bin/perl
use warnings;
use strict;

if (@ARGV < 1) {
    print "no arguments (input format 'height temp y'). exit\n";
    exit;
} elsif (@ARGV > 3) {
    print "programm accept no more then three arguments (input format 'height temp y'). exit\n";
    exit;
}

my ($h, $t, $y) = @ARGV;
my $p;
my $ro;
my $a;
my $b;

$h /= 10000;
$p = 1013 - 366.0833*$h + 54.29166*$h**2 - 4.417*$h**3 + 0.20833*$h**4;
$p /= 1.3332;
$t += 273.15;
$ro = ($p/$t) * 0.0473;
$ro /= 0.12475;
$a = sqrt($ro);
$b = (((1 - ($p/760)) * $a) / 12168) / $t;

my $error = 0.00000000001;
my $_y = 0;
my $x = rand($y);
while (abs($y - $_y) > $error) {
    $_y = $a * $x + $b * $x**3;
    last if abs($y - $_y) < $error;
    if ($_y > $y) {
	$x = $x - rand($x - $x*($y/$_y));
    } else {
	$x = $x + rand($x - $x*($_y/$y));
    }
}
print "height = $ARGV[0]\ttmp = $ARGV[1]\ty = $ARGV[2]\n";
print "\tp = $p\n\tro = $ro\n\ta = $a\n\tb = $b\n\tx = $x\n";

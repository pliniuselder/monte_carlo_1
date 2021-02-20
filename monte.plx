#!/usr/bin/perl
use warnings;
use strict;

if (@ARGV < 1) {
    print "no arguments (input format 'y a b'). exit\n";
    exit;
} elsif (@ARGV > 3) {
    print "programm accept no more then three arguments (input format 'y a b'). exit\n";
    exit;
}

my ($y, $a, $b) = @ARGV;
print "y = $y, a = $a, b = $b\ny = a*x + b*x^3\nx = ?\n";
my $i = 0;
my $error = 0.00000000001;
my $_y = 0;
my $x = rand($y);
while (abs($y - $_y) > $error) {
    $i++;
    $_y = $a * $x + $b * $x**3;
    last if abs($y - $_y) < $error;
    if ($_y > $y) {
	#$x = $x - rand($x);
	#$x = $x - rand($x*($y/$_y));
	$x = $x - rand($x - $x*($y/$_y));
    } else {
	#$x = $x + rand($x);
	#$x = $x + rand($x*($_y/$y));
	$x = $x + rand($x - $x*($_y/$y));
    }
}
print "$i: _y = $_y\tx = $x\n";
print "y = " . ($a * $x + $b * $x**3) ."\n"


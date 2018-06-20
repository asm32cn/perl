#!/usr/bin/env perl
# perl-radix-sort-demo-1.pl

use constant dn => 3;
use constant k => 10;
@C = (0) * k;
@radix = (1, 1, 10, 100);


Main();

sub Main{
	# @data = (41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36);
	@data = (76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82);

	DisplayData(@data);
	LsdRadixSort(@data);
	DisplayData(@data);
}

sub DisplayData{
	print join(', ', @_) . "\n";
}

sub LsdRadixSort{
	@data = @_;
	my $n = @data;
	for($d = 1; $d < dn; $d++){
		CountingSort($n, $d, @data);
	}
}

sub CountingSort{
	(my $n, my $d, @data) = @_;
	$n = @data;

	for($i = 0; $i < k; $i++){
		$C[$i] = 0;
	}
	for($i = 0; $i < $n; $i++){
		$C[GetDigit($data[$i], $d)]++;
	}
	for($i = 1; $i < k; $i++){
		$C[$i] += $C[$i - 1];
	}
	@B = (0) * $n;
	for($i = $n - 1; $i >= 0; $i--){
		my $digit = GetDigit(@data[$i], $d);
		$B[--$C[$digit]] = $data[$i];
	}
	for($i = 0; $i < $n; $i++){
		$data[$i] = $B[$i];
	}
}

sub GetDigit{
	my($x, $d) = @_;
	# return int($x / $radix[$d]) % 10;
	int($x / $radix[$d]) % 10;
}
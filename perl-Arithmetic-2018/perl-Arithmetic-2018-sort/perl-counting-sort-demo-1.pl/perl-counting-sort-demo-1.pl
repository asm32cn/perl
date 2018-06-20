#!/usr/bin/env perl
# perl-counting-sort-demo-1.pl

use constant k => 100;
@C = (0) * k;

Main();

sub Main{
	# @data = (41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36);
	@data = (76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82);

	DisplayData(@data);
	CountingSort(@data);
	DisplayData(@data);
}

sub DisplayData{
	print join(', ', @_)."\n";
}

sub CountingSort{
	@data = @_;
	$n = @data;
	for($i = 0; $i < k; $i++){
		$C[$i] = 0;
	}
	for($i = 0; $i < $n; $i++){
		$C[$data[$i]]++;
	}
	for($i = 1; $i < k; $i++){
		$C[$i] += $C[$i - 1];
	}
	@B = (0) * $n;
	for($i = $n - 1; $i >= 0; $i--){
		$B[--$C[$data[$i]]] = $data[$i];
	}
	for($i = 0; $i < $n; $i++){
		$data[$i] = $B[$i];
	}
}
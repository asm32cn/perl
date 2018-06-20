#!/usr/bin/env perl
# perl-bubblesort-demo-1.pl

Main();

sub Main{
	# @data = (41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36);
	@data = (76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82);

	DisplayData(@data);
	BubbleSort(@data);
	DisplayData(@data);
}

sub DisplayData{
	print join(', ', @data)."\n";
}

sub BubbleSort{
	@data = @_;
	$n = @data;
	for($j = 0; $j < $n - 1; $j++){
		for($i = 0; $i < $n - 1 - $j; $i++){
			if($data[$i] > $data[$i + 1]){
				($data[$i], $data[$i + 1]) = ($data[$i + 1], $data[$i]);
			}
		}
	}
}
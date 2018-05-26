#!/usr/bin/env perl
# perl-selectionsort-demo-1.pl

Main();

sub Main{
	# @data = (41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36);
	@data = (76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82);

	DisplayData(@data);
	SelectionSort(@data);
	DisplayData(@data);
}

sub DisplayData{
	print join(', ', @_) . "\n";
}

sub SelectionSort{
	@data = @_;
	my $n = @data;
	for($i = 0; $i < $n - 1; $i++){
		my $nGet = $i;
		for($j = $i + 1; $j < $n; $j++){
			if($data[$j] < $data[$nMin]){
				$nMin = $j;
			}
		}
		if($nMin != $i){
			($data[$nMin], $data[$i]) = ($data[$i], $data[$nMin]);
		}
	}
}
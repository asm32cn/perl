#!/usr/bin/env perl
# perl-cocktailsort-demo-1.pl

Main();

sub Main{
	# @data = (41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36);
	@data = (76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82);

	DisplayData(@data);
	CocktailSort(@data);
	DisplayData(@data);
}

sub DisplayData{
	print join(', ', @_)."\n";
}

sub CocktailSort{
	@data = @_;
	$nLeft = 0;
	$nRight = @data - 1;
	while($nLeft < $nRight){
		for($i = $nLeft; $i < $nRight; $i++){
			if($data[$i] > $data[$i + 1]){
				($data[$i], $data[$i + 1]) = ($data[$i + 1], $data[$i]);
			}
		}
		$nRight--;
		for($i = $nRight; $i > $nLeft; $i--){
			if($data[$i - 1] > $data[$i]){
				($data[$i - 1], $data[$i]) = ($data[$i], $data[$i - 1]);
			}
		}
		$nLeft++;
	}
}
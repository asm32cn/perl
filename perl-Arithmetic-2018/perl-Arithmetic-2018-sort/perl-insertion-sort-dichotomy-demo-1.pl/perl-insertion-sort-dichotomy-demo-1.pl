#!/usr/bin/env perl
# perl-insertion-sort-dichotomy-demo-1.pl

Main();

sub Main{
	# @data = (41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36);
	@data = (76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82);

	DisplayData(@data);
	InsertionSortDichotomy(@data);
	DisplayData(@data);
}

sub DisplayData{
	print join(', ', @_)."\n";
}

sub InsertionSortDichotomy{
	@data = @_;
	$n = @data;
	for($i = 1; $i < $n; $i++){
		$nGet = $data[$i];
		$nLeft = 0;
		$nRight = $i - 1;
		while($nLeft <= $nRight){
			$nMid = int(($nLeft + $nRight) / 2);
			if($data[$nMid] > $nGet){
				$nRight = $nMid - 1;
			}else{
				$nLeft = $nMid + 1;
			}
		}
		for($j = $i - 1; $j >= $nLeft; $j--){
			$data[$j + 1] = $data[$j];
		}
		$data[$nLeft] = $nGet;
	}
}
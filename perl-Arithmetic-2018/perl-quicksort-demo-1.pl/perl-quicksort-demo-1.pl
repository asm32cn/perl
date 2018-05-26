#!/usr/bin/env perl
# perl-quicksort-demo-1.pl

Main();

sub Main{
	# @data = (41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36);
	@data = (76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82);

	DisplayData(@data);
	QuickSort(0, @data - 1, @data);
	DisplayData(@data);
}

sub DisplayData{
	print join(', ', @_) . "\n";
}

sub QuickSort{
	(my $nLeft, my $nRight, @data) = @_;
	if($nLeft < $nRight){
		my $nKey = $data[$nLeft];
		my $nLow = $nLeft;
		my $nHigh = $nRight;
		while($nLow < $nHigh){
			while($nLow < $nHigh && $data[$nHigh] >= $nKey){
				$nHigh--;
			}
			$data[$nLow] = $data[$nHigh];
			while($nLow < $nHigh && $data[$nLow] <= $nKey){
				$nLow++;
			}
			$data[$nHigh] = $data[$nLow];
		}
		$data[$nLow] = $nKey;

		QuickSort($nLeft, $nLow - 1, @data);
		QuickSort($nLow + 1, $nRight, @data);
	}
}

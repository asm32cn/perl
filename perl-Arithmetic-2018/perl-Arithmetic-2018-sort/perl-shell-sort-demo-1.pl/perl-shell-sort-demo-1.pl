#!/usr/bin/env perl
# perl-shell-sort-demo-1.pl

Main();

sub Main{
	# @data = (41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36);
	@data = (76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82);

	DisplayData(@data);
	ShellSort(@data);
	DisplayData(@data);
}

sub DisplayData{
	print join(', ', @_) . "\n";
}

sub ShellSort{
	@data = @_;
	my $n = @data;
	my $h = 0;
	while($h <= $n){
		$h = 3 * $h + 1;
	}
	while($h >= 1){
		for($i = $h; $i < $n; $i++){
			my $j = $i - $h;
			my $nGet = $data[$i];
			while($j >= 0 && $data[$j] > $nGet){
				$data[$j + $h] = $data[$j];
				$j -= $h;
			}
			$data[$j + $h] = $nGet;
		}
		$h = int( ($h - 1) / 3 );
	}
}
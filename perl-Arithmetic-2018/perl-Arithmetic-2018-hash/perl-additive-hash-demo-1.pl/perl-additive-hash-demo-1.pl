#!/usr/bin/perl
# perl-additive-hash-demo-1.pl

Main();

sub Main{
	my @A_strKeys = ('C', 'C++', 'Java', 'C#', 'Python', 'Go', 'Scala', 'vb.net', 'JavaScript', 'PHP', 'Perl', 'Ruby');
	my $n = @A_strKeys;

	for(my $i = 0; $i < $n; $i++){
		printf("%-10d %-15s %3d\n", $i, $A_strKeys[$i], AdditiveHash($A_strKeys[$i], 31));
	}
	print 'Done.'."\n";
}

sub AdditiveHash{
	my ($s, $nPrime) = @_;
	my $n = length($s), $nHash = $n;

	# print $s. ' ' . $n . ' ' . $nPrime . "\n";
	for(my $i = 0; $i < $n; $i++){
		my $ch = substr($s, $i, 1);
		# print $ch . ' ' . ord($ch) . "\n";
		$nHash += ord($ch);
	}
	$nHash % $nPrime;
}
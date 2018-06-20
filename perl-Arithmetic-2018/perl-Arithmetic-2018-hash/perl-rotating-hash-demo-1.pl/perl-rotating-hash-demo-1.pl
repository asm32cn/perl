#!/usr/bin/perl
# perl-rotating-hash-demo-1.pl

Main();

sub Main{
	my @A_strKeys = ('C', 'C++', 'Java', 'C#', 'Python', 'Go', 'Scala', 'vb.net', 'JavaScript', 'PHP', 'Perl', 'Ruby');
	my $n = @A_strKeys;

	for(my $i = 0; $i < $n; $i++){
		printf("%-10d %-15s %3d\n", $i, $A_strKeys[$i], RotatingHash($A_strKeys[$i], 31));
	}
}

sub RotatingHash{
	my ($strKey, $nPrime) = @_;
	my $n = length($strKey);
	my $nHash = $n;
	for(my $i = 0; $i < $n; $i++){
		$nHash = ($nHash << 4 >> 28) ^ ord(substr($strKey, $i, 1));
	}
	$nHash % $nPrime;
}

=result
0          C                 5
1          C++              12
2          Java              4
3          C#                4
4          Python           17
5          Go               18
6          Scala             4
7          vb.net           23
8          JavaScript       23
9          PHP              18
10         Perl             15
11         Ruby             28
=cut

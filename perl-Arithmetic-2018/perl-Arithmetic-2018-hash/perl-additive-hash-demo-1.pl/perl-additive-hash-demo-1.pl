#!/usr/bin/perl
# perl-additive-hash-demo-1.pl

Main();

sub Main{
	my @A_strKeys = ('C', 'C++', 'Java', 'C#', 'Python', 'Go', 'Scala', 'vb.net', 'JavaScript', 'PHP', 'Perl', 'Ruby');
	my $n = @A_strKeys;

	for(my $i = 0; $i < $n; $i++){
		printf("%-10d %-15s %3d\n", $i, $A_strKeys[$i], AdditiveHash($A_strKeys[$i], 31));
	}
}

sub AdditiveHash{
	my ($s, $nPrime) = @_;
	my $n = length($s);
	my $nHash = $n;
	for(my $i = 0; $i < $n; $i++){
		$nHash += ord(substr($s, $i, 1));
	}
	$nHash % $nPrime;
}

=result
0          C                 6
1          C++               1
2          Java             18
3          C#               11
4          Python           28
5          Go               29
6          Scala            24
7          vb.net            6
8          JavaScript        2
9          PHP              18
10         Perl              4
11         Ruby             19
=cut

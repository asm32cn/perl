#!/usr/bin/env perl
# perl-merge-sort-demo-1.pl

Main();

sub Main{
	# @data1 = (41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36);
	@data2 = (76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82);

	@data = @data2;
	DisplayData(@data);
	MergeSortRecursion(0, @data - 1, @data);
	DisplayData(@data);

	print "\n";
	@data = @data2;
	DisplayData(@data);
	&MergeSortIteration(@data);
	DisplayData(@data);
}

sub DisplayData{
	print join(', ', @_)."\n";
}

sub Merge{
	(my $nLeft, my $nMid, my $nRight, @data) = @_;

	my $nLen = $nRight - $nLeft + 1;
	my @temp = (0) * $nLen;
	my $nIndex = 0;
	my $i = $nLeft;
	my $j = $nMid + 1;
	while($i <= $nMid && $j <= $nRight){
		$temp[$nIndex++] = $data[$i] <= $data[$j] ? $data[$i++] : $data[$j++];
	}
	while($i <= $nMid){
		$temp[$nIndex++] = $data[$i++];
	}
	while($j <= $nRight){
		$temp[$nIndex++] = $data[$j++];
	}
	for($k = 0; $k < $nLen; $k++){
		$data[$nLeft++] = $temp[$k];
	}
}

# 递归实现的归并排序(自顶向下)
sub MergeSortRecursion{
	(my $nLeft, my $nRight, @data) = @_;

	# 当待排序的序列长度为1时，递归开始回溯，进行merge操作
	if($nLeft == $nRight){ return; };

	my $nMid = int(($nLeft + $nRight) / 2);
	MergeSortRecursion($nLeft, $nMid, @data);
	MergeSortRecursion($nMid + 1, $nRight, @data);

	Merge($nLeft, $nMid, $nRight, @data);
}

# 非递归(迭代)实现的归并排序(自底向上)
sub MergeSortIteration{
	@data = @_;
	# 子数组索引，前一个为A[left ... mid]，后一个为A[mid + 1 ... right]
	# 子数组的大小i初始为1，没轮翻倍
	my $n = @data;
	for($i = 1; $i < $n; $i *= 2){
		my $nLeft = 0;
		# 后一个子数组存在(需要归并)
		while($nLeft + $i < $n){
			my $nMid = $nLeft + $i - 1;
			# 后一个子数组大小可能不够
			my $nRight = $nMid + $i < $n ? $nMid + $i : $n - 1;
			Merge($nLeft, $nMid, $nRight, @data);
			# 前一个子数组索引向后移动
			$nLeft = $nRight + 1;
		}
	}
}
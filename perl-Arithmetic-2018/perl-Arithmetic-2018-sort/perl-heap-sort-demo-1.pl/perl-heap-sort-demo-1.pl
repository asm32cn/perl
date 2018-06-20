#!/usr/bin/env perl
# perl-heap-sort-demo-1.pl

Main();

sub Main{
	# @data = (41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36);
	@data = (76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82);

	DisplayData(@data);
	HeapSort(@data);
	DisplayData(@data);
}

sub DisplayData{
	print join(', ', @_)."\n";
}

sub HeapSort{
	@data = @_;
	$nHeapSize = @data;
	# BuildHeap
	for($i = $nHeapSize / 2 - 1; $i >= 0; $i--){
		Heapify($i, $nHeapSize, @data);
	}
	# HeapSort
	while($nHeapSize > 1){
		$nHeapSize--;
		($data[0], $data[$nHeapSize]) = ($data[$nHeapSize], $data[0]);
		Heapify(0, $nHeapSize, @data);
	}
}

sub Heapify{
	($i, $nSize, @data) = @_;

	$nLeftChild = 2 * $i + 1;
	$nRightChild = 2 * $i + 2;
	$nMax = $i;
	if($nLeftChild < $nSize && $data[$nLeftChild] > $data[$nMax]){
		$nMax = $nLeftChild;
	}
	if($nRightChild < $nSize && $data[$nRightChild] > $data[$nMax]){
		$nMax = $nRightChild;
	}
	if($nMax != $i){
		($data[$i], $data[$nMax]) = ($data[$nMax], $data[$i]);
		Heapify($nMax, $nSize, @data);
	}
}
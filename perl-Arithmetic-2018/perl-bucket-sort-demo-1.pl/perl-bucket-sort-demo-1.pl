#!/usr/bin/env perl
# perl-bucket-sort-demo-1.pl

use constant MAX => 100;
use constant bn => 5;
$nFactor = int(MAX % bn ? MAX / bn + 1 : MAX / bn);
@C = (0) * bn;

Main();

sub Main{
    # @data = (41, 67, 34, 0, 69, 24, 78, 58, 62, 64, 5, 45, 81, 27, 61, 91, 95, 42, 27, 36);
    @data = (76, 11, 11, 43, 78, 35, 39, 27, 16, 55, 1, 41, 24, 19, 54, 7, 78, 69, 65, 82);

    DisplayData(@data);
    BucketSort(@data);
    DisplayData(@data);
}

sub DisplayData{
    print join(', ', @_)."\n";
}

sub BucketSort{
    @data = @_;
    $n = @data;

    CountingSort(@data);
    for($i = 0; $i < bn; $i++){
        $nLeft = $C[$i];
        $nRight = ($i == bn - 1 ? $ n - 1 : $C[$i + 1] - 1);
        if($nLeft < $nRight){
            InsertionSort($nLeft, $nRight, @data);
        }
    }

}

sub MapToBucket{
    $x = shift;
    # return $x / $nFactor;
    $x / $nFactor;
}

sub CountingSort{
    @data = @_;
    $n = @data;
    for($i = 0; $i < bn; $i++){
        $C[$i] = 0;
    }
    for($i = 0; $i < $n; $i++){
        $C[MapToBucket($data[$i])]++;
    }
    for($i = 1; $i < bn; $i++){
        $C[$i] += $C[$i - 1];
    }
    @B = (0) * $n;
    for($i = $n - 1; $i >= 0; $i--){
        $bi = MapToBucket($data[$i]);
        $B[--$C[$bi]] = $data[$i];
    }
    for($i = 0; $i < $n; $i++){
        $data[$i] = $B[$i];
    }
}

sub InsertionSort{
    ($nLeft, $nRight, @data) = @_;
    for($i = $nLeft + 1; $i <= $nRight; $i++){
        $nGet = $data[$i];
        $j = $i - 1;
        while($j >= $nLeft && $data[$j] > $nGet){
            $data[$j + 1] = $data[$j];
            $j--;
        }
        $data[$j + 1] = $nGet;
    }
}


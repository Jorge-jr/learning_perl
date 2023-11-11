use strict;
use warnings;


sub insertion_sort{
    my @sequence = @_;
    my $size = scalar(@sequence);

    for my $i (1..$size-1){
        my $target = $i;
        while ($sequence[$target] < $sequence[$target-1] and $target >= 1){
            ($sequence[$target], $sequence[$target-1]) = ($sequence[$target-1], $sequence[$target]);
            $target = $target - 1;
        }
    }
    return @sequence;
}


print insertion_sort(5, 3, -1, 3, 0, 14, 1);
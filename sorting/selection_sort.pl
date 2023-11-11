use strict;
use warnings;



sub selection_sort{
    my @sequence = @_;

    for my $i (0..$#sequence-1) {
        my $smallest = $i;
        for my $j ($i+1..$#sequence) {
            $smallest = $j if $sequence[$j] < $sequence[$smallest];
        }

        @sequence[$i, $smallest] = @sequence[$smallest, $i];
    }

    return @sequence;
}



print selection_sort(1, 3, -9, 0, 3, 12, 5);
use strict;
use warnings;

sub heapify {
    my ($sequence, $size, $index) = @_;
    my $left = $index * 2 + 1;
    my $right = $index * 2 + 2;
    my $largest = $index;

    if ($left < $size && $sequence->[$left] > $sequence->[$largest]) {
        $largest = $left;
    }

    if ($right < $size && $sequence->[$right] > $sequence->[$largest]) {
        $largest = $right;
    }

    if ($largest != $index) {
        ($sequence->[$largest], $sequence->[$index]) = ($sequence->[$index], $sequence->[$largest]);
        heapify($sequence, $size, $largest);
    }
}

sub heapsort {
    my @sequence = @_;
    my $size = scalar @sequence;

    # Turning the sequence into a max_heap
    for (my $i = int($size / 2) - 1; $i >= 0; $i--) {
        heapify(\@sequence, $size, $i);
    }

    # Sorting time! The max-heap's first element is certainly the largest, so it goes straight to the end.
    # Then, we heapify it again to keep it as a max-heap.
    # Each time we heapify, the largest element of the sub-tree goes to the first position.
    # So we just swap it with the last position of the sub-tree.
    # Repeat it until it's sorted.

    for (my $i = $size - 1; $i > 0; $i--) {
        ($sequence[0], $sequence[$i]) = ($sequence[$i], $sequence[0]);
        heapify(\@sequence, $i, 0);
    }

    return @sequence;
}

my @arr = (3, 7, 0, -4, 1, 55);
my @sorted = heapsort(@arr);

print "Sorted array: @sorted\n";

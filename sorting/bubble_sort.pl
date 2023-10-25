use warnings;
use strict;

sub bubble_sort{
    my @list = @_;

    for my $i (0..scalar(@list)-2){  #excluding the last index to prevent index error (@list[$j] > @list[$j+1]
        for my $j (0..scalar(@list)-$i-1){  # On each iterating ($i) the last positions gets its final value, so its not necessary verify it again
            if ($list[$j] > $list[$j+1]){
                ($list[$j + 1], $list[$j]) = ($list[$j], $list[$j + 1]);
            }
        }
    }
    return @list;
}


my @unsorted = (5, 1, 9, 3, -7, 6, 0);
my @sorted = bubble_sort(@unsorted);

print sort @unsorted == @sorted;
print "\n@sorted\n";
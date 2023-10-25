use warnings;
use strict;


sub quick_sort{

    my @list = @_;

    if (@list <= 1){  # base case
        return @list;
    }

    my $pivot = shift @list;
    my @bigger;
    my @smaller;

    foreach my $number (@list){

        if ($number >= $pivot) {
            push @bigger, $number;
        }else{
            push @smaller, $number;
        }
    }
    
    my @sorted_smaller = quick_sort(@smaller);
    my @sorted_bigger = quick_sort(@bigger);

    return (@sorted_smaller, $pivot, @sorted_bigger);

}


my @unsorted = (5, 1, 9, 3, -7, 6, 0);
my @sorted = quick_sort(@unsorted);

print sort @unsorted == @sorted;
print "\n@sorted\n";
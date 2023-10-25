use warnings;
use strict;
# Define a subroutine that accepts two array references.
sub merge {
    my ($array1_ref, $array2_ref) = @_;
    
    # Dereference the array references to get the actual arrays.
    my @array1 = @$array1_ref;
    my @array2 = @$array2_ref;
    
    # Create an empty array to accumulate the merged result.
    my @result;

    while (@array1 and @array2) {
        my $number = $array1[0] <= $array2[0] ? shift @array1 : shift @array2;
        push @result, $number;
    }

    # Append any remaining elements from both arrays.
    push @result, @array1, @array2;

    return @result;
}

sub merge_sort{
    my @array = @_;
    if (scalar(@array) == 1) {
        return @array;
    }
    my $size = scalar(@array); 
    my @half1 = merge_sort(@array[0..int($size / 2) - 1]);
    my @half2 = merge_sort(@array[int($size / 2)..$size - 1]);
    return merge(\@half1, \@half2);

}

# Define two arrays.
my @first_array = (-1, 3, 10);
my @second_array = (-5, 0, 9);
my @unsorted = (1,3,6,0,-9,7,5,1);

# Call the subroutine and pass the arrays by reference.
my @sorted = merge_sort(@unsorted);
print "@sorted\n";
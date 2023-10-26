#!/usr/bin/perl


use strict;
use warnings;
use Getopt::Long;
use Encode;

my $count_chars;
my $count_lines;
my $count_words;
my $count_bytes;

# Define command-line options
GetOptions(
    'c' => \$count_chars, # -c for character count
    'l' => \$count_lines, # -l for line count
    'w' => \$count_words,  # -w for word count
    'm' => \$count_bytes  # -m for byte count
);

my $filename = shift @ARGV; # Get the filename from the remaining arguments

my $line_count = 0;
my $word_count = 0;
my $char_count = 0;
my $byte_count = 0;  # Initialize byte count

if (open my $filehandle, '<:raw', $filename) {  # Open the file in binary mode
    while (my $line = <$filehandle>) {
        $line_count += 1;
        $word_count += scalar split(" ", $line);
        $char_count += length decode_utf8($line);  # Calculate character count
        $byte_count += length $line;  # Calculate byte count
    }
    close $filehandle;
} else {
    die "Failed to open the file: $!";
} 

if ($count_chars) {
    print "$char_count $filename\n";
} elsif ($count_lines) {
    print "$line_count $filename\n";
}elsif ($count_words) {
    print "$word_count $filename\n";
} elsif ($count_chars) {
    print "$char_count $filename\n";
} elsif ($count_bytes) {
    print "$byte_count $filename\n";
} else {
    print "$char_count $line_count $word_count $byte_count $filename\n";
}

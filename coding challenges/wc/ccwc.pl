#!/usr/bin/perl


use strict;
use warnings;
use Getopt::Long;

my $count_chars;
my $count_lines;
my $count_words;

# Define command-line options
GetOptions(
    'c' => \$count_chars, # -c for character count
    'l' => \$count_lines, # -l for line count
    'w' => \$count_words  # -w for word count
);

my $filename = shift @ARGV; # Get the filename from the remaining arguments

my $line_count = 0;
my $word_count = 0;
my $char_count = 0;

if (open my $filehandle, '<', $filename) {
    while (my $line = <$filehandle>) {
        $line_count += 1;
        $word_count += scalar split(" ", $line);
        $char_count += length $line;
    }
    close $filehandle;
} else {
    die "Failed to open the file: $!";
}

if ($count_chars) {
    print "$char_count $filename\n";
}

if ($count_lines) {
    print "$line_count $filename\n";
}

if ($count_words) {
    print "$word_count $filename\n";
}

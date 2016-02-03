#!/usr/bin/env perl

use strict;
use warnings;

my $nfiles = 0;
my $total = 0;
for my $file (@ARGV) {
    $total += process_file($file);
    $nfiles++;
}

sub process_file {
    my $file = shift;
    my $in_code = 0;
    my $count = 0;
    open my $in, $file
        or die "cannot open $file for reading: $!\n";
    while (<$in>) {
        if (/^-----*$/) {
            $in_code = !$in_code;
            next;
        }
        if (/^\.\.\.\.\.*$/) {
            $in_code = !$in_code;
            next;
        }

        next if $in_code;

        while (/\b([A-Za-z][-A-Za-z_]+)\b/g) {
            if ($1 ne 'link') {
                $count++;
            }
        }
    }
    close $in;
    printf "$file: $count words found.\n";
    return $count;
}
print "\nFor total $total words found in $nfiles files.\n";

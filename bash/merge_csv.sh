#!/usr/bin/perl

###################################################
#
# file: merge_csv.sh
#
# @Author:   Iacovos G. Kolokasis
# @Version:  12-03-2018
# @email:    kolokasis@ics.forth.gr
#
# This script merge csv files in collumns order.
#
# Run example:
# ./merge_csv.sh <file1.csv> <file2.csv> 
###################################################

use strict;

my @csv=();

foreach (@ARGV) {
  my $linenum=0;
  
  open(F,"<",$_) or die "couldn't open $_ for read: $!\n";

  while (<F>) {
    chomp;
    $csv[$linenum++] .= "," . $_;
  };

  close(F);
};

foreach (@csv) {
  s/^,//;           # strip leading comma from line
  print $_,"\n";
};

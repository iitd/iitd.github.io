#!/usr/bin/perl -w

use strict;
use warnings;


opendir(my $dh, ".") or die "Could not open '.': $!\n";

#my @files = grep { /^[^\.]/ && -f "./$_" } readdir($dh);
my @files = grep { /^[^\.]/ } readdir($dh);
closedir $dh;

for (my $i = 0; $i < scalar(@files); $i++) {
	my $file = $files[$i];
  if (-f $file) {
	  print "<a href=\"$file\">$file</a><br>\n";
  } else {
	  print "<a href=\"$file\">$file/</a><br>\n";
  }
}

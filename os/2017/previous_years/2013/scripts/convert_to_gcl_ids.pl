#!/usr/bin/perl -w

use strict;
use warnings;
use lib "/home/faculty/sbansal/public_html/csl373/scripts";
use Roster;
use POSIX;

our $roster;

open(my $roster_fp, "<$roster.clean");
open(my $roster_outfp, ">$roster.gcl_ids");
while (my $line = <$roster_fp>) {
	my ($name, $login_id);
	chomp($line);
	if ($line =~ /([^,]*), (.*)$/) {
	  my $entrynum = $1;
		my $name = $2;
		$entrynum =~ /\d\d(\d\d)(\S\S.)(\d\d\d\d)/ or die;
    my $depid = lc($2);
    my $gcl_id = "$depid$1$3";
		print $roster_outfp "$gcl_id, $entrynum, $name\n";
  }
}
close($roster_fp);
close($roster_outfp);

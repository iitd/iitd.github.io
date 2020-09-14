#!/usr/bin/perl
use lib "/home/faculty/sbansal/public_html/csl373/scripts";
use Roster

our $roster;
open(ROSTER, "<$roster");
open(ROSTER_OUT, ">$roster.clean");
my $entrynum = "";
while (my $line = <ROSTER>) {
	if ($line =~ /^(20\d\d...\d\d\d\d)$/) {
    $entrynum = $1;
  } elsif ($line =~ /\.,(.*)$/) {
	  $entrynum ne "" or die;
	  $name = $1;
	  print ROSTER_OUT "$entrynum, $name\n";
		$entrynum = "";
	}
}
close(ROSTER);
close(ROSTER_OUT);

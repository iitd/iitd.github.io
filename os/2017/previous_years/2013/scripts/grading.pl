#!/usr/bin/perl -w

use strict;
use warnings;
use lib "/home/faculty/sbansal/public_html/csl373/scripts";
use Switch;
use POSIX;
use Roster;

our $roster;
my %special_login_ids = (
	"me2090659", "me0920659",
  "csz128275", "bhatta",
  "csz128282", "ramki",
  "csz128283", "surender",
);

my $num_students = 0;
my (%names, %entrynums, %totals, %extra_credits);

open(my $class_fp, "<$roster.gcl_ids");
while (my $line = <$class_fp>) {
	my ($name, $login_id, $entrynum);
	chomp($line);
	if ($line =~ /([^,]*), ([^,]*), (.*)$/) {
		$login_id = $1;
		$entrynum = $2;
		$name = $3;
		if (defined lookup_special_login_id($login_id)) {
		  $login_id = lookup_special_login_id($login_id);
	  }
	}
  defined $login_id or die "login_id not defined for '$line'\n";
	open(my $score_fp, "csl373-score $login_id|");
	my $total = 0;
	my $extra_credit = 0;
	while (my $sline = <$score_fp>) {
		if ($sline =~ /Total: ([^\/]*)\//) {
			$total = $1;
		} elsif ($sline =~ /Extra Credit: (\S*)$/) {
			$extra_credit = $1;
		}
	}
	$num_students++;
	$names{$num_students} = $name;
	$entrynums{$num_students} = $entrynum;
	$totals{$num_students} = $total;
	$extra_credits{$num_students} = $extra_credit;
	#print "$num_students. $name $total $extra_credit\n";
}

my @ranked_list = ();
foreach my $sno (sort {($totals{$b} + $extra_credits{$b}) <=> ($totals{$a} + $extra_credits{$a})} keys %totals){
	push(@ranked_list, $sno);
}

my %ftotals;
my $rank = 1;
open(my $ranked_roster, ">$roster.ranked");
foreach my $sno (@ranked_list) {
	my $ftot = $totals{$sno} + $extra_credits{$sno};
	#$ftot *= 100/102;
	$ftot = int($ftot*100);
	$ftot /= 100;
	if ($ftot > 100) {
		$ftot = 100;
	}
	$ftotals{$sno} = $ftot;
	#print "$rank. $names{$sno} $totals{$sno} $extra_credits{$sno}\n";
	print $ranked_roster "$rank. $names{$sno}, $entrynums{$sno}, $ftot\n";
	$rank++;
}
close($ranked_roster);

my @grades = ("A", "A-", "B", "B-", "C", "C-", "D");
my @limits = (80.29, 75.16, 66.66, 56.72, 46.17, 36.29, 29.41);

sub get_grade {
	my $marks = shift;
	my $gn = 0;
	foreach my $limit (@limits) {
		if ($marks >= $limit) {
		  return $grades[$gn];
		}
		$gn++;
	}
	return "F";
}

open(my $csv_file, ">$roster.csv");
for (my $sno = 1; $sno < $num_students; $sno++) {
#foreach my $sno (@ranked_list) {
	my $grade = get_grade($ftotals{$sno});
	#print $csv_file "$names{$sno}, $entrynums{$sno}, $ftotals{$sno}, $grade\n";
	print $csv_file "$entrynums{$sno},$ftotals{$sno}\n";
}
close($csv_file);

sub lookup_special_login_id
{
	my $email = shift;

	my $login_id = $special_login_ids{$email};
	return $login_id;
}

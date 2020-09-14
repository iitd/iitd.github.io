#!/usr/bin/perl -w

use strict;
use warnings;
use lib "/home/faculty/sbansal/public_html/csl373/scripts";
use Switch;
use POSIX;

my %special_login_ids = (
  "ce1070262\@cee.iitd.ernet.in", "ce1070262",
  "jca092659\@maths.iitd.ernet.in", "jca092659",
  "csz098598\@cse.iitd.ernet.in", "mansureh",
  "lakshmana.m\@samsung.com", "lakshmana.m",
  "siddharth.k\@samsung.com", "ksiddharth",
  "mohit.goel1\@samsung.com", "mohit"

);
my $num_students = 0;
my (%names, %totals, %extra_credits);

open(my $class_fp, "perl gen_class_list.pl|");
while (my $line = <$class_fp>) {
	my ($name, $login_id);
	chomp($line);
	if (   ($line =~ /([^:]*): (\S*)$/)
		  && (defined lookup_special_login_id($2))) {
		$name = $1;
		$login_id = lookup_special_login_id($2);
	} elsif ($line =~ /([^:]*): ([^@]*)\@cse.iitd.ernet.in$/) {
		$name = $1;
		$login_id = $2;
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
foreach my $sno (@ranked_list) {
	my $ftot = $totals{$sno} + $extra_credits{$sno};
	$ftot *= 100/102;
	$ftot = int($ftot*100);
	$ftot /= 100;
	$ftotals{$sno} = $ftot;
	#print "$rank. $names{$sno} $totals{$sno} $extra_credits{$sno}\n";
	print "$rank. $names{$sno} $ftot\n";
	$rank++;
}

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

for (my $sno = 1; $sno < $num_students; $sno++) {
#foreach my $sno (@ranked_list) {
	my $grade = get_grade($ftotals{$sno});
	print "$names{$sno} $ftotals{$sno} $grade\n";
}


sub lookup_special_login_id
{
	my $email = shift;

	my $login_id = $special_login_ids{$email};
	return $login_id;
}

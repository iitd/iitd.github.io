#!/usr/bin/perl -w

use strict;
use warnings;
use lib "/home/faculty/sbansal/public_html/csl373/scripts";
use Switch;
use POSIX;
use File::Copy;
require "LibSubmit.pl";
use csl373 qw(%assignments %max_marks $grade_file);

my ($euid, $login, $user) = get_identity();
check_ta_permissions($user);

sub nop_signal_handler {
}

$SIG{INT} = 'nop_signal_handler';

print "Assignment List:\n";
foreach my $id (sort (keys %assignments)) {
	my $desc = $assignments{$id};
	print "$id\t\t$desc\n";
}
print "\nEnter the assignment ID: ";
my $idstr = <STDIN>;
$idstr = trim($idstr);

my $valid_id = 0;
my $assignment_desc;
my $max_marks;
foreach my $id (sort (keys %assignments)) {
	if ($idstr eq $id) {
		$valid_id = 1;
		$assignment_desc = $assignments{$id};
		$max_marks = $max_marks{$id};
		last;
	}
}

if ($valid_id == 0) {
	print "Invalid Assignment ID: '$idstr'\n";
	exit(1);
}

print "Entering grades for Assignment '$idstr' ($assignment_desc). Enter one grade per line in the following format (Type 'quit' to exit at any time):\n";
print "<login-id> <grade>\n";
print "e.g.,\n";
print "sbansal $max_marks\n";

while (my $line = <STDIN>) {
	$line = trim($line);
	if ($line =~ /^(\S+) (\d+)$/) {
		my $login_id = $1;
		my $marks = $2;
		if ($marks <0 || $marks > $max_marks) {
			print "Invalid grade. Valid range = [0,$max_marks]. Ignored.\n";
		} else {
			if (is_valid_login_id($login_id)) {
				enter_marks($login_id, $idstr, $marks);
			} else {
				print "Invalid userid: '$login_id'. Ignored.\n";
			}
		}
	} elsif ($line eq "quit") {
		exit(0);
	} else {
		print "Invalid entry: '$line'. Ignored\n";
	}
}

sub enter_marks
{
	my $input_login_id = shift;
	my $input_assignment_id = shift;
	my $input_marks = shift;

	my $flock_lock_code = 2;
	my $flock_unlock_code = 8;

	my $timestr = get_timestr();

	my $tmp_grade_file = "$grade_file.$login.$user.$timestr";
	copy($grade_file, $tmp_grade_file) or die "copy($grade_file, $tmp_grade_file) failed:$!\n";
	unlink($grade_file) or die "unlink($grade_file) failed: $!\n";
	open(my $tmp_grade_fp, "<$tmp_grade_file") or die "open(<$tmp_grade_file) failed: $!\n";
	open(my $grade_fp, ">$grade_file") or die "open(>$grade_file) failed: $!\n";

	flock($tmp_grade_fp, $flock_lock_code);
	flock($grade_fp, $flock_lock_code);

	while (my $line = <$tmp_grade_fp>) {
		chomp($line);
		if ($line =~ /^(\S+) (\S+) (\d+) (\S+) (\S+)$/) {
			my $user_id = $1;
			my $assignment_id = $2;
			my $marks = $3;
			my $ta = $4;
			my $time = $5;
			if ($user_id eq $input_login_id && $assignment_id eq $input_assignment_id)
			{
				print "Changing $input_assignment_id marks for $input_login_id from $marks [entered by $ta at $time] to $input_marks.\n";
			} else {
				print $grade_fp "$line\n";
			}
		} else {
			print "FATAL: found malformed line: '$line'. Please report to sbansal.\n";
			print $grade_fp "$line\n";
		}
	}
	print $grade_fp "$input_login_id $input_assignment_id $input_marks $user $timestr\n";

	flock($tmp_grade_fp, $flock_unlock_code);
	flock($grade_fp, $flock_unlock_code);

	close($tmp_grade_fp);
	close($grade_fp);
	chmod 0644, "$grade_file";
}

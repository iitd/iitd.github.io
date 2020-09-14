#!/usr/bin/perl -w

use strict;
use warnings;

open(my $registration_list, "<reg_list");

while (my $line = <$registration_list>) {
	chomp($line);
	#if ($line =~ /^([^",]+)",([^,"]+)"/) {
	if ($line =~ /^"\., ([^",]*)","([^",]+)/) {
		my $name = $1;
		my $uid = $2;
		#$name =~ s/\s*$//;
		#if (!(defined $email_id) || $email_id eq "") {
		#	if ($entry_no =~ /^\d\d(\d\d)(...)(....)$/) {
		#		my $year = $1;
		#		my $dept_id = $2;
		#		my $student_id = $3;
		#		my $dept_email_id = get_dept_email_id($dept_id);
		#		my $ldept_id = lc($dept_id);
		#		$email_id = "$ldept_id$year$student_id\@$dept_email_id.iitd.ernet.in";
		#	} else {
		#		print "FATAL: Could not parse entry number: '$entry_no' in '$line'.\n";
		#		print "email_id='$email_id'\n";
		#		print "name='$name'\n";
		#		print "entry_no='$entry_no'\n";
		#		exit(1);
		#	}
		#}
		print "$name: $uid\@cse.iitd.ernet.in\n";
	} else {
		print "FATAL: Could not parse registration entry: '$line'.\n";
		exit(1);
	}
}

sub get_dept_email_id
{
	my $dept_id = shift;
	if ($dept_id =~ /^CS.$/) {
		return "cse";
	} elsif ($dept_id =~ /^CE.$/) {
		return "cee";
	} elsif ($dept_id =~ /^JCA$/) {
		return "maths";
	} else {
		print "FATAL: Unknown department ID: '$dept_id'\n";
		exit(1);
	}
}

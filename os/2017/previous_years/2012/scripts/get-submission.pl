#!/usr/bin/perl -w

use strict;
use warnings;
use lib "/home/faculty/sbansal/public_html/csl373/scripts";
use Switch;
use POSIX;
use File::Copy;
use File::Copy::Recursive qw(rcopy);
require "LibSubmit.pl";
require "Pintos_submissions.pl";

my $SUBMISSION_DIRECTORY = get_submission_directory();

my ($euid, $login, $user) = get_identity();

#$File::Copy::Recursive::CopyLink = 0;
if ($#ARGV != 1) {
	print "Usage: get-submission <login-id> <lab-id>\ne.g., get-submission sbansal lab1\n";
	exit(1);
}

my @labs = ("lab1", "base", "userprog", "vm", "filesys");

my $username = $ARGV[0];
my $lab_id = $ARGV[1];

if ($username ne $user) {
	check_ta_permissions($user);
}

if (!is_valid_lab_id($lab_id)) {
	print "Invalid lab id: '$lab_id'.\n";
	exit(1);
}


if (!is_valid_login_id($username)) {
	print "Invalid login Id: '$username'.\n";
	exit(1);
}

$username = untaint($username);
$lab_id = untaint($lab_id);

my $submit_dir_filename = readlink("$SUBMISSION_DIRECTORY/$lab_id/$username") or die "Could not find $lab_id submission for $username. readlink($SUBMISSION_DIRECTORY/$lab_id/$username): $!\n";
$submit_dir_filename = untaint($submit_dir_filename);
my $submit_dir_filename_last;
if ($submit_dir_filename =~ /\/([^\/]+)$/) {
	$submit_dir_filename_last = $1;
} else {
	$submit_dir_filename_last = $submit_dir_filename;
	$submit_dir_filename = "$SUBMISSION_DIRECTORY/$lab_id/$submit_dir_filename_last";
}

setuid($login);
mkdir("$lab_id.$submit_dir_filename_last") or die "mkdir($lab_id.$submit_dir_filename_last) failed: $!\n";
chmod(0700, "$lab_id.$submit_dir_filename_last");

suid_copy_dir($submit_dir_filename, $euid, "$lab_id.$submit_dir_filename_last", $login);
print "Directory '$lab_id.$submit_dir_filename_last' created (submission ID: '$lab_id/$submit_dir_filename_last'). Please wait ...\n";

if ($lab_id eq "lab1") {
	exit(0);
}

if ($username eq $user) {
	setuid($login);
	xsystem("/bin/rm -f $lab_id.$submit_dir_filename_last/diff.src.*");
	xsystem("/bin/rm -f $lab_id.$submit_dir_filename_last/DESIGNDOC.*");
}

setuid($euid);
my $cdir = checkout_assignment($lab_id, $submit_dir_filename_last);
suid_copy_dir("$cdir/src", $euid, "$lab_id.$submit_dir_filename_last/src", $login);

exit(0);

sub is_valid_lab_id
{
	my $labid = shift;
	foreach my $l (@labs) {
		if ($l eq $labid) {
			return 1;
		}
	}
	return 0;
}




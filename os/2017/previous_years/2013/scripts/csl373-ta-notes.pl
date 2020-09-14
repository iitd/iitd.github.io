#!/usr/bin/perl -w

use strict;
use warnings;
use lib "/home/faculty/sbansal/public_html/csl373/scripts";
use Switch;
use POSIX;
#use Cwd;
use File::Copy;
use File::Path;
use File::Temp qw/ :mktemp /;
use Cwd 'abs_path';
use DateTime;
require "LibSubmit.pl";

sub usage {
	print "Usage: csl373-ta-notes [lab1|threads|userprog|vm|filesys] <user-id>\n";
	exit(1);
}

my $SUBMISSION_DIRECTORY = get_submission_directory();

if ($#ARGV != 1) {
	usage();
}

my ($euid, $login, $user) = get_identity();
check_ta_permissions($user);

my $lab_id = $ARGV[0];
my $student_id = $ARGV[1];
my $lab_id_found = 0;
foreach my $lid ("lab1", "base", "threads", "userprog", "vm", "filesys") {
	if ($lab_id eq $lid) {
		$lab_id_found = 1;
		$lab_id = $lid;   #to untaint lab_id
		last;
	}
}

if (!$lab_id_found) {
	usage();
}

if (!is_valid_login_id($student_id)) {
	print "Invalid login ID: '$student_id'\n";
	usage();
}

my $lab_submission_dir = "$SUBMISSION_DIRECTORY/$lab_id";
my $student_submission_dir = "$lab_submission_dir/$student_id";

if (!(-e $student_submission_dir)) {
	print "No submission for $lab_id for $student_id yet. Can't take notes.\n";
	exit(1);
}

my ($group_names_ref, $submission_timestr) = get_submission_details($student_submission_dir);
my @group_names = @$group_names_ref;

$student_submission_dir = untaint($student_submission_dir);

my $notes_file = "$student_submission_dir/ta.notes";

if (!(-e $notes_file)) {
	open(my $notes_fp, ">$notes_file");
	print $notes_fp "=============================\n";
	print $notes_fp "csl373-ta-notes for $lab_id for '@group_names', submission made at $submission_timestr.\n";
	print $notes_fp "make separate notes for each student whenever necessary.\n";
	print $notes_fp "annotate your comments with your login ID.\n";
	print $notes_fp "=============================\n\n";
	close($notes_fp);
}

my $timestr = get_timestr();
open(my $notes_fp, ">>$notes_file");
print $notes_fp "Comments by $user at $timestr:\n\n";
close($notes_fp);

setuid($login);
my ($tmp_fp, $tmpfile) = mkstemp("csl373.notes.tmpfile.XXXXX");
suid_copy($notes_file, $euid, $tmpfile, $login);

if (xsystem("/usr/local/bin/vim + $tmpfile") != 0) {
	print "vim exited with error. Notes NOT taken.\n";
	exit(1);
}

suid_copy($tmpfile, $login, $notes_file, $euid);
unlink($tmpfile);

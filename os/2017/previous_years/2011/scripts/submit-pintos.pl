#!/usr/bin/perl -w

use strict;
use warnings;
use lib "/home/faculty/sbansal/public_html/csl373/scripts";
use Switch;
use POSIX;
#use Cwd;
use File::Copy;
use File::Path;
use Cwd 'abs_path';
use DateTime;
use IO::Handle;
require "LibSubmit.pl";
require "Pintos_submissions.pl";

sub usage {
	print "Usage: submit-pintos [base|threads|userprog|vm|filesys].\n";
	exit(1);
}

if ($#ARGV != 0) {
	usage();
}

my $SUBMISSION_DIRECTORY = get_submission_directory();
my $lab_id = $ARGV[0];
my $lab_id_found = 0;
my $pintos_basedir = "/misc/research/teaching/sbansal/csl373/pintos";
foreach my $lid ("base", "threads", "userprog", "vm", "filesys") {
	if ($lab_id eq $lid) {
		$lab_id_found = 1;
		$lab_id = $lid;   #to untaint lab_id
		last;
	}
}

if (!$lab_id_found) {
	usage();
}

my ($euid, $login, $user) = get_identity();

my $MAX_GROUPSIZE = 2;
my $lab_submission_dir = "$SUBMISSION_DIRECTORY/$lab_id";
my $MAX_NUM_FILES = 25000;
my $MAX_FILESIZE = 100000;   #100KB
my $MAX_SUBMISSIONS = 10;
my $tmpdir = "csl373.submit.$lab_id";

#print "euid = $euid, uid = $login, user = $user, start day: $day_today.\n";
setuid($login);

print "You must ensure that all your files are in the SVN repository and that they build and run as expected. To confirm this, you can checkout the files again in a separate directory and check them before submitting.\n";
print "Enter the URL of your repository (e.g., https://svn.iitd.ernet.in/~cs1012345/pintos-repo):\n";
my $svn_url = <STDIN>;

chomp($svn_url);
if (   !($svn_url =~ /^https:\/\/svn.iitd.ernet.in\//)
    && !($svn_url =~ /^https:\/\/svn.iitd.ac.in\//)) {
	print "Invalid URL.\n";
	exit(1);
}

#remove any trailing slashes
$svn_url =~ s/\/+$//;
my $repo_name;
if ($svn_url =~ /\/([^\/]+)$/) {
	$repo_name = $1;
}

if (!(defined $repo_name)) {
	print "Invalid URL.\n";
	exit(1);
}

my $cwd = getcwd;
mkdir($tmpdir) or die "mkdir($tmpdir) failed: $!. If subdirectory exists, remove it using 'rm -rf'\n";
chdir($tmpdir) or die "chdir($tmpdir) failed: $!\n";
print "=============================================================\n";
print "Checking out $svn_url .... follow the checkout instructions.\n";
print "=============================================================\n";
my $command = "/usr/bin/svn checkout $svn_url";
$command = untaint($command);
my $checkout_status = xsystem($command);
#my $checkout_status = xsystem("mkdir pintos-repo && cp -r /home/faculty/sbansal/public_html/csl373/src pintos-repo");
if ($checkout_status != 0) {
	print "Checkout unsuccessful.\n";
	print "Submission NOT made.\n";
	cleanup_and_exit();
}

chdir($repo_name) or die "chdir($tmpdir/$repo_name) failed: $!\n";


my @relevant_files;
my @all_files = recursively_add_files("./", 0, 0);

# create a list of all *.[ch] files in
# the current directory
#@relevant_files = grep(/\.[chCSs]$/, @all_files);
#@relevant_files = (@relevant_files, grep(/Makefile/, @all_files));
@relevant_files = @all_files;

@relevant_files = sort @relevant_files;

#if ((scalar grep(/Makefile/, @relevant_files)) == 0) {
#	print "Error: Makefile not found. Your submission has not been made. You must resubmit with a Makefile.\n";
#	exit(1);
#}

my $num_relevant_files = scalar @relevant_files;
if ($num_relevant_files >= $MAX_NUM_FILES) {
	print "Too many files ($num_relevant_files). Maximum allowed: $MAX_NUM_FILES\n";
	cleanup_and_exit();
}

foreach my $file (@relevant_files) {
	my $filesize = -s $file;
	if ($filesize >= $MAX_FILESIZE) {
		print "File '$file' too big ($filesize bytes). Max allowed: $MAX_FILESIZE bytes.\n";
		cleanup_and_exit();
	}
#	if (-l $file) {
#		print "File '$file' is a symbolic link. Symbolic links are not permitted. Submission NOT made.\n";
#		exit(1);
#	}
#	if (!(-f $file)) {
#		print "File '$file' is not a plain file. Not permitted. Submission NOT made.\n";
#		exit(1);
#	}
}

my $old_submission = "";
print "We found the following relevant files in the directory which will be copied as your submission.\n";
print "================\n";
foreach my $file (@relevant_files) {
	print "$file ";
}
print "\n";
print "================\n";

print "OK?[Y/n] ";
#my $c = getc(STDIN);
my $c = <STDIN>;
if ($c eq 'N' || $c eq 'n') {
	print "Submission NOT made.\n";
	cleanup_and_exit();
}

my @partners = ();
print "\nYou are making a submission with user-id '$user'\n";
print "If you have any partners, enter their login IDs below (one on each line). Do not enter your own user-ID. Enter 'done' to finish entering the names of your partners:\n";
while (my $input_line = <STDIN>) {
	chomp($input_line);
	if ($input_line eq "done") {
		last;
	}
	$input_line = trim($input_line);
	if ($input_line eq "") {
		next;
	}
	if ($input_line eq $user) {
		print "You are entering yourself as a partner. Ignored.\n";
		next;
	}
	if (is_valid_login_id($input_line)) {
		$input_line = untaint($input_line);
		push (@partners, $input_line);
	} else {
		print "Invalid userid: '$input_line'. Ignored.\n";
	}
}
push(@partners, $user);

if ((scalar @partners) > $MAX_GROUPSIZE) {
	print "Too many partners. This assignment was to be done in groups of at most $MAX_GROUPSIZE. Submission NOT made.\n";
	cleanup_and_exit();
}

my $group_id_string = "grp.";
print "\nMaking submission for the following people (in lexicographic order):\n";
print "================\n";
my @tmp_partners = sort @partners;
@partners = ();
my $prev_partner = "";
foreach my $partner (@tmp_partners) {
	if ($partner ne $prev_partner) {
		push (@partners, $partner);
	}
}
foreach my $partner (@partners) {
	print "$partner ";
	$group_id_string .= "$partner.";
}
print "\n";
print "================\n";

print "OK?[Y/n] ";
#$c = getc(STDIN);
$c = <STDIN>;
if ($c eq 'N' || $c eq 'n') {
	print "Submission NOT made.\n";
	cleanup_and_exit();
}

if (!(-e $lab_submission_dir)) {
	mkdir($lab_submission_dir) or die "mkdir($lab_submission_dir) failed: $!\n";
}
setuid($euid);
my $num_moves = 0;
if (!(-e "$lab_submission_dir/old")) {
	mkdir("$lab_submission_dir/old") or die "mkdir($lab_submission_dir/old) failed: $!\n";
}
opendir(my $subdir_fp, $lab_submission_dir) or die "opendir($lab_submission_dir) failed: $!\n";
foreach my $dirent (readdir($subdir_fp)) {
	$dirent = untaint($dirent);
	if (-d "$lab_submission_dir/$dirent") {
		if ($dirent =~ /$group_id_string/) {
			$old_submission = "$lab_submission_dir/old/$dirent";
			system("/bin/mv $lab_submission_dir/$dirent $lab_submission_dir/old/");
			$num_moves++;
			if ($num_moves > 1) {
				print "FATAL: num_moves = $num_moves > 1.\n";
				cleanup_and_exit();
			}
		}
	}
}
closedir($subdir_fp);

my $num_submissions = 0;
opendir(my $subdir_old_fp, "$lab_submission_dir/old") or die "opendir($lab_submission_dir/old) failed: $!\n";
foreach my $dirent (readdir($subdir_old_fp)) {
	if (-d "$lab_submission_dir/old/$dirent") {
		if ($dirent =~ /$group_id_string/) {
			$num_submissions++;
		}
	}
}

if ($num_submissions > $MAX_SUBMISSIONS) {
	print "You have already submitted $num_submissions times. You are not allowed to submit any more till you talk to the instructor. Submission NOT made.\n";
	cleanup_and_exit();
}
$num_submissions = untaint($num_submissions);

my $timestr = get_timestr();
my $subdir = "$lab_submission_dir/$group_id_string$num_submissions.$timestr";

mkdir($subdir) or die "mkdir failed: $!\n";
chmod(0700, $subdir);
setuid($login);
foreach my $file (@relevant_files) {
	suid_copy($file, $login, "$subdir/$file", $euid);
}

setuid($euid);

if (process_files($subdir, $lab_id)) {
	$subdir = untaint($subdir);
	#rmtree($subdir) or die "rmtree($subdir) failed: $!\n";
	xsystem("/bin/rm -rf $subdir");
	print "Submission NOT made.\n";
	cleanup_and_exit();
}

foreach my $partner (@partners) {
	my $subdir_last;
	if (-e "$lab_submission_dir/$partner" || -l "$lab_submission_dir/$partner") {
		unlink("$lab_submission_dir/$partner") or die "unlink failed: $!\n";
	}
	if ($subdir =~ /\/([^\/]+)$/) {
		$subdir_last = $1;
	} else {
		print "FATAL: malformed subdir: '$subdir'\n";
		exit(1);
	}
	symlink($subdir_last, "$lab_submission_dir/$partner") or die "Failed to create symlink: $!\n";
	# email $partner to let him know that a submission has been made for him
	# by user.
}

cleanup();
print "\n=====================\n";
print "Congratulations. Submission made successfully. Your submission ID is '$subdir'. Note down the submission ID for future reference.\n";
print "You can check your submission at any time using one of the following:\n";
foreach my $partner (@partners) {
	print "get-submission $partner $lab_id\n";
}
exit(0);

sub cleanup {
	chdir($cwd);
	setuid($login);
	#rmtree($tmpdir) or die "rmtree($tmpdir) failed: $!\n";
	xsystem("/bin/rm -rf $tmpdir");

}

sub cleanup_and_exit {
	cleanup();
	if ($old_submission ne "") {
		setuid($euid);
		xsystem("/bin/mv $old_submission $lab_submission_dir");
		setuid($login);
	}
	exit(1);
}

sub process_files
{
	my $subdir = shift;
	my $lab_id = shift;

	if ($lab_id eq "base") {
		return process_files_base($subdir);
	} elsif ($lab_id eq "threads") {
		return process_files_threads($subdir);
	} elsif ($lab_id eq "userprog") {
		return process_files_userprog($subdir);
	} elsif ($lab_id eq "vm") {
		return process_files_vm($subdir);
	} elsif ($lab_id eq "filesys") {
		return process_files_filesys($subdir);
	}
	die "FATAL: unrecognized lab_id: $lab_id\n";
}

sub toplevel_directory_contains_src_folder
{
	my $subdir = shift;
	my $found_src = 0;
	opendir(my $subdir_fp, $subdir);
	if (!(defined $subdir_fp)) {
		print "FATAL: opendir($subdir) failed.\n";
		return 0;
	}
	foreach my $dirent (readdir($subdir_fp)) {
		if ($dirent =~ /^src$/) {
			$found_src = 1;
		}
	}
	closedir($subdir_fp);
	return $found_src;
}

sub submission_contains_designdoc
{
	my $subdir = shift;
	my $assn = shift;
	if (-e "$subdir/src/$assn/DESIGNDOC") {
		return 1;
	}
	print "Your submission does not contain a DESIGNDOC.\n";
	return 0;
}

sub submission_contains_tmpfiles
{
	my $subdir = shift;
	my @all_files = recursively_add_files("$subdir/", 0);
	my @tmpfiles = ();
	print "\n";
	foreach my $file (@all_files) {
		if (is_temporary_file($file)) {
			push (@tmpfiles, $file);
		}
	}
	if ((scalar @tmpfiles) != 0) {
		print "Error: Temporary files exist in your submission: ";
		foreach my $file (@tmpfiles) {
			if ($file =~ /$subdir\/(.*)$/) {
				my $filename = $1;
				print "$filename ";
			}
		}
		print "\n";
		return 1;
	}
	return 0;
}

sub is_temporary_file
{
	my $file = shift;
	#print "file = '$file'\n";
	if ($file =~ /cscope.out$/) {
		return 1;
	}
	if ($file =~ /tags$/) {
		return 1;
	}
	if ($file =~ /\.o$/) {
		return 1;
	}
	if ($file =~ /\/build\//) {
		return 1;
	}
	return 0;
}

sub organize_submission
{
	my $subdir = shift;
	my $assn = shift;
	my $prev_id = shift;
	my $prev_assn = shift;

	my $prevdir = checkout_assignment($prev_assn, $prev_id);
	xsystem("/bin/mv $subdir/src/$assn/DESIGNDOC $subdir/DESIGNDOC.$assn");
	my $exitstatus = xsystem("/usr/bin/diff -urpN $prevdir/src  $subdir/src > $subdir/diff.src.$prev_assn.$prev_id");
	if ($exitstatus == 0) {
		print "Your submission is identical to your previous submission. Not possible!\n";
		return 1;
	} elsif ($exitstatus > 1) {
		print "Your submission seems to contain your own binary files (or you might have removed some binary files that were present earlier) in the src/ directory. Move them outside the src/ directory.\n";
		return 1;
	}
	xsystem("/bin/rm -rf $subdir/src");
	return 0;
}

sub process_files_threads
{
	my $subdir = shift;
	if (clean_svn_files($subdir)) {
		return 1;
	}
	if (submission_contains_tmpfiles($subdir)) {
		return 1;
	}
	if (!toplevel_directory_contains_src_folder($subdir)) {
		print "Top level 'src' directory not found in your submission.\n";
		return 1;
	}
	if (!submission_contains_designdoc($subdir, "threads")) {
		return 1;
	}
	print "Enter the submission-ID of your base submission (e.g., base/grp.cs1012345.cs5067890.0.2011-1-26.12:12:12). If you have forgotten your submission ID, you can retrieve it by typing 'get-submission $user base' which will create a directory named by your base submission ID. You will need to prefix it with 'base/':\n";
	my $submission_id = <STDIN>;
	chomp($submission_id);
	my $base_submission_id;
	my $base_subdir = "$SUBMISSION_DIRECTORY/$submission_id";
	if ($submission_id =~ /^base\/(.*)$/) {
		$base_submission_id = $1;
	} else {
		print "You should prefix your submission ID with 'base/'\n";
		return 1;
	}
	if (!(-e $base_subdir)) {
		print "Your base submission ID is invalid: '$base_submission_id'.\n";
		return 1;
	}
	$base_submission_id = untaint($base_submission_id);
	if (organize_submission($subdir, "threads", $base_submission_id, "base")) {
		return 1;
	}
	return 0;
}

sub process_files_userprog
{
	my $subdir = shift;
	if (clean_svn_files($subdir)) {
		return 1;
	}
	if (submission_contains_tmpfiles($subdir)) {
		return 1;
	}
	if (!toplevel_directory_contains_src_folder($subdir)) {
		print "Top level 'src' directory not found in your submission.\n";
		return 1;
	}
	if (!submission_contains_designdoc($subdir, "userprog")) {
		return 1;
	}
	print "Enter the submission-ID of your threads submission (e.g., threads/grp.cs1012345.cs5067890.0.2011-1-26.12:12:12). If you have forgotten your submission ID, you can retrieve it by typing 'get-submission $user threads' which will create a directory named by your threads submission ID. You will need to prefix it with 'threads/':\n";
	my $submission_id = <STDIN>;
	chomp($submission_id);
	my $threads_submission_id;
	my $threads_subdir = "$SUBMISSION_DIRECTORY/$submission_id";
	if ($submission_id =~ /^threads\/(.*)$/) {
		$threads_submission_id = $1;
	} else {
		print "You should prefix your submission ID with 'threads/'\n";
		return 1;
	}
	if (!(-e $threads_subdir)) {
		print "Your threads submission ID is invalid: '$threads_submission_id'.\n";
		return 1;
	}
	$threads_submission_id = untaint($threads_submission_id);
	if (organize_submission($subdir, "userprog", $threads_submission_id, "threads")) {
		return 1;
	}
	return 0;
}

sub process_files_vm
{
	my $subdir = shift;
	if (clean_svn_files($subdir)) {
		return 1;
	}
	if (submission_contains_tmpfiles($subdir)) {
		return 1;
	}
	if (!toplevel_directory_contains_src_folder($subdir)) {
		print "Top level 'src' directory not found in your submission.\n";
		return 1;
	}
	if (!submission_contains_designdoc($subdir, "vm")) {
		return 1;
	}
	print "Enter the submission-ID of your userprog submission (e.g., userprog/grp.cs1012345.cs5067890.0.2011-2-26.12:12:12). If you have forgotten your submission ID, you can retrieve it by typing 'get-submission $user threads' which will create a directory named by your threads submission ID. You will need to prefix it with 'userprog/'.\n";
 print "\n======================================\nNote that you should provide the submission ID of the userprog assignment on which you have built your VM assignment: \n======================================\n";
	my $submission_id = <STDIN>;
	chomp($submission_id);
	my $userprog_submission_id;
	my $userprog_subdir = "$SUBMISSION_DIRECTORY/$submission_id";
	if ($submission_id =~ /^userprog\/(.*)$/) {
		$userprog_submission_id = $1;
	} else {
		print "You should prefix your submission ID with 'userprog/'\n";
		return 1;
	}
	if (!(-e $userprog_subdir)) {
		print "Your userprog submission ID is invalid: '$userprog_submission_id'.\n";
		return 1;
	}
	$userprog_submission_id = untaint($userprog_submission_id);
	if (organize_submission($subdir, "vm", $userprog_submission_id, "userprog")) {
		return 1;
	}
	return 0;
}

sub process_files_filesys
{
	my $subdir = shift;
	if (clean_svn_files($subdir)) {
		return 1;
	}
	if (submission_contains_tmpfiles($subdir)) {
		return 1;
	}
	if (!toplevel_directory_contains_src_folder($subdir)) {
		print "Top level 'src' directory not found in your submission.\n";
		return 1;
	}
	if (!submission_contains_designdoc($subdir, "filesys")) {
		return 1;
	}
	print "Enter the submission-ID of your vm submission (e.g., vm/grp.cs1012345.cs5067890.0.2011-2-26.12:12:12). If you have forgotten your submission ID, you can retrieve it by typing 'get-submission $user threads' which will create a directory named by your threads submission ID. You will need to prefix it with 'vm/'.\n";
	my $submission_id = <STDIN>;
	chomp($submission_id);
	my $vm_submission_id;
	my $vm_subdir = "$SUBMISSION_DIRECTORY/$submission_id";
	if ($submission_id =~ /^vm\/(.*)$/) {
		$vm_submission_id = $1;
	} else {
		print "You should prefix your submission ID with 'vm/'\n";
		return 1;
	}
	if (!(-e $vm_subdir)) {
		print "Your vm submission ID is invalid: '$vm_submission_id'.\n";
		return 1;
	}
	$vm_submission_id = untaint($vm_submission_id);
	if (organize_submission($subdir, "filesys", $vm_submission_id, "vm")) {
		return 1;
	}
	return 0;
}

sub process_files_base
{
	my $subdir = shift;
	if (clean_svn_files($subdir)) {
		return 1;
	}
	open(my $diff_output, "/usr/bin/diff -ur $subdir $pintos_basedir|");
	if (!(defined $diff_output)) {
		print "diff failed.\n";
		return 1;
	}
	if (defined(my $line = <$diff_output>)) {
		print "Your repository is different from the base pintos repository. Here is the diff:\n";
		print "===========================\n";
		print $line;
		while (defined($line = <$diff_output>)) {
			print $line;
		}
		print "===========================\n";
		close($diff_output);
		print "Your top-level directory in your repository should be src/\n";
		return 1;
	}
	close($diff_output);
	#rmtree("$subdir/src") or die "rmtree($subdir/src) failed: $!\n";
	xsystem("/bin/rm -rf $subdir/src");
  open(my $notes_fp, ">$subdir/submit.note") or die "open(>$subdir/submit.note) failed: $!\n";
	print $notes_fp "SVN URL: $svn_url\n";
	print $notes_fp "Identical to base pintos.\n";
	close($notes_fp);
	return 0;
}

sub clean_svn_files
{
	my $topdir = shift;

	my @files = recursively_add_files("$topdir/", 0, 1);
	foreach my $file (@files) {
		if (!(-d $file)) {
			next;
		}
		#print "dir: $file\n";
		$file = abs_path($file);
		if ($file =~ /^$lab_submission_dir.*\.svn/) {
			#print "removing $file\n";
			$file = untaint($file);
			xsystem("/bin/rm -rf $file");
			#if (!rmtree($file)) {
			#print "rmtree($file) failed: $!\n";
			#return 1;
			#}
		}
	}
	if (-e "$topdir/Done!") {
		if (!unlink("$topdir/Done!")) {
			print "unlink($topdir/Done!) failed: $!\n";
			return 1;
		}
	}
	return 0;
}

use strict;
use warnings;
use lib "/home/faculty/sbansal/public_html/csl373/scripts";
use Switch;
use POSIX;
use DateTime;
use File::Copy;
use File::Path qw(mkpath);
use Cwd 'abs_path';

sub get_pintos_basedir {
	return "/misc/research/teaching/sbansal/csl373/pintos";
}

sub get_diff_filename {
	my $SUBMISSION_DIRECTORY = get_submission_directory();
	my $assn = shift;
	my $id = shift;
	my $sdir = "$SUBMISSION_DIRECTORY/$assn/$id";
	opendir(my $sdir_fp, $sdir) or die "opendir($sdir) failed: $!\n";
	my $diff_filename = "";
	foreach my $dirent (readdir($sdir_fp)) {
		if ($dirent =~ /^diff.src/) {
			$diff_filename = $dirent;
			last;
		}
	}
	$diff_filename ne ""  or die "Could not find diff filename: $assn/$id\n";
	return "$sdir/$diff_filename";
}

sub reconstruct_submission {
	my $assn = shift;
	my $prev_assn = shift;
	my $id = shift;
	my $diff_filename = shift;
	my $designdoc_filename = shift;
	my $checkout_dir = shift;

	if ($diff_filename =~ /diff\.src\.([^\.]*)\.(.*)$/) {
		my $base_assn = $1;
		my $base_id = $2;

		if ($base_assn ne $prev_assn) {
			die "\n\nThe assignment ID on which this assignment is built ($base_assn/$base_id) is not a $prev_assn assignment. Please contact the course staff.\n";
		}
		my $prev_dir = checkout_assignment($base_assn, $base_id);
		print("Checking out $assn assignment ($id)\n");
		xsystem("cd $prev_dir/src && patch -p10 < $diff_filename");
		xsystem("/bin/mv $prev_dir $checkout_dir/");
		xsystem("/bin/cp $designdoc_filename $checkout_dir/src/$assn/DESIGNDOC");
	} else {
		die "FATAL: Could not parse diff_filename '$diff_filename'\n";
	}
	return "$checkout_dir";
}

sub checkout_assignment {
	my $assn = shift;
	my $id = shift;
	my $pintos_basedir = get_pintos_basedir();
	my $SUBMISSION_DIRECTORY = get_submission_directory();
	
	if ($assn eq "base") {
		return $pintos_basedir;
	}

	my ($euid, $login, $user) = get_identity();
	my $checkout_dir = "$SUBMISSION_DIRECTORY/tmpdir/$assn.$id";
	my $diff_filename = untaint(get_diff_filename($assn, $id));
	my $designdoc_filename = untaint("$SUBMISSION_DIRECTORY/$assn/$id/DESIGNDOC.$assn");
	my $prev_assn = "";

	setuid($euid);
	xsystem("rm -rf $checkout_dir");
	if ($assn eq "threads") {
		print("Checking out threads assignment ($id)\n");
		xsystem("/bin/cp -r $pintos_basedir $checkout_dir");
		xsystem("cd $checkout_dir/src && patch -p8 < $diff_filename");
		xsystem("/bin/cp $designdoc_filename $checkout_dir/src/threads/DESIGNDOC");
		return "$checkout_dir";
	}
	if ($assn eq "userprog") {
		$prev_assn = "threads";
	} elsif ($assn eq "vm") {
		$prev_assn = "userprog";
	} elsif ($assn eq "filesys") {
		$prev_assn = "vm";
	} else {
		die "Unknown assignment: $assn\n";
	}
	return reconstruct_submission($assn, $prev_assn, $id, $diff_filename, $designdoc_filename, $checkout_dir);
#	if ($assn eq "userprog") {
#		if ($diff_filename =~ /diff\.src\.([^\.]*)\.(.*)$/) {
#			my $base_assn = $1;
#			my $base_id = $2;
#
#			if ($base_assn ne "threads") {
#				die "\n\nThe assignment ID on which this assignment is built ($base_assn/$base_id) is not a threads assignment. Please contact the course staff.\n";
#			}
#			my $threads_dir = checkout_assignment($base_assn, $base_id);
#			print("Checking out userprog assignment ($id)\n");
#			xsystem("cd $threads_dir/src && patch -p10 < $diff_filename");
#			xsystem("/bin/mv $threads_dir $checkout_dir/");
#			xsystem("/bin/cp $designdoc_filename $checkout_dir/src/userprog/DESIGNDOC");
#		} else {
#			die "FATAL: Could not parse diff_filename '$diff_filename'\n";
#		}
#		return "$checkout_dir";
#	}
#	if ($assn eq "vm") {
#		if ($diff_filename =~ /diff\.src\.([^\.]*)\.(.*)$/) {
#			my $base_assn = $1;
#			my $base_id = $2;
#
#			if ($base_assn ne "userprog") {
#				die "\n\nThe assignment ID on which this assignment is built ($base_assn/$base_id) is not a userprog assignment. Please contact the course staff.\n";
#			}
#			my $userprog_dir = checkout_assignment($base_assn, $base_id);
#			print("Checking out vm assignment ($id)\n");
#			xsystem("cd $userprog_dir/src && patch -p10 < $diff_filename");
#			xsystem("/bin/mv $userprog_dir $checkout_dir/");
#			xsystem("/bin/cp $designdoc_filename $checkout_dir/src/vm/DESIGNDOC");
#		} else {
#			die "FATAL: Could not parse diff_filename '$diff_filename'\n";
#		}
#		return "$checkout_dir";
#	}
#
#	die "not-implemented.\n";
}

1;

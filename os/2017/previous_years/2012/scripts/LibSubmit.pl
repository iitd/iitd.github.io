use strict;
use warnings;
use lib "/home/faculty/sbansal/public_html/csl373/scripts";
use Switch;
use POSIX;
use DateTime;
use File::Copy;
use File::Path qw(mkpath);
use Cwd 'abs_path';

sub get_submission_directory {
	return "/home/faculty/sbansal/public_html/csl373/submissions";
}

my $MAX_DIR_DEPTH = 10;

$ENV{'PATH'} = '/usr/bin:/bin';
delete @ENV{qw(IFS CDPATH ENV BASH_ENV)}; # Make %ENV safer

my @tas = (
	"sbansal",
	"sswati",
	"mansureh",
	"siy107538", #dipanjan
	"deepak",
	"siy107537", #piyus kedia
	"mcs103484", #georgy sebastian
	"mcs112565", #agastya nanda
	"mcs112562", #harish
	"cs5070222", #nitin
	"rejoy", #rejoy
	"mcs102061", #kanika modi
);

sub get_identity
{
	my $uid = getuid();
	open (my $getent_output, "/usr/bin/getent passwd $uid|");
	my $line = <$getent_output>;
	close($getent_output);
	my $user;
	if ($line =~ /^([^:]*):/) {
		$user = $1;
	} else {
		print "FATAL: Could not get username for uid $uid.\n";
		exit(1);
	}
	#print "user=$user\n";
	return (geteuid(), getuid(), $user);
}

# Perl trim function to remove whitespace from the start and end of the string
sub trim
{
	my $string = shift;
	$string =~ s/^\s+//;
	$string =~ s/\s+$//;
	return $string;
}

sub is_valid_login_id
{
	my $id = shift;
	if ($id =~ /^(\S+)$/) {
		$id = $1;
	} else {
		return 0;
	}
	open(my $finger_output_fp, "/usr/bin/finger $id 2>&1|") or die "could not open finger output: $!\n";
	my $finger_output_first_line = <$finger_output_fp>;
	close($finger_output_fp);
	if (   defined $finger_output_first_line
		  && $finger_output_first_line =~ /^Login/) {
		return 1;
	} else {
		return 0;
	}
}

sub check_ta_permissions {
	my $user = shift;
	my $allowed = 0;
	foreach my $uname (@tas) {
		if ($uname eq $user) {
			$allowed = 1;
		}
	}

	if (!$allowed) {
		print "You don't have permission to execute this script.\n";
		exit(1);
	}
}

sub get_timestr
{
	my $dt = DateTime->from_epoch( epoch => time(), time_zone =>'Asia/Calcutta' );
	return build_timestr($dt);
}

sub build_timestr
{
	my $dt = shift;
	my $year = $dt->year;
	my $month = $dt->month;
	my $day = $dt->day;
	my $hour = $dt->hour;
	my $minute = $dt->minute;
	my $second = $dt->second;
	return "$year-$month-$day.$hour:$minute:$second";
}

sub parse_timestr
{
	my $str = shift;
	if ($str =~ /^(\d+)-(\d+)-(\d+)\.(\d+):(\d+):(\d+)$/) {
		my $year = $1;
		my $month = $2;
		my $day = $3;
		my $hour = $4;
		my $minute = $5;
		my $second = $6;
		my $dt = DateTime->new(
			year       => $year,
			month      => $month,
			day        => $day,
			hour       => $hour,
			minute     => $minute,
			second     => $second,
			time_zone  => 'Asia/Calcutta',
		);
		return $dt;
	} else {
		print "FATAL: Could not parse datetime: '$str'\n";
		exit(1);
	}
}

sub timestr_diff_hours
{
	my $astr = shift;
	my $bstr = shift;


	my $adate = parse_timestr($astr);
	my $bdate = parse_timestr($bstr);

	if (DateTime->compare( $adate, $bdate ) < 0) {
		return 0;
	}

	my $duration = $adate->subtract_datetime_absolute($bdate);
	my $delta_hours = int($duration->seconds / 3600);
	
	#print "timestr_diff_hours($astr, $bstr) = $delta_hours\n";
	return $delta_hours;
}

sub suid_copy {
	my $src = shift;
	my $src_uid = shift;
	my $dst = shift;
	my $dst_uid = shift;

	my $cur_uid = geteuid();
	$dst = untaint($dst);
	$src = untaint($src);
	setuid($dst_uid);
	if ($dst =~ /^(\S*)\/[^\/]*$/) {
		my $dirpath = $1;
		if (!(-e $dirpath)) {
			mkpath($dirpath);
		}
	}
	open(my $dst_fp, ">$dst") or die "Could not open '$dst': $!\n";
	setuid($src_uid);
	open(my $src_fp, "<$src") or die "Could not open '$src': $!\n";
	my ($buf, $data, $n);
	while (($n = read($src_fp, $data, 4096)) != 0) {
		setuid($dst_uid);
		print $dst_fp $data;
		setuid($src_uid);
	}
	close($src_fp);
	setuid($dst_uid);
	close($dst_fp);
	setuid($cur_uid);
}

sub suid_copy_dir {
	my $srcdir = shift;
	my $src_uid = shift;
	my $dstdir = shift;
	my $dst_uid = shift;

	setuid($src_uid);
	my @all_files = recursively_add_files("$srcdir/", 0);
	foreach my $file (@all_files) {
		#print "file = '$file'\n";
		my $dstfile;
		if ($file =~ /$srcdir\/(.*)$/) {
			$dstfile = "$dstdir/$1";
		} else {
			print "FATAL: could not parse pathname: '$file'\n";
			exit(1);
		}
		suid_copy($file, $src_uid, $dstfile, $dst_uid);
	}
}


sub untaint {
	my $arg = shift;
	if ($arg =~ /^(.*)$/) {
		return $1;
	} else {
		print "FATAL: untaint supplied with argument containing space: '$arg'\n";
		exit(1);
	}
}

sub recursively_add_files {
	my $curdir = shift;
	my $depth = shift;
	my $include_dirs = shift;
	my @files = ();
	if ($depth > $MAX_DIR_DEPTH) {
		print "Directory '$curdir' too deep (depth $depth). Max allowed: $MAX_DIR_DEPTH. Submission NOT made.\n";
		exit(1);
	}
	opendir(my $cwd, $curdir) or die "opendir($curdir) failed: $!\n";
	foreach my $dirent (readdir($cwd)) {
		if (!(-d "$curdir$dirent")) {
			my $filename;
			if ($curdir =~ /^\.\/(\S*)/) {
				$filename = "$1$dirent";
			} else {
				$filename = "$curdir$dirent";
			}
			#print "pushing '$filename'\n";
			#push (@files, "$curdir$dirent") ;
			push (@files, "$filename") ;
		} elsif ($dirent ne "." && $dirent ne "..") {
			if ($include_dirs) {
				push (@files, "$curdir$dirent");
			}
			push (@files, recursively_add_files("$curdir$dirent/", $depth + 1, $include_dirs));
		}
	}
	closedir($cwd);
	return @files;
}

sub xsystem {
	my $command = shift;
	#print "calling system($command)\n";
	my $exitcode = system($command);

	if (WIFSIGNALED($exitcode)) {
		print "Interrupted by ";
		switch (WTERMSIG($exitcode)) {
			case SIGINT   { print "SIGINT" }
			case SIGSEGV    { print "SIGSEGV" }
			case SIGABRT    { print "SIGABRT" }
		}
		print " signal.\n";
		return -1;
	}
	if (WIFEXITED($exitcode)) {
		return WEXITSTATUS($exitcode);
	}
	die "FATAL: system() neither interrupted nor exited.\n";
}

sub get_submission_details
{
	my $subdir = shift;

	if (!(-e $subdir)) {
		print "FATAL: $subdir does not exist\n";
		exit(1);
	}
	my $group_name;
	my @group_names;
	my $group_submission_dir = abs_path($subdir);
	if ($group_submission_dir =~ /grp\.([^\/]*)/) {
		$group_name = $1;
	} else {
		print "Could not parse submission dir: $group_submission_dir\n";
		exit(1);
	}

	while ($group_name =~ /^(\D[^\.]*)\.(.*)$/) {
		my $userid = $1;
		$group_name = $2;
		push (@group_names, $userid);
	}

	my $timestr;
	if ($group_name =~ /(20..-.*)$/) {
		$timestr = $1;
	} else {
		print "Could not parse submission dir for timestr: $group_submission_dir\n";
	}
	return (\@group_names, $timestr);
}

sub roundoff {
	my $x = shift;
	return int($x*100)/100;
}


1;

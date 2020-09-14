#!/usr/bin/perl -w

use strict;
use warnings;
use lib "/home/faculty/sbansal/public_html/";
use Date::Calc qw(Day_of_Week Add_Delta_Days);


our @months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep",
		"Oct", "Nov", "Dec");
our @days = ("Monday", "Tuesday", "Wednesday", "Thursday", "Friday",
	"Saturday", "Sunday");

#Global data
our @start_date;
our @stop_date;
our $start_year;
our @schedule_days;
our @lab_desc = ();
our @lab_start = ();
our @lab_stop = ();
our @holidays = ();
our @holidays_reasons = ();
our @skipped_days = ();
our @skipped_days_reasons = ();
our @events = ();
our @event_descriptions = ();
our @lec_title;
our @lec_prep;
our @lec_book;
our $header = "";
our $footer = "";
our $title = "";
our $semester = "";

#temporary data
our $lec_num = -1;
our $cur_lec_num = -1;

read_schedule();
output_html();

sub read_schedule {
	open(my $in, "<schedule.txt");
	while (my $line = <$in>) {
		if ($line =~ /Start: (.*)$/) {
			@start_date = parse_date($1);
    } elsif ($line =~ /Stop: (.*)$/) {
			@stop_date = parse_date($1);
			#} elsif ($line =~ /Schedule: ([^,]*), ([^,]*), ([^,]*)$/) {
		} elsif ($line =~ /Schedule: (.*)$/) {
			my $schedule_line = $1;
			my $num_days = 0;
			while ($schedule_line =~ /^([^,]*), (.*)$/) {
				$schedule_days[$num_days] = $1;
				$num_days++;
				$schedule_line = $2;
			}
			chomp($schedule_line);
			$schedule_days[$num_days] = $schedule_line;
		} elsif ($line =~ /^==/) {
			clear_temp_data();
		} elsif ($line =~ /Lab (\d*):/) {
			chomp($line);
			push(@lab_desc, $line);
		} elsif ($line =~ /OUT: (.*)$/) {
			my $date_str = $1;
			chomp($date_str);
			push(@lab_start, $date_str);
		} elsif ($line =~ /DUE: (.*)$/) {
			my $date_str = $1;
			chomp($date_str);
			push(@lab_stop, $date_str);
		} elsif ($line =~ /^LEC: (.*)$/) {
			my $lec_name = $1;
			$lec_num++;
			chomp($lec_name);
			$lec_title[$lec_num] = $lec_name;
			$lec_prep[$lec_num] = "";
			$lec_book[$lec_num] = "";
		} elsif ($line =~ /^PREP: (.*)$/) {
			my $date_str = $1;
			chomp($date_str);
			$lec_prep[$lec_num] = $date_str;
		} elsif ($line =~ /^OSC: (.*)$/) {
			my $date_str = $1;
			chomp($date_str);
			$lec_book[$lec_num] = $date_str;
		} elsif ($line =~ /^SKIP: ([^\.]*)\. (.*)$/) {
			my $skipped_days_reason = $2;
			chomp($skipped_days_reason);
			push(@skipped_days, $1);
			push(@skipped_days_reasons, $skipped_days_reason);
		} elsif ($line =~ /^EVENT: ([^\.]*)\. (.*)$/) {
			my $event_description = $2;
			chomp($event_description);
			push(@events, $1);
			push(@event_descriptions, $event_description);
		} elsif ($line =~ /^HEADER: (.*)$/) {
			$header = $1;
			chomp($header);
		} elsif ($line =~ /^FOOTER: (.*)$/) {
			$footer = $1;
			chomp($footer);
		} elsif ($line =~ /^TITLE: (.*)$/) {
			$title = $1;
			chomp($title);
		} elsif ($line =~ /^SEMESTER: (.*)$/) {
			$semester = $1;
			chomp($semester);
		} elsif ($line =~ /^HOLIDAY: ([^\.]*)\. (.*)$/) {
			my $holidays_reason = $2;
			chomp($holidays_reason);
			push(@holidays, $1);
			push(@holidays_reasons, $holidays_reason);
		}
	}
	close($in);
}

sub parse_date {
	my $str = shift;
	my ($date, $month, $year);
	if ($str =~ /^(...) (\d\d?), (\d\d\d\d)/) {
		$date = $2;
		$year = $3;
		$month = get_month($1);
		if (!(defined $start_year) || $start_year < $year) {
		 	$start_year = $year;
		}
	} elsif ($str =~ /^(...) (\d\d?)/) {
		defined $start_year or die "Start year not defined while parsing $str\n";
		$date = $2;
		$month = get_month($1);
		$year = $start_year;
                #print "date = $date, month = $month, year = $year\n";
	} else {
		die "Unrecognized date string: $str\n";
	}
	return ($year, $month, $date);
}

sub get_month {
  my $str = shift;
	for (my $i = 0; $i < 12; $i++) {
		if ($str eq $months[$i]) {
			return ($i+1);
		}
	}
	die "not-reached.";
}

sub clear_temp_data {
}

sub output_html {
	open(my $out, ">schedule.html");

	print $out "<title>$title</title>\n";
	print $out "<h1><font color=blue>$title</font></h1>\n";
	print $out "<h2><i>$semester</i></h2>\n";

	print $out "$header\n";
	print $out "<table border=\"1\"><tr bgcolor=yellow>\n";
	print $out "<th>Monday</th><th>Tuesday</th><th>Wednesday</th><th>Thursday</th><th>Friday</th>\n";
  print $out "</tr>\n";
  defined $start_date[0] or die;
	my $start_day = Day_of_Week(@start_date);
  my @week_start = Add_Delta_Days(@start_date, 1 - $start_day);
  my @week_end = Add_Delta_Days(@week_start, 5);
  do {
    print $out "<tr>\n";
    for (my $d = 0; $d < 5; $d++) {
      my @d_date = Add_Delta_Days(@week_start, $d);
      if (date_compare(@d_date, @start_date) >= 0) {
				output_working_day($out, $d, @d_date);
      } else {
				my $d_str = get_date_string_short(@d_date);
				print $out "<td>$d_str</td>";
			}
    }
    print $out "</tr>\n";
    @week_start = Add_Delta_Days(@week_end, 2);
    @week_end = Add_Delta_Days(@week_start, 5);
  } while (date_compare(@week_start, @stop_date) < 0);
  print $out "</table>\n";

	print $out "$footer";
	close $out;
}

sub date_compare {
  my $d1y = shift;
  my $d1m = shift;
  my $d1d = shift;
  my $d2y = shift;
  my $d2m = shift;
  my $d2d = shift;

  if ($d1y != $d2y) {
    return $d1y - $d2y;
  }
  if ($d1m != $d2m) {
    return $d1m - $d2m;
  }
  if ($d1d != $d2d) {
    return $d1d - $d2d;
  }
  return 0;
}

sub get_date_string_short {
  my $year = shift;
  my $month = shift;
  my $date = shift;
  my $month_str = $months[$month - 1];
  return "<i>$month_str $date</i>";
}

sub is_lecture_day {
	my $day = shift;

	foreach my $sd (@schedule_days) {
		if ($sd eq $day) {
			return 1;
		}
	}
	return 0;
}

sub output_working_day {
	my $out = shift;
	my $d = shift;
	my $year = shift;
	my $month = shift;
	my $date = shift;
	my $day = $days[$d];
	if (is_lecture_day($day) && $cur_lec_num < $lec_num) {
		if (my $hn = is_one_of_the_days(\@holidays, $year, $month, $date)) {
			my $d_str = get_date_string_short($year, $month, $date);
			my $reason = $holidays_reasons[$hn-1];
			print $out "<td>$d_str<br><font color=green><b>$reason</b></font><br>";
		} elsif (my $sn = is_one_of_the_days(\@skipped_days, $year, $month, $date)) {
			my $d_str = get_date_string_short($year, $month, $date);
			my $reason = $skipped_days_reasons[$sn-1];
			print $out "<td>$d_str<br>$reason<br>";
		} else {
			my $d_str = get_date_string_short($year, $month, $date);
			$cur_lec_num++;
			my $title = $lec_title[$cur_lec_num];
			my $prep = $lec_prep[$cur_lec_num];
			my $book = $lec_book[$cur_lec_num];
			#print "lec_num=$cur_lec_num; title = $title; prep=$prep; book=$book.\n";
			print $out "<td>$d_str<br>$title<br>";
			if ($prep ne "") {
				print $out "<font color=\"#cc6600\"><b>PREP</b></font>: $prep<br>";
			}
			if ($book ne "") {
				print $out "SG: $book<br>";
			}
		}
		if (my $ln = is_one_of_the_days(\@lab_start, $year, $month, $date)) {
			my $ldesc = $lab_desc[$ln-1];
			print $out "<b>OUT</b>: $ldesc<br>";
		}
		if (my $ln = is_one_of_the_days(\@lab_stop, $year, $month, $date)) {
			print $out "<font color=red><b>DUE</b></font>: Lab $ln<br>";
		}
		if (my $ln = is_one_of_the_days(\@events, $year, $month, $date)) {
			my $event_description = $event_descriptions[$ln-1];
			print $out "<em>$event_description</em><br>";
		}
		print $out "</td>";
	} else {
		my $d_str = get_date_string_short($year, $month, $date);
		print $out "<td>$d_str<br>";
		if (my $ln = is_one_of_the_days(\@lab_start, $year, $month, $date)) {
			my $ldesc = $lab_desc[$ln];
			print $out "<b>OUT</b>: $ldesc<br>";
		}
		if (my $ln = is_one_of_the_days(\@lab_stop, $year, $month, $date)) {
			print $out "<font color=red><b>DUE</b></font>: Lab $ln<br>";
		}
		print $out "</td>";
	}
}


sub is_one_of_the_days {
	my $date_array = shift;
	my $year = shift;
	my $month = shift;
	my $date = shift;
	my $ret = 1;

	foreach my $date_str (@$date_array) {
		my @date = parse_date($date_str);
		if (date_compare(@date, $year, $month, $date) == 0) {
			return $ret;
		}
		$ret++;
	}
	return 0;
}

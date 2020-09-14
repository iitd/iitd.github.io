#!/usr/bin/perl
use strict;
use warnings;
use v5.10; # for say() function

use DBI;

#config params
#my $adm_year_of_interest = "20182019";
my @adm_years_of_interest = ("20142015", "20152016", "20162017", "20172018", "20182019");
my @courses = ('COL100', 'MTL100'); #'ELL100', 'MTL101'
our %instructor = ( 'COL100-20142015-2', 'Prem Kalra and Preeti Ranjan Panda', 'COL100-20152016-1', 'Smruti Ranjan Sarangi and K.K. Biswas', 'COL100-20152016-2', 'Prem Kalra and Preeti Ranjan Panda', 'COL100-20172018-1', 'Vinay Ribeiro and Rahul Garg', 'COL100-20172018-2', 'Kolin Paul and Maya Ramanath', 'COL100-20162017-1', 'Aaditeshwar Seth and Smruti Ranjan Sarangi', 'COL100-20162017-2', 'Huzur Saran and Subodh Kumar', 'COL100-20142015-1', 'Sanjiva Prasad and Amitabha Bagchi', 'COL100-20182019-1', 'Parag Singla and Sorav Bansal');
our %webpage = ( 'COL100-20172018-1', 'http://www.cse.iitd.ernet.in/~akashdeep/col100/', 'COL100-20162017-1', 'http://www.cse.iitd.ernet.in/~aseth/col100/col100.html', 'COL100-20142015-1', 'http://www.cse.iitd.ac.in/~mansureh/COL100.htm', 'COL100-20182019-1', 'http://iitd-plos.github.io/col100' );

#MySQL database configuration
my $dsn = "DBI:mysql:academics";
my $username = "root";
my $password = 'onsjmd@123';

# connect to MySQL database
my %attr = ( PrintError=>0,  # turn off error reporting via warn()
             RaiseError=>1);   # turn on error reporting via die()           
 
our $dbh  = DBI->connect($dsn,$username,$password, \%attr);
#say "Connected to the MySQL database.";
print "<h1>Analysis of COL100 student grade data vis-a-vis prior CS exposure</h1>\n";
#print "by Sorav Bansal (for COL100 Oversight Committee)<br>\n";
print "<p><b>Analysis reports prepared by Suban</b><ol>\n";
print "<li><a href=http://10.10.111.112/plots/CS/>http://10.10.111.112/plots/CS/</a>: this set of analyses seems to purport that prior CS exposure is positively correlated with COL100 grade, and so there may be a causal relation between the two.</li>\n";
print "<li><a href=http://10.10.111.112/plots/CS/COL100-semI-2018-2019/>http://10.10.111.112/plots/CS/COL100-semI-2018-2019/</a>: this set of results is for COL100 offering in the first semester of 2018-2019; however prior CS exposure data is not used in this analysis; not sure what to make of this.</li>\n";
print "<li>Some high-level curriculum analyses (I could not find their relevance to our current discussion on COL100):<ol type='a'><li>
    The executive summary of the study conducted by Ravinder Kaur (commissioned by the Director): <a href=http://10.10.111.112/plots/execsummary.pdf>http://10.10.111.112/plots/execsummary.pdf</a></li>
    <li>Data analysis part of the study: <a href=http://10.10.111.112/plots/quant.pdf>http://10.10.111.112/plots/quant.pdf</a></li><li><a href=http://10.10.111.112/plots/jee-regressions/>http://10.10.111.112/plots/jee-regressions/</a></li><li><a href=http://10.10.111.112/plots/regression/reg_log1.pdf>http://10.10.111.112/plots/regression/reg_log1.pdf</a></li></ol></li>\n";
print "</ol>\n";
print "<p><b>Purpose of the data analysis study</b><ol>\n";
print "<li>Is it true that prior CS exposure in Class XII presents a significant statistical advantage to students in COL100?  Because we do not have other data to conclusively differentiate causal relations from correlations, we intend to base our analysis on a comparative study of the correlations for COL100 and MTL100 grades; the premise is that if prior CS exposure is presenting an unfair advantage to students in COL100, the correlations should be specific to COL100.</li>\n";
print "<li>Any other insights to be drawn from the data.</li>\n";
print "</ol>\n";
print "<p><b>Method</b><ul>\n";
print "<li>We have prior CS exposure data for students who entered IITD in 2014, 2015, 2016, 2017, and 2018.</li>\n";
print "<li>We have grade data for COL100 and MTL100 in first and second semesters of 2014-2015, 2015-2016, 2016-2017, 2017-2018. For 2018-2019, we have grade data only for the first semester.</li>\n";
print "<li>We try and compare the grades of students with-prior-CS-exposure with the grades of students without-prior-CS-exposure in both COL100 and MTL100, to try and see if (1) a correlation exists between prior-CS-exposure and COL100 grades, and (2) whether the correlation is unique to COL100. If both (1) and (2) are true, this would be significant statistical evidence that COL100 grade is causally related to prior CS exposure.</li>\n";
print "<li>Just to be completely sure, we also tried to see the statistics after removing all students who received a D or less (E/F/W/NF) while computing percentages (see columns titled non-weak students). Mostly, the correlations remain largely similar, irrespective of whether we consider the weak students or not.</li>\n";
print "</ul>\n";
print "See some simple conclusions that can be drawn from this data at the end of the page<br>\n";
#print "<p><b>Facts based on data below</b> (I hope we can agree on them):<ol>\n";
#print "<li>I could only find prior-CS-exposure data for 2014-entry and 2015-entry students (confirmed by Suban).</li>\n";
#print "<li>There is a clear correlation between prior-CS-exposure and final COL100 grade (confirms Suban's results)</li>\n";
#print "<li>However, there is also a clear correlation between prior-CS-exposure and final MTL100 grades.  I picked another first-year course (MTL100) to see if the correlation is unique to COL100 or not.</li>\n";
#print "<li>I do see slightly higher correlations for COL100 (than MTL100), say a few percentage points here or there, but nothing significant.</li>\n";
#print "<li>The fact that both MTL100 and COL100 show similar correlations with prior-CS-exposure is clear evidence that the correlations are not causal. <b>In fact there is no evidence that prior CS exposure presents a statistically significant advantage to students for COL100 specifically.</b> (something I find surprising).</li>\n";
#print "</ol>\n";
#print "<p><b>My (humble) inferences and opinions</b>:<ol type=\"a\">\n";
#print "<li>For COL100 (and for all other courses actually), it is very clear that we get two categories of students based on their socio-economic backgrounds; let's call them \"haves\" and \"have-nots\" for lack of a better terminology. This categorization is not just based on this data, but also based on my experience teaching several subjects over the past around ten years at IITD. Perhaps the haves have better access to resources, teachers, exposure, etc., I cannot say.</li>\n";
#print "<li>A fair treatment should involve separate handling of these two categories of students; the have-nots should be started with more introductory material, while the haves can be started at a more advanced level. As far as I can tell, all of us agree on this aspect of our intake</li>\n";
#print "<li>However, there are several practical issues with this, the most of important of which IMHO is: how do we distinguish the two categories; we need to worry about both precision and also care about being politically and socially correct in our categorization. Doing this practically in a curriculum-wide manner seems too hard to even attempt.</li>\n";
#print "<li>This is the exact same effect that is playing out for COL100 too; but COL100 is definitely not unique in witnessing this effect. The data below shows that MTL100 has the exact same issue, and I would not be surprised at all if more courses show the same issue.</li>\n";
#print "<li>It just so happens that the two categories are also correlated with their typical class XII subjects; in particular, the haves seem to have more percentage of people who take CS in class XII. But treating these correlations as causal effects is wrong, as seen through MTL data: even though their class XII CS course has nothing to do with MTL100 syllabus, students with prior CS exposure still seem to score higher on MTL100. In my opinion, this indicates that it is not their CS exposure but other issues that have causal effects both on their class XII subjects and their grades in IIT courses.</li>\n";
#print "<li>At this point, I will not argue against a two-step COL100. However, if COL100 is made two-step, IMHO the criteria for deciding who needs one step vs. who needs two steps, cannot be based on their prior CS exposure, as we have just established that prior CS exposure is an incidentally correlated effect and not a cause for their COL100 performance.\n";
#print "<ul><li>To use a crude analogy, let's say that in the context of reservation, the government is interested in supporting historically oppressed sections of the society; it also so happens that the oppressed sections of the society have shorter height on average, due to some nutritional correlation; based on this, should the government start making short height as the criteria for reservations? In other words, we should not fall into the trap of trying to cure the symptom and thus overlooking the cause.</li></ul>\n";
#print "</li>\n";
#print "<li>Finally: if COL100 is made two-step, IMHO we must also advocate MTL100 (and similarly other courses) to also be considered for making two-step in the same breath. Why should this be a COL100 specific issue?</li>\n";
#print "</ol>\n";
#print "Overall, based on the last two bullets, in my opinion, I really do not see why we should advocate a two-step CS introduction for a subset of students. If anything, we should at least get rid of arbitrary requirements like \"prior CS exposure\", and base it solely on a waiver test. But again, why just COL100?\n";

foreach my $year (@adm_years_of_interest) {
  my %with_cs_exposure;
  my %without_cs_exposure;
  my %cs_exposure_map;
  #there are duplicates in the mysql tables, so use associative arrays (not arrays)
  my %course_grade_inv;

  print "<h1><u>$year</u></h1>\n";
  print "<ul>\n";
  get_student_cs_exposure_data($year, \%cs_exposure_map, \%with_cs_exposure, \%without_cs_exposure);
  foreach my $sem ("1", "2") {
    if ($year eq "20182019" and $sem eq "2") {
      next;
    }
    get_course_offering_data($year, $sem, \%cs_exposure_map, \%with_cs_exposure, \%without_cs_exposure, \%course_grade_inv);
  }
  print "</ul>\n";
  draw_histogram_table($year, \%cs_exposure_map, \%with_cs_exposure, \%without_cs_exposure, \%course_grade_inv);
}

#say "Disconnecting from the MySQL database.";
$dbh->disconnect();

print "<h3>Some simple conclusions to be drawn</h3><ol>\n";
print "<li>The percentage of students with prior CS exposure in a single batch is 20-28\%, and this seems to be increasing gradually over the years.</li>\n";
print "<li>Since 2014-2015, all students with prior CS exposure do COL100 only in the second semester.</li>\n";
print "<li>While for some years (2014-2015 and 2015-2016), there is a strong correlation between prior-CS-exposure and COL100 grades, similar correlations (sometimes even stronger!) exist between prior-CS-exposure and MTL100 grades. Also, for other years, this correlation is quite weak (if at all), or is <i>negative</i> (2016-2017 and 2017-2018).<ul>\n";
print "<li>It seems hard to conclude from this data that COL100 grades are causally related to prior CS exposure. Even for 2014-2015 and 2015-2016 where the corelations are strong, the counter-reasoning is that while MTL100 syllabus has nothing to do with high-school CS syllabus, similar correlation still exists between prior CS exposure and MTL100 grades.  This probably suggests that there is perhaps some other socio-economic root cause that is causally related to both their Class XII subjects, and their performance in IIT curriculum.</li>\n";
print "<li>There seem to be large variations in the correlations across different years: e.g., in 2016-2017 and 2017-2018, the students <i>without</i> prior CS exposure actually seem to be doing <i>better</i> on A/A- grades than students with prior CS exposure!  This variation across different batches is surprising, and perhaps needs more investigation.</li>\n";
print "</ul></li>\n";
print "</ol>\n";

sub get_course_offering_data
{
  my $year = shift;
  my $sem = shift;
  my $cs_exposure_map_ref = shift;
  my $with_cs_exposure_ref = shift;
  my $without_cs_exposure_ref = shift;
  my $course_grades_inv_ref =  shift;
  #my %course_grades;
  my %cs_exposure_map = %$cs_exposure_map_ref;
  my %with_cs_exposure = %$with_cs_exposure_ref;
  my %without_cs_exposure = %$without_cs_exposure_ref;

  foreach my $course (@courses) {
    my %cgrades;
    my %cgrade_inv;
    get_course_grades($course, $year, $sem, \%cgrades, \%cgrade_inv);
    #$course_grades{$course} = \%cgrades;
    ${$course_grades_inv_ref}{$course} = \%cgrade_inv;
  }
}

sub draw_histogram_table
{
  my $year = shift;
  my $cs_exposure_map_ref = shift;
  my $with_cs_exposure_ref = shift;
  my $without_cs_exposure_ref = shift;
  my $course_grades_inv_ref =  shift;
  my %cs_exposure_map = %$cs_exposure_map_ref;
  my %with_cs_exposure = %$with_cs_exposure_ref;
  my %without_cs_exposure = %$without_cs_exposure_ref;


  my $num_with_cs_exposure = keys %with_cs_exposure;
  my $num_without_cs_exposure = keys %without_cs_exposure;

  foreach my $course (@courses) {
    draw_table_for_course($course, $year, $num_with_cs_exposure, $num_without_cs_exposure, \%cs_exposure_map, ${$course_grades_inv_ref}{$course});
  }
}

sub draw_table_for_course
{
  my $course = shift;
  my $year = shift;
  #my $sem = shift;
  my $num_with_cs_exposure = shift;
  my $num_without_cs_exposure = shift;
  my $cs_exposure_map_ref = shift;
  my %cs_exposure_map = %{$cs_exposure_map_ref};
  my $course_grade_inv_ref = shift;
  my %course_grade_inv = %$course_grade_inv_ref;

  my $num_students_ignore_d_and_lower = 0;
  my $num_with_cs_exposure_ignore_d_and_lower = 0;
  my $num_without_cs_exposure_ignore_d_and_lower = 0;
  foreach my $grade (sort cmp_grade (keys %course_grade_inv)) {
    if ($grade eq "D" || $grade eq "E" || $grade eq "F" || $grade eq "NF" || $grade eq "W") {
      next;
    }
    my @students_at_grade = @{$course_grade_inv{$grade}};
    foreach my $entrynum (@students_at_grade) {
      $num_students_ignore_d_and_lower++;
      if (not defined $cs_exposure_map{$entrynum}) {
        next;
      } elsif ($cs_exposure_map{$entrynum} eq "N") {
        $num_without_cs_exposure_ignore_d_and_lower++;
      } elsif ($cs_exposure_map{$entrynum} eq "Y") {
        $num_with_cs_exposure_ignore_d_and_lower++;
      } else {
        die "not-reached\n";
      }
    }
  }
  print "<h2>";
  print "$course in $year: ";
  for my $sem ("1", "2") {
    my $course_id_str = "$course-$year-$sem";
    if (defined $webpage{$course_id_str}) {
      print "<a href=\"$webpage{$course_id_str}\">";
    }
    print "Semester $sem";
    if (defined $instructor{$course_id_str}) {
      print " by $instructor{$course_id_str}";
    }
    if (defined $webpage{$course_id_str}) {
      print "</a>";
    }
    if ($sem eq "1") {
      print ", ";
    }
  }
  print "</h2>\n";
  print "<ul>\n";
  print "<li>Total number of students with grade &gt;= C- (non-weak): $num_students_ignore_d_and_lower</li>\n";
  print "<li>Total number of students with grade &gt;= C- (non-weak) and with prior CS exposure: $num_with_cs_exposure_ignore_d_and_lower</li>\n";
  print "<li>Total number of students with grade &gt;= C- (non-weak) and without prior CS exposure: $num_without_cs_exposure_ignore_d_and_lower</li>\n";
  print "</ul>\n";

  print "<table border=\"1\">\n";
  print "<tr bgcolor=yellow><th>Grade \"<b>G</b>\"</th><th>Number of students with prior CS exposure with grade \"G\"</th><th>Number of students without prior CS exposure with grade \"G\"</th><th>Number of students for whom prior-CS-exposure information was not available</th><th>Cumulative number of students (with grade &gt;= G) with prior CS exposure</th><th>Cumulative number of students (with grade &gt;= G) without prior CS exposure</th><th>Cumulative fraction of students with prior CS exposure and with grade &gt;= G, as a fraction of total number of students with prior CS exposure (%)</th><th>Cumulative fraction of students without CS exposure and with grade &gt;= G as fraction of total number of students without prior CS exposure (%)</th><th><b>Cumulative fraction of students with CS exposure and with grade &gt;= G as fraction of number of non-weak students (i.e. &gt;= C- grade in the course) with prior CS exposure (%)</b></th><th><b>Cumulative fraction of students without CS exposure and with grade &gt;= G as fraction of number of non-weak students (i.e. &gt;= C- grade in the course) without prior CS exposure (%)</b></th></tr>\n";
  my $cum_with_cs_exposure = 0;
  my $cum_without_cs_exposure = 0;
  foreach my $grade (sort cmp_grade (keys %course_grade_inv)) {
    my @students_at_grade = @{$course_grade_inv{$grade}};
    my $num_with_cs_exposure_at_grade = 0;
    my $num_without_cs_exposure_at_grade = 0;
    my $num_cs_exposure_info_not_available = 0;
    foreach my $entrynum (@students_at_grade) {
      if (not defined $cs_exposure_map{$entrynum}) {
        #print "cs_exposure info not available for $entrynum\n";
        $num_cs_exposure_info_not_available++;
        next;
      }
      if ($cs_exposure_map{$entrynum} eq "N") {
        $num_without_cs_exposure_at_grade++;
      } elsif ($cs_exposure_map{$entrynum} eq "Y") {
        $num_with_cs_exposure_at_grade++;
      } else {
        die "not-reached\n";
      }
    }
    $cum_with_cs_exposure += $num_with_cs_exposure_at_grade;
    $cum_without_cs_exposure += $num_without_cs_exposure_at_grade;
    my $cum_with_cs_exposure_fraction = ($cum_with_cs_exposure * 100)/$num_with_cs_exposure;
    my $cum_without_cs_exposure_fraction = ($cum_without_cs_exposure * 100)/$num_without_cs_exposure;

    my $cum_with_cs_exposure_fraction_of_non_weak = ($num_with_cs_exposure_ignore_d_and_lower == 0) ? 0 : ($cum_with_cs_exposure * 100)/$num_with_cs_exposure_ignore_d_and_lower;
    my $cum_without_cs_exposure_fraction_of_non_weak = ($num_without_cs_exposure_ignore_d_and_lower == 0) ? 0 : ($cum_without_cs_exposure * 100)/$num_without_cs_exposure_ignore_d_and_lower;
    #print "$grade : $num_with_cs_exposure_at_grade    $num_without_cs_exposure_at_grade    $num_cs_exposure_info_not_available\n";
    printf("<tr><td>$grade</td><td>$num_with_cs_exposure_at_grade</td><td>$num_without_cs_exposure_at_grade</td><td>$num_cs_exposure_info_not_available</td><td>$cum_with_cs_exposure</td><td>$cum_without_cs_exposure</td><td>%.2f</td><td>%.2f</td><td><b>%.2f</b></td><td><b>%.2f</b></td></tr>\n", $cum_with_cs_exposure_fraction, $cum_without_cs_exposure_fraction, $cum_with_cs_exposure_fraction_of_non_weak, $cum_without_cs_exposure_fraction_of_non_weak);
  }
  print "</table>\n";
}

sub get_student_cs_exposure_data
{
  my $year = shift;
  my $cs_exposure_map = shift;
  my $with_cs_exposure = shift;
  my $without_cs_exposure = shift;

  my $sql = "SELECT id,cs12th FROM student_cgpa_eng_gr_mcm_src where admyear=$year";
  my $sth = $dbh->prepare($sql);
  # execute the query
  $sth->execute();
  #my $n = 0;
  while(my @row = $sth->fetchrow_array()){
     #printf("%s\t%s\n",$row[0],$row[1]);
     if ($row[1] eq "N") {
       #push(@$without_cs_exposure, $row[0]);
       $$without_cs_exposure{$row[0]} = 1;
     } elsif ($row[1] eq "Y") {
       #push(@$with_cs_exposure, $row[0]);
       $$with_cs_exposure{$row[0]} = 1;
     } else {
       die "not-reached\n";
     }
     #push(@$all_students, $row[0]);
     $$cs_exposure_map{$row[0]} = $row[1];
     #$n++;
  }
  my $num_students = keys %$cs_exposure_map;
  my $num_with_cs_exposure = keys %$with_cs_exposure;
  my $num_without_cs_exposure = keys %$without_cs_exposure;
  #print "Total n in $year: $n\n";
  print "<li>Total number of students admitted: $num_students</li>\n";
  print "<li>Number of students with prior CS exposure in $year: $num_with_cs_exposure</li>\n";
  print "<li>Number of students without prior CS exposure in $year: $num_without_cs_exposure</li>\n";
  $sth->finish();
}

sub get_course_grades
{
  my $course = shift;
  my $year = shift;
  my $sem = shift;
  my $course_grade_map = shift;
  my $course_grade_inv_map = shift;

  #my $sql = "SELECT entryno,grade FROM course_grade where coucode='$course' and regyear='$year' and regsem='$sem'";
  my $sql = "SELECT entryno,grade FROM course_grade where coucode='$course' and regyear='$year'";
  my $sth = $dbh->prepare($sql);
  # execute the query
  $sth->execute();
  while(my @row = $sth->fetchrow_array()){
     #printf("%s\t%s\n",$row[0],$row[1]);
     $$course_grade_map{$row[0]} = $row[1];
  }
  foreach my $entrynum (keys %$course_grade_map) {
    my $grade = $$course_grade_map{$entrynum};
    if (not defined $$course_grade_inv_map{$grade}) {
      my @arr = ();
      $$course_grade_inv_map{$grade} = \@arr;
      #print "initing array for $grade\n";
      #my @arr2 = @$course_grade_inv_map{$grade};
      #print "arr size $#arr\n";
      #print "arr2 size $#arr2\n";
    }
    my @arr = @{${$course_grade_inv_map}{$grade}};
    #print "arr size $#arr\n";
    #my @new_arr = (@arr, $entrynum);
    push(@arr, $entrynum);
    #$$course_grade_inv_map{$grade} = \@new_arr;
    ${$course_grade_inv_map}{$grade} = \@arr;
    #print "pushed $entrynum to $grade. new arr size $#arr\n";
  }
  $sth->finish();
  my $num_students_in_course = keys %$course_grade_map;
  #print "<li>Total number of students who took $course in semester $sem: $num_students_in_course</li>\n";
  if ($sem eq "1") {
    print "<li>Total number of students who took $course in $year: $num_students_in_course</li>\n";
  }
  #foreach my $grade (sort cmp_grade (keys %$course_grade_inv_map)) {
  #  my @value = @{${$course_grade_inv_map}{$grade}};
  #  my $bucketsize = @value;
  #  print "Number of students with grade $grade: $bucketsize\n";
  #}
}

sub cmp_grade
{
  #my $a = shift;
  #my $b = shift;

  #print "a = $a, b = $b\n";
  if ($a eq $b) {
    return 0;
  }
  foreach my $grade ("A", "A-", "B", "B-", "C", "C-", "D", "NP", "E", "F", "W", "F", "NF") {
    if ($a eq $grade) {
      return -1;
    }
    if ($b eq $grade) {
      return 1;
    }
  }
  #print "a = $a, b = $b\n";
  die "not-reached\n";
}

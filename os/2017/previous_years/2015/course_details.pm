package course_details;

@ISA = qw(Exporter);
@EXPORT_OK = qw(%assignments @ec_assignments %max_marks %weights $grade_file %deadlines %max_late_day_penalty $num_free_late_days @tas %max_groupsize);

our @tas = (
	"mcs138294",     #karishma
	"aditya",        #aditya ahuja
	"dahiya",        #manjeet dahiya
	"deepak",        #deepak ravi
	"roopam",        #roopam saxena
	"cs5100282",     #dushyant behl
	"mcs132557",     #gaurav kumar banga
	"mcs132555",     #gaurav singh
	"cs5100301",     #vivek mittal
	"mcs132560",     #heena bansal
	"mcs142116",     #akshay jain
	"mcs142137",     #shashank
	"mcs132545",     #amit saha
	"sbansal"
);

our $grade_file = "/home/faculty/sbansal/public_html/os/grades/grade_file";

our %assignments = (
	"HW1", "HW1 (Jan 9)",
	"HW2", "HW2",
	"HW3", "HW3",
	"HW4", "HW4",
	"lab1", "Lab1 - Hello, Alice H",
	"lab2", "Lab2 - Shell",
	"lab3", "Lab3 - Preemption/SPSC",
	"lab4", "Lab4 - User Programs",
	"lab5", "Lab5 - Application",
	"Minor1", "Minor1",
	"Minor2", "Minor2",
	"Major", "Major",
);

our @ec_assignments = (
);

our $num_free_late_days = 10;

our %max_groupsize = (
	"lab1", 1,
	"lab2", 1,
	"lab3", 1,
	"lab4", 1,
	"lab5", 1,
);

our %deadlines = (
	"lab1", "2015-1-23.23:59:59",   #jan 23
	"lab2", "2015-2-10.23:59:59",   #Feb 10
	"lab3", "2015-4-01.23:59:59",   #Mar 29
	"lab4", "2015-4-15.23:59:59",   #Apr 30
	"lab5", "2015-5-01.23:59:59",   #Apr 30
);

our %max_late_day_penalty = (
	"lab1", 1,
	"lab2", 1,
	"lab3", 1,
	"lab4", 1,
	"lab5", 1,
);

our %max_marks = (
	"HW1", 20,
	"HW2", 30,
	"HW3", 40,
	"HW4", 30,
	"lab1", 20,
	"lab2", 50,
	"lab3", 50,
	"lab4", 80,
	"lab5", 40,
	"Minor1", 64,
	"Minor2", 68,
	"Major", 124,
);

our %weights = (
	"HW1", "best3-HW",
	"HW2", "best3-HW",
	"HW3", "best3-HW",
	"HW4", "best3-HW",
	"lab1", "2",
	"lab2", "5",
	"lab3", "6",
	"lab4", "9",
	"lab5", "5",
	"Minor1", "16",
	"Minor2", "17",
	"Major", "31",
	"best3-HW", 9,
);

1;

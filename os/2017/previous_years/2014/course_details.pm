package course_details;

@ISA = qw(Exporter);
@EXPORT_OK = qw(%assignments @ec_assignments %max_marks %weights $grade_file %deadlines %max_late_day_penalty $num_free_late_days @tas);

our @tas = (
	"mcs138294",     #karishma
	"mcs122823",     #aarti
	"mcs132584",     #soumen
	"mcs138296",     #rajesh
	"mcs122829",     #amit
	"mcs122845",     #pratyay mukhopadhyay
	"mcs122809",     #deepak
	"dahiya",        #manjeet dahiya
	"deepak",        #deepak ravi
	"prathmesh",     #prathmesh
	"cs5090243", #jatin
	"cs5090252", #shubham
	"cs5090234", #ankush
	"cs5090244", #keshav
	"sbansal"
);

our $grade_file = "/home/faculty/sbansal/public_html/os/grades/grade_file";

our %assignments = (
	"HW1", "HW1 (Jan 7)",
	"HW2", "HW2 (Jan 16)",
	"HW3", "HW3 (Jan 23)",
	"HW4", "HW4 (Feb 14)",
	"HW5", "HW5 (Feb 20)",
	"HW6", "HW6 (Apr 3)",
	"HW7", "HW7 (Apr 11)",
	"Lab1", "Lab1 - PIOS",
	"userprog", "pintos userprog",
	"vm", "pintos vm",
	"filesys", "pintos filesys",
	"Minor1", "Minor1",
	"Minor2", "Minor2",
	"Major", "Major",
);

our @ec_assignments = (
);

our $num_free_late_days = 10;

our %deadlines = (
	"lab1", "2014-2-03.23:59:59",   #jan 26
	"userprog", "2014-3-07.23:59:59",   #Feb 22
	"vm",      "2014-5-01.23:59:59",   #Mar 29
	"filesys", "2014-5-01.23:59:59",   #Apr 30
);

our %max_late_day_penalty = (
	"lab1", 3,
	"userprog", 3,
	"vm", 3,
	"filesys", 3,
);

our %max_marks = (
	"HW1", 20,
	"HW2", 20,
	"HW3", 30,
	"HW4", 20,
	"HW5", 20,
	"HW6", 20,
	"HW7", 20,
	"Lab1", 60,
	"userprog", 64,
	"vm", 64,
	"filesys", 64,
	"Minor1", 64,
	"Minor2", 68,
	"Major", 124,
);

our %weights = (
	"HW1", "best6-HW",
	"HW2", "best6-HW",
	"HW3", "best6-HW",
	"HW4", "best6-HW",
	"HW5", "best6-HW",
	"HW6", "best6-HW",
	"HW7", "best6-HW",
	"Lab1", "best3-lab",
	"userprog", "best3-lab",
	"vm", "best3-lab",
	"filesys", "best3-lab",
	"Minor1", "16",
	"Minor2", "17",
	"Major", "31",
	"best6-HW", 12,
	"best3-lab", 24,
);

1;

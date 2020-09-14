package csl373;

@ISA = qw(Exporter);
@EXPORT_OK = qw(%assignments @ec_assignments %max_marks %weights $grade_file %deadlines %max_late_day_penalty $num_free_late_days);

our $grade_file = "/home/faculty/sbansal/public_html/csl373/grades/grade_file";

our %assignments = (
	"HW1", "Homework 1 on setting up xv6",
	"HW2", "Homework 2",
	"HW3", "Homework 3",
	"HW4", "Homework 4",
	"HW5", "Homework 5",
	"HW6", "Homework 6",
	"HW7", "Homework 7",
	"Quiz1", "Quiz 1 on Function-call stack management",
	"Lab1", "Programming Assignment 1 on IPC",
	"threads", "Programming Assignment 2 on Pintos threads",
	"userprog", "Programming Assignment 3 on Pintos userprog",
	"vm", "Programming Assignment 4 on Pintos vm",
	"vm-sharing", "VM Extra Credit (Page Sharing)",
	"filesys", "Programming Assignment 5 on Pintos filesys",
	"fs-vm", "Enabling both filesys and VM simultaneously",
	"Minor1", "Minor 1",
	"Minor2", "Minor 2",
	"Major", "Major",
	"ec-qemu", "Extra credit showing why qemu was slower on some machines"
);

our @ec_assignments = (
	"vm-sharing",
	"fs-vm",
	"ec-qemu"
);

our $num_free_late_days = 10;

our %deadlines = (
	"threads", "2011-2-11.23:59:59",   #Feb 11
	"userprog", "2011-2-25.23:59:59",   #Feb 25
	"vm",      "2011-3-28.23:59:59",   #Mar 28
	"filesys", "2011-4-22.23:59:59",   #Apr 22
);

our %max_late_day_penalty = (
	"threads", 5,
	"userprog", 5,
	"vm", 5,
	"filesys", 5,
);

our %max_marks = (
	"HW1", 10,
	"HW2", 10,
	"HW3", 10,
	"HW4", 10,
	"HW5", 10,
	"HW6", 20,
	"HW7", 10,
	"Quiz1", 2,
	"Lab1", 10,
	"threads", 32,
	"userprog", 32,
	"vm", 32,
	"vm-sharing", 8,
	"filesys", 32,
	"fs-vm", 1,
	"Minor1", 36,
	"Minor2", 10,
	"Major", 100,
	"ec-qemu", 2,
);

our %weights = (
	"HW1", "1.75",
	"HW2", "1.5",
	"HW3", "1.5",
	"HW4", "1.5",
	"HW5", "1.5",
	"HW6", "4",
	"HW7", "2",
	"Quiz1", "0.25",
	"Lab1", "3",
	"threads", "8",
	"userprog", "8",
	"vm", "8",
	"vm-sharing", "2",
	"filesys", "8",
	"fs-vm", 1,
	"Minor1", "18",
	"Minor2", 6,
	"Major", "27",
	"ec-qemu", 2,
);

1;

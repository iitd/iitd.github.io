package csl373;

@ISA = qw(Exporter);
@EXPORT_OK = qw(%assignments @ec_assignments %max_marks %weights $grade_file %deadlines %max_late_day_penalty $num_free_late_days);

our $grade_file = "/home/faculty/sbansal/public_html/csl373/grades/grade_file";

our %assignments = (
	"HW1", "Homework 1",
	"HW2", "Homework 2",
	"HW3", "Homework 3",
	"HW4", "Homework 4",
	"HW5", "Homework 5",
	"HW6", "Homework 6",
	"HW7", "Homework 7",
	#"Quiz1", "Quiz 1 on Function-call stack management",
	"Lab1", "Lab1 on PIOS",
	"Lab1-ec", "Lab1 on PIOS Extra Credit",
	#"threads", "Programming Assignment 2 on Pintos threads",
	"userprog", "Lab2 on Pintos userprog",
	"vm", "Lab3 on Pintos vm",
	"vm-sharing", "VM Extra Credit (Page Sharing)",
	"filesys", "Lab4 on Pintos filesys",
	#"fs-vm", "Enabling both filesys and VM simultaneously",
	"Minor1", "Minor 1",
	"Minor2", "Minor 2",
	"Major", "Major"
	#"ec-qemu", "Extra credit showing why qemu was slower on some machines"
);

our @ec_assignments = (
	"vm-sharing",
	"fs-vm",
	"ec-qemu"
);

our $num_free_late_days = 15;

our %deadlines = (
	"lab1", "2012-1-16.23:59:59",   #jan 26
	"userprog", "2012-2-17.23:59:59",   #Feb 16
	"vm",      "2012-3-20.23:59:59",   #Mar 20
	"filesys", "2012-4-30.23:59:59",   #Apr 30
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
	"HW5", 12,
	"HW6", 10,
	"HW7", 10,
	"Quiz1", 2,
	"Lab1", 10,
	"Lab1-ec", 2,
	"threads", 32,
	"userprog", 32,
	"vm", 32,
	"vm-sharing", 8,
	"filesys", 32,
	"fs-vm", 1,
	"Minor1", 28,
	"Minor2", 28,
	"Major", 60,
	"ec-qemu", 2,
);

our %weights = (
	"HW1", "1.75",
	"HW2", "1.75",
	"HW3", "2.5",
	"HW4", "2.0",
	"HW5", "2.0",
	"HW6", "2.0",
	"Quiz1", "0.25",
	"Lab1", "6",
	"Lab1-ec", "0.2",
	"userprog", "8",
	"vm", "8",
	"vm-sharing", "2",
	"filesys", "8",
	"fs-vm", 1,
	"Minor1", "14",
	"Minor2", 14,
	"Major", "30",
	"ec-qemu", 2,
);

1;

#include <stdio.h>
#include <stdlib.h>
#include "script_path.h"

int
main(int argc, char **argv)
{
	if (argc != 3) {
		printf("Usage: get-submission <login-id> <lab-id>\ne.g., get-submission sbansal lab1\n");
		exit(1);
	}
	char command[4096];
	snprintf(command, sizeof command, "/usr/bin/perl %s/get-submission.pl %s %s", script_path, argv[1], argv[2]);
	command[4095] = '\0';
	system(command);
}

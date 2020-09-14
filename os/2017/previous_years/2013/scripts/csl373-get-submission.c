#include <stdio.h>
#include <stdlib.h>
#include "include.h"

int
main(int argc, char **argv)
{
	if (argc != 3) {
		printf("Usage: csl373-get-submission <login-id> <lab-id>\ne.g., csl373-get-submission sbansal lab1\n");
		exit(1);
	}
	char command[4096];
	snprintf(command, sizeof command, "/usr/bin/perl %s/csl373-get-submission.pl %s %s", script_path, argv[1], argv[2]);
	command[4095] = '\0';
	system(command);
}

#include <stdio.h>
#include <stdlib.h>
#include "include.h"

int
main(void)
{
  char command[4096];
  snprintf(command, sizeof command, "/usr/bin/perl %s/csl373-ta-script.pl", script_path);
  command[4095] = '\0';
  system(command);
}

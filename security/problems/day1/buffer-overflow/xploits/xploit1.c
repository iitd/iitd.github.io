#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "shellcode.h"

#define TARGET "/tmp/target1"

int main(void)
{
  char arg1[265];
  char const* str = "I love building simple systems that do complex tasks";
  strncpy(arg1, str, sizeof arg1);
  int i = strlen(str);
  arg1[i++] = '\0'; //commenting this line causes the target program to crash due to a segmentation fault
  for (; i < 265; i++) {
    arg1[i] = '.';
  }
  arg1[i++] = '\0';
  char *args[] = { TARGET, arg1, NULL };
  char *env[] = { NULL };

  execve(TARGET, args, env);
  fprintf(stderr, "execve failed.\n");

  return 0;
}

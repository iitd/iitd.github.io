#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(int argc, char *argv[])
{
  if (argc != 3) {
    printf("Usage: target1 <filename> <string-to-write>\n");
    exit(1);
  }
  if (access(argv[1], W_OK) != 0) {
    //printf("Could not access filename '%s'\n", argv[1]);
    exit(1);
  }
  int fd = open(argv[1], O_WRONLY);
  write(fd, argv[2], strlen(argv[2]));
  //printf("Successfully written '%s' to filename'%s'\n", argv[2], argv[1]);
  return 0;
}

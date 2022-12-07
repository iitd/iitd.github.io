#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int main(int argc, char *argv[])
{
  if (argc != 2) {
    printf("Usage: target2 <template-prefix> <string-to-write>\n");
    exit(1);
  }
  if (strlen(argv[1]) >= 120) {
    printf("Template pattern too long.\n");
    exit(1);
  }
  char template[128];
  snprintf(template, sizeof template, "%s.XXXXXX", argv[1]);
  char* tmpfile_name = mktemp(template);
  int fd = open(tmpfile_name, O_WRONLY);
  write(fd, argv[2], strlen(argv[2]));
  close(fd);
  return 0;
}

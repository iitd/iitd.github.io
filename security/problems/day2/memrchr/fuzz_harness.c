#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <assert.h>

int fuzz_harness(int argc, char** argv, char* line, int* c, size_t* n)
{
  char* filename;
  FILE *fp;

  if (argc != 2) {
    fprintf(stderr, "%s <input-file>\n", argv[0]);
    return 1;
  }
  filename = argv[1];
  fp = fopen(filename, "r"); /* should check the result */
  if (!fp) {
    fprintf(stderr, "Error opening file %s\n", filename);
    return 1;
  }

  int linenum = 0;
  bool eof = !fgets(line, sizeof(line), fp);
  if (eof) {
    fprintf(stderr, "Premature end of file.\n");
    return 1;
  }
  char* newline = strchr(line, '\n');
  if (!newline) {
    fprintf(stderr, "String greater than 255 characters not supported.\n");
    return 1;
  }
  *newline = '\0';

  char cstr[16];
  eof = !fgets(cstr, sizeof(cstr), fp);
  if (eof) {
    fprintf(stderr, "Premature end of file.\n");
    return 1;
  }
  if (!strchr(cstr, '\n')) {
    fprintf(stderr, "Character C greater than 16 characters not supported.\n");
    return 1;
  }
  *c = cstr[0];

  char nstr[16];
  eof = !fgets(nstr, sizeof(nstr), fp);
  if (eof) {
    fprintf(stderr, "Premature end of file.\n");
    return 1;
  }
  if (!strchr(nstr, '\n')) {
    fprintf(stderr, "Size N greater than 16 characters not supported.\n");
    return 1;
  }
  *n = atoi(nstr);
  if (*n >= sizeof line) {
    fprintf(stderr, "n too large.\n");
    return 1;
  }

  printf("s (%p) = %s. c = %c (%hhx, %hx). n = %zd.\n", line, line, *c, *c, *c, *n);
  printf("s = ");
  for (int i = 0; line[i]; i++) {
    printf(" %hhx", line[i]);
  }
  printf("\n");
  return 0;
}

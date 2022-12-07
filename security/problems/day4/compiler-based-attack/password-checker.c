#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>
#include <unistd.h>

extern size_t delay_count;

int
check_password(char const* entered_password, char const* correct_password)
{
  size_t elen = strlen(entered_password);
  size_t clen = strlen(correct_password);
  size_t volatile x = 0;
  size_t i;

  if (elen != clen) {
    return 1; //incorrect password
  }
  for (x = 0; x < delay_count; x++);
  for (i=0; i < elen; ++i) {
    if (entered_password[i] == correct_password[i]) {
      for (x = 0; x < delay_count; x++);
    } else {
      return 1;    //incorrect password
    }
  }
  return 0; //correct password
}

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <assert.h>
#include <signal.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>

#define TARGET "/tmp/target2"
#define USER_FILENAME "user_can_write"
#define ROOT_FILENAME "only_root_can_write"
#define MALICIOUS_STRING "virus"
#define NUM_ITER_BEFORE_CHECK 1

#define NDEBUG

#ifndef NDEBUG
#define dbg(x,...) do { printf(x, __VA_ARGS__); fflush(stdout); } while (0)
#else
#define dbg(...)
#endif
#define err(x,...) do { printf(x, __VA_ARGS__); fflush(stdout); } while (0)

static void
execute_target(char* user_filename, char* string_to_write)
{
  char * const argv[] = { TARGET, user_filename, string_to_write, NULL };
  char* envp[] = { NULL };
  pid_t pid = fork();

  if (pid < 0) {
    dbg("%s", "fork failed\n");
    return;
  }
  if (pid == 0) {
    //child
    dbg("%s", "exec'ing\n");
    if (execve(TARGET, argv, envp) != 0) {
      err("execve failed.  Please press Ctrl-C to exit. error = %s.\n", strerror(errno));
      exit(1);
    }
    assert(0);
  } else {
    int wstatus;
    dbg("waiting for %d\n", pid);
    wait(&wstatus);
  }
}

static int
check_done(char const* root_filename, char const* s)
{
  int fd = open(root_filename, O_RDONLY);
  if (fd < 0) {
    return 0;
  }
  size_t len = strlen(s);
  size_t buf[len];
  ssize_t rd = read(fd, buf, len);
  close(fd);
  if (rd != len) {
    return 0;
  }
  if (memcmp(buf, s, len)) {
    return 0;
  }
  return 1;
}

static void
cleanup_and_exit(int exitcode, pid_t pid)
{
  kill(pid, SIGKILL);
  exit(exitcode);
}

int main(void)
{
  // This one is much harder.
  // Predict the pseudo-random sequence used by mktemp()
  // Then exploit the race-condition as in xploit1
  return 0;
}

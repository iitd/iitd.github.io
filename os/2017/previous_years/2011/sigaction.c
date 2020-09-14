#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <stdlib.h>

void sigint_hndlr(int snum, siginfo_t *sinfo, void *ucntxt)
{
    if(sinfo) {
        if (sinfo->si_pid)
            printf ("SIGINT from %d.\n", sinfo->si_pid);
        else
            printf ("\nSIGINT from %d.\n", getpid());
    }
    exit(0);
}

int main() {
    struct sigaction sigaxn;
    sigaxn.sa_sigaction = sigint_hndlr;
    sigaxn.sa_flags = SA_SIGINFO; 

    sigaction (SIGINT, &sigaxn, NULL);
    while (1)
        usleep (1000);
    return -1;
}
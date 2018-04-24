#include <stdio.h>
#include <stdlib.h>

#include <signal.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <sys/time.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <getopt.h>


int main(int argc, char **argv)
{
    for (int i = 0; i < 5; ++i)
    {
        pid_t child_pid = fork();
        if (child_pid == 0)
        {
                sleep(5);
                return 0;
        }
        printf("zombie pid = %d\n", child_pid);
    }
        execl("/bin/ps", "ps", "-a", NULL);
}
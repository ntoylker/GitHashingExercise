#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>

// Counter for SIGINT signals caught
int sigint_count = 0;

// Custom signal handler for SIGINT
void custom_sigint_handler(int sig) {
    sigint_count++;
    printf("\nSignal number: %d caught!\n", sig);

    if (sigint_count < 2) {
        printf("Caught SIGINT %d time(s). Catching it one more time before restoring default behavior.\n", sigint_count);
    } else {
        printf("Caught SIGINT twice. Restoring default behavior.\n");
        // Restore default signal behavior for SIGINT
        if (signal(SIGINT, SIG_DFL) == SIG_ERR) {
            perror("Error restoring default SIGINT behavior");
            exit(EXIT_FAILURE);
        }
    }
}

int main() {
    // Register the custom SIGINT handler
    if (signal(SIGINT, custom_sigint_handler) == SIG_ERR) {
        perror("Error registering custom SIGINT handler");
        exit(EXIT_FAILURE);
    }

    // Infinite loop to keep the program running
    while (1) {
        printf("Running... Press Ctrl+C to send SIGINT.\n");
        sleep(1);
    }

    return 0;
}

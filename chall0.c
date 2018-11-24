#ifndef _MYLIB_H_
#define _MYLIB_H_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "module.h"

const char* name = "Challenge 0 Part A";
const char* info =  "Welcome\n"
                    "Can you tell me a secret? I will reward you with a flag :)\n"
                    "\n"
                    "Type \"help\" for help :)";


void tell_secret(int argc, char* argv[]) {
    if (!strcmp(argv[1], "ThisSecretIsVerySecret")) {
        printf("This is the best secret. Starting a shell... Look for the flag in /flag.txt\n");
        system("/bin/bash");
    } else {
        printf("Sorry! You don't seem to know the secret\n");
    }
    return;
}


void initialize_module(module_t* module, registration_function register_command) {
    
    module->name = name;
    module->info = info;

    register_command("tell_secret", "<secret>\t", "Tell a secret", tell_secret);
}

#endif

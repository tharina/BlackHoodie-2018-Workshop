#ifndef _MYLIB_H_
#define _MYLIB_H_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <dlfcn.h>

#include "module.h"

const char* name = "Challenge 1 Part A and B";
const char* info =  "Welcome\n"
                    "This super cool service decodes your hex string.\n"
                    "Try it out!\n"
                    "\n"
                    "Type \"help\" for help :)";

char* input;
size_t len;

void decode(int argc, char **argv) {
    unsigned char buf[16];
    memset(buf, 0, sizeof(buf));
    printf("Decoding into buffer at address: %p\n", buf);

    input = argv[1];
    len = strlen(input);
    for (size_t i = 0; i < len / 2; i++) {
        sscanf(&input[2*i], "%2hhx", &buf[i]);
    }

    printf("%s\n", buf);
}


void libcinfo(int argc, char* argv[]) {
    char* error;
    void* handle = dlopen("libc.so.6", RTLD_LAZY);
    if (!handle) {
        printf("error");
        exit(EXIT_FAILURE);
    }
    void (*addr)(int) = dlsym(handle, "system");


    printf("************************************\n");
    printf("Information about the libc:\n");
    printf("Address of the system function: %p\n", addr);
    printf("************************************\n");
}


void initialize_module(module_t* module, registration_function register_command) {
    
    module->name = name;
    module->info = info;

    register_command("decode", "<string>\t\t", "Hex decode", decode);
    register_command("libcinfo", "\t\t", "Show information about the libc", libcinfo);
}

#endif

// MyCFunctions.h
// MyCFunctions.h
#ifndef MY_FUNCTIONS_H
#define MY_FUNCTIONS_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char *data;
} VulnerableStruct;

void myCFunction(void);
void myStackOverflowFunction(const char *input);
void myHeapOverflowFunction(const char *input);
void myIntegerOverflowFunction(const char *input);

#endif

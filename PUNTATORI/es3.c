#include <stdio.h>
#include <stdlib.h>

int main() {

    char *str = "Hello World!";
    char *strEnd = str;

    while(*++strEnd) {}

    printf("Lenght: %ld\n", (int) (strEnd - str) / sizeof(char));

    return 0;
}
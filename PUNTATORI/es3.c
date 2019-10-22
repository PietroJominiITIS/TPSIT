#include <stdio.h>
#include <stdlib.h>

int main() {

    char *str = "Hello World!";
    char *len = str;

    while(*++len) {}

    len = (int) (len - str);

    printf("Lenght: %d\n", len);

    return 0;
}
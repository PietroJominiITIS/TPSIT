#include <stdio.h>
#include <stdlib.h>

int main() {

    char *str = "Hello World!";
    size_t len = 0;

    while(*str) {
        str += 1;
        len += 1;
    }

    printf("Lenght: %d\n", len);

    return 0;
}
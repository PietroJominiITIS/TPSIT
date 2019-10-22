#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct _emp {
    int id;
} emp;

int main() {

    const unsigned int n = 3;
    emp *emps = (emp *) malloc(n * sizeof(emp));

    emps->id = 1;
    (emps + 1)->id = 2;
    (emps + 2)->id = 3;

    for (unsigned int k = 0; k < n; k += 1) printf("%p -> %d\n", emps + k, (emps + k)->id);
    return 0;
}
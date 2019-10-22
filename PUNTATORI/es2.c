#include <stdio.h>
#include <stdlib.h>

int main() {

    const unsigned int n = 3;
    int *arr = (int *) calloc(n, n * sizeof(int));

    for (unsigned int k = 0; k < n; k += 1) scanf("%d", arr + k);

    int max = *arr;
    for (unsigned int k = 0; k < n; k += 1) if (*(arr + k) > max) max = *(arr + k);
    printf("> %d\n", max);

    return 0;
}
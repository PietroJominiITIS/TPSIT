#include <stdio.h>
#include <stdlib.h>

int main() {

    const unsigned int n = 3;
    int *arr = (int *) calloc(n, n * sizeof(int));

    for (unsigned int k = 0; k < n; k += 1) scanf("%d", arr + k);

    for (unsigned int k = 0; k < n; k += 1, arr += 1) printf("%p -> %d\n", arr, *(arr));

    return 0;
}
#include <stdio.h>
#include <stdlib.h>

struct El {
    int valore;
    struct El* next;
};

void stampaLista(struct El *node) {
    if (node == NULL) { printf("//"); return; }
    else { printf("%d -> ", node->valore); return stampaLista(node->next); }
}

int len1(struct El *lista) {
    if (lista == NULL) return 0;
    else return 1 + len1(lista->next);
}

int len2(struct El *lista) {
    int len = 0;
    while(lista != NULL) {
        len += 1;
        lista = lista->next;
    }
    return len;
}

int main() {
    int n;
    struct El *lista;
    struct El *l;
    lista = NULL; // Al momento non abibamo elementi nella lista
    do {
        printf("Iserisci un numero naturale o -1 per terminare: ");
        scanf("%d", &n);
        if(n > 0) {
            if (lista == NULL) { // Se è stato inserito il primo elemento
                lista = (struct El *) malloc(sizeof(struct El));
                l = lista;
            } else { // Altrimenti appendiamo un nodo alla lista
                l->next = (struct El *) malloc(sizeof(struct El));
                l = l->next;
            }
            l->valore = n; // Si assegna il valore inserito
            l->next = NULL; // Si termina la sequenza di nodi
        }
    } while (n != -1);

    /* l = lista; //
    printf("Numeri inseriti: \n");
    while( l != NULL) {
        printf("%d -> %p\n", l->valore, l->next);
        l = l->next; // Si cicla nella lista, otenendo il nodo puntato dal valore corrente
    } */
    stampaLista(lista);
    printf("\nLung -> %d :: %d\n", len1(lista), len2(lista));
    return 0;
}
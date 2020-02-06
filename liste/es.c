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

int len1(struct El *lista) { return (lista == NULL) ? 0 : 1 + len1(lista->next); }

int len2(struct El *lista) {
    int len = 0;
    while(lista != NULL) {
        len += 1;
        lista = lista->next;
    }
    return len;
}

// es4
void deallocaLista(struct El *lista) {
    struct El *lp;
    while(lista != NULL) {
        lp = lista->next;
        free(lista);
    }
}

// es5
// selection sort
void ordinaLista(struct El *lista) {
    struct El *head = lista;
    while (lista != NULL) {
        struct El *min = lista;
        struct El *l = lista->next;
        while (l != NULL) {
            if (min->valore > l->valore) {
                min = l;
            }
            l = l->next;
        }
        int t = lista->valore;
        lista->valore = min->valore;
        min->valore = t;

        lista = lista->next;
    }
}

// es6
struct El *merge(struct El *a, struct El *b) {
    struct El *res = NULL;
    struct El *p = NULL;
    while(a != NULL) {
        if (p == NULL) {
            res = (struct El *) malloc(sizeof(struct El));
            res->valore = a->valore;
            res->next = NULL;
            p = res;
        }
        else {
            p->next = (struct El *) malloc(sizeof(struct El));
            p = p->next;
            p->valore = a->valore;
            p->next = NULL;
        }
        a = a-> next;
    }
    while(b != NULL) {
        if (p == NULL) {
            res = (struct El *) malloc(sizeof(struct El));
            res->valore = b->valore;
            res->next = NULL;
            p = res;
        } else {
            p->next = (struct El *) malloc(sizeof(struct El));
            p = p->next;
            p->valore = b->valore;
            p->next = NULL;
            b = b-> next;
        }
    }
    ordinaLista(res);
    return res;
}

// es6v2
struct El *mergev2(struct El *a, struct El *b) {
    struct El *res = NULL;
    struct El *head = NULL;
    while (a != NULL || b != NULL) {
        int v;
        if (a == NULL) {
            v = b->valore;
            b = b->next;
        } else if (b == NULL) {
            v = a->valore;
            a = a->next;
        } else {
            if (a->valore > b->valore) {
                v = b->valore;
                b = b->next;
            } else {
                v = a->valore;
                a = a->next;
            }
        }
        if (res == NULL) {
            res = (struct El *) malloc(sizeof(struct El));
            head = res;
            res->valore = v;
        } else {
            res->next = (struct El *) malloc(sizeof(struct El));
            res = res->next;
            res->valore = v;
        }
    }
    return head;
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

    int n1;
    struct El *lista1;
    struct El *l1;
    lista1 = NULL; // Al momento non abibamo elementi nella lista
    do {
        printf("Iserisci un numero naturale o -1 per terminare: ");
        scanf("%d", &n1);
        if(n1 > 0) {
            if (lista1 == NULL) { // Se è stato inserito il primo elemento
                lista1 = (struct El *) malloc(sizeof(struct El));
                l1 = lista1;
            } else { // Altrimenti appendiamo un nodo alla lista
                l1->next = (struct El *) malloc(sizeof(struct El));
                l1 = l1->next;
            }
            l1->valore = n1; // Si assegna il valore inserito
            l1->next = NULL; // Si termina la sequenza di nodi
        }
    } while (n1 != -1);

    /* l = lista; //
    printf("Numeri inseriti: \n");
    while( l != NULL) {
        printf("%d -> %p\n", l->valore, l->next);
        l = l->next; // Si cicla nella lista, otenendo il nodo puntato dal valore corrente
    } */
    ordinaLista(lista);
    ordinaLista(lista1);
    struct El *mres = mergev2(lista, lista1);
    stampaLista(mres);
    return 0;
}


#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// un piccolo intero di (quasi sempre) 8 bit
typedef unsigned char uint8_t;

// Seme delle carte
typedef enum {
    CUORI = 'C',
    PICCHE = 'P',
    DENARI = 'D',
    FIORI = 'F'
} seme_t;

typedef struct _carta_t {
    seme_t seme;              // Seme della carta
    uint8_t n;                // Numero della carta
    struct _carta_t *next;    // Autoreferenziamento
} carta_t;

void push(carta_t **head, seme_t seme, uint8_t n) {

    // Creo una nuova carta con il seme e il numero in input
    carta_t *nc = (carta_t *) malloc(sizeof(carta_t));
    nc->n = n;
    nc->seme = seme;
    nc->next = NULL;

    // Se il mazzo è vuoto, lo creo a partere dalla nuova carta
    if (*head == NULL) {
        *head = nc;
    } else {                    // Altrimenti, aggiungo la carta in cima al mazzo
        nc->next = *head;
        *head = nc;
    }

}

void stampa(carta_t *head) {
    // Iteratore, per scorrere la lista
    carta_t *iter = head;

    // Itero nella lista, stampando ogni volta i metadata della carta
    while(iter != NULL) {
        printf("%2d%c ", iter->n, iter->seme);
        iter = iter->next;
    }

    printf("\n");
}

void addn(carta_t **head, size_t n, seme_t seme) {
    for(size_t i = 1; i <= n; i += 1) {
        push(head, seme, i);
    }
}

size_t len(carta_t *head) {
    if (head == NULL) return 0;
    else return 1 + len(head->next);
}

carta_t *pop(carta_t **head) {

    // Carta da ritornare come valore rimosso dalla pila
    carta_t *res = NULL;

    // Se la pila ha elementi ne rinuovo uno e "sposto" la testta del mazzo, altrimenti 
    // ritorno NULL
    if (*head != NULL) {
        res = *head;
        *head = (*head)->next;
    }

    return res;

}

void coppa(carta_t **head, size_t n) {

    carta_t *top = NULL, *bottom = NULL, *res = NULL;
    size_t i, l = len(*head);

    // Creo una pila con la metà alta del mazzo
    for(i = 0; i < n; i += 1) {
        carta_t *el = pop(head);
        push(&top, el->seme, el->n);
    }

    // Creo una pila con la metà bassa del mazzo
    for(; i < l; i += 1) {
        carta_t *el = pop(head);
        push(&bottom, el->seme, el->n);
    }

    // Reinserisco le due metà nel mazzo, in ordine inverso
    l = len(top);
    for(i = 0; i < l; i += 1) {
        carta_t *el = pop(&top);
        push(&res, el->seme, el->n);
    }

    l = len(bottom);
    for(i = 0; i < l; i += 1) {
        carta_t *el = pop(&bottom);
        push(&res, el->seme, el->n);
    }

    *head = res;

}

void shuffle1(carta_t **mazzo, size_t precisione) {
    for(size_t i = 0; i < precisione; i += 1) {
        coppa(mazzo, (size_t) (rand() %len(*mazzo)));
    }
}

// -- {{{
carta_t *get(carta_t *head, size_t pos) {
    carta_t *tmp = head;
    for(size_t i = 0; i < pos && i < len(head); i += 1) {
        tmp = tmp->next;
    }
    return tmp;
}

void swap(carta_t **head, size_t i1, size_t i2) {

    carta_t *c1 = get(*head, i1);
    carta_t *c2 = get(*head, i2); 

    carta_t *prev1 = get(*head, i1 - 1);
    carta_t *prev2 = get(*head, i2 - 1);

    prev1->next = c2;
    prev2->next = c1;

    carta_t *tmpnext = c1->next;
    c1->next = c2->next;
    c2->next = tmpnext;

}

/*
    To shuffle an array a of n elements (indices 0..n-1):
        for i from n - 1 downto 1 do
            j = random integer with 0 <= j <= i
            exchange a[j] and a[i]
*/
void shuffle2(carta_t **head) {

    carta_t *tmp = *head;
    srand((unsigned) time(0));

    for (size_t i = len(tmp) - 1; i >= 0; i -= 1) {

        size_t j = (size_t) rand() % i;
        swap(head, i, j);

    }
    
}
// -- }}}

int main(void) {

    // Pila mazzo
    carta_t *mazzo = NULL;

    // Agginugo 52 carte dei 4 semi
    addn(&mazzo, 13, CUORI);
    addn(&mazzo, 13, PICCHE);
    addn(&mazzo, 13, DENARI);
    addn(&mazzo, 13, FIORI);

    // Spezzo in una posizione casuale
    srand((unsigned) time(0));
    coppa(&mazzo, (size_t) rand() % len(mazzo));
    
    stampa(mazzo);

    // Mescolo il mazzo
    // shuffle1(&mazzo, 100);
    shuffle1(&mazzo, 100);

    stampa(mazzo);

    // Libero le carte allocate
    while(mazzo != NULL) {
        carta_t *tmp = mazzo->next;
        free(mazzo);
        mazzo = tmp;
    }

    return EXIT_SUCCESS;
}
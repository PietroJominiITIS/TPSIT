#include <stdio.h>
#include <stdlib.h>

typedef struct _block {
    int data;
    struct _block *next;
} block;

int enqueue(block **head, block **tail, block *new) {

    if (*head == NULL) {

        *head = new;

    } else if (*tail == NULL) {

        *tail = new;
        (*tail)->next = NULL;
        (*head)->next = *tail;

    } else {
        
        (*tail)->next = new;
        *tail = (*tail)->next;
        (*tail)->next = NULL;

    }

    return EXIT_SUCCESS;
}

block *dequeue(block **head, block **tail) {

    if (*head == NULL) return NULL;
    else {

        block *ret = *head;
        *head = (*head)->next;
        return ret;

    }

}



int main( void ) {

    block *head = NULL, *tail = NULL;

    int valIn;
    do {

        printf("Insert a number | < 0 :: ");
        scanf("%d", &valIn);

        block *el = (block *) malloc(sizeof(block));
        el->data = valIn;
        enqueue(&head, &tail, el);

    } while (valIn >= 0);

    while (head->next != NULL) {

        printf("Val :: %d\n", head->data);
        head = head->next; 
    
    }

    return EXIT_SUCCESS;
}
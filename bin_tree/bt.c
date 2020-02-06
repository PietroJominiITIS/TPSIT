#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef struct _node {
    int key;
    struct _node *left;
    struct _node *right;
    int data;
} node;

void destroy(node *leaf) {
    if (leaf) {
        destroy(leaf->left);
        destroy(leaf->right);
        free(leaf);
    }
}

int insert(node **leaf, node *new) {
    if (!(*leaf)) *leaf = new;
    else if (new->key < (*leaf)->key) return insert(&(*leaf)->left, new);
    else if (new->key > (*leaf)->key) return insert(&(*leaf)->right, new);
    else return 0;
    return 1;
}

node *find(int key, node *leaf) {
    if (!leaf) return NULL;
    else if (key < leaf->key) return find(key, leaf->left);
    else if (key > leaf->key) return find(key, leaf->right);
    else return leaf;
}

void ordered_print(node *leaf) {
    if(leaf) {
        ordered_print(leaf->left);
        printf("[%3d]:[%8d]\n", leaf->key, leaf->data);
        ordered_print(leaf->right);
    }
}

void *new_node(int key, int data) {
    node *nnode = (node *) malloc(sizeof(node));
    nnode->left = NULL;
    nnode->right = NULL;
    nnode->key = key;
    nnode->data = data;
    return nnode;
}

size_t dim(node *leaf) {
    if (!leaf) return 0;
    else return 1 + dim(leaf->right) + dim(leaf->left);
}

int main() {

    srand((unsigned) time(0));
    node *root = NULL;

    int k = 0;
    const int INSERT = 50;
    for (int i = 0; i < INSERT; i += 1) k += insert(&root, new_node(rand()%100, rand()%10000));

    size_t n = dim(root);
    printf("\n");
    printf("Element: [%3ld] (Should be [%3d])\n", n, k);
    printf("Failed [%3ld] insert out of [%3d]\n", INSERT - n, INSERT);

    printf("\n  KEY:DATA\n");
    ordered_print(root);

    int key = 0;
    printf("\nInsert a key to lok for: ");
    scanf("%d", &key);

    node *res = find(key, root);
    if (res) printf("Looked for key [%3d], found data [%8d] at address [%p]\n", key, res->data, res);
    else printf("Looked for key [%3d], not found\n", key);

    destroy(root);
    printf("\n");

}
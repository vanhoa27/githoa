#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "introprog_telefonbuch.h"

/*
 * Fügt einen Knoten mit der Telefonnummer phone und dem Namen name
 * in den Binären Suchbaum bst ein.  Für den Suchbaum soll die
 * Eigenschaft gelten, dass alle linken Kinder einen Wert kleiner
 * gleich (<=) und alle rechten Kinder einen Wert größer (>) haben.
 */
void bst_insert_node(bstree* bst, unsigned long phone, char *name) {
    if (bst == NULL) {
        return;
    }

    bst_node *new_node = malloc(sizeof(bst_node)); //create a new node
    new_node->left = NULL;
    new_node->right = NULL;
    new_node->parent = NULL;
    new_node->phone = phone;
    new_node->name = malloc((strlen(name)+1)*sizeof(char));
    strncpy(new_node->name, name, strlen(name)+1);

    if (bst->root == NULL) {
        bst->root = new_node;
        return;
    }

    bst_node *y = NULL;
    bst_node *x = bst->root;
    while (x != NULL) {
        y = x;
        if (x -> phone == new_node->phone) {
            printf("Error! This number already exists!");
            return;
        }
        else if (x->phone < new_node -> phone) {
            x = x->right;
        }
        else {
            x = x->left;
        }
    }
    new_node->parent = y;
    if (y->phone < phone) {
        y->right = new_node;
    }
    else {
        y->left = new_node;
    }
}

/*
 * Diese Funktion liefert einen Zeiger auf einen Knoten im Baum mit
 * dem Wert phone zurück, falls dieser existiert.  Ansonsten wird
 * NULL zurückgegeben.
 */
bst_node* find_node(bstree* bst, unsigned long phone) {
    if (bst == NULL || bst->root == NULL) {
        return NULL;
    }

    bst_node *p_pointer = bst->root;
    while (p_pointer != NULL && p_pointer->phone != phone) {
        if (phone < p_pointer->phone) {
            p_pointer = p_pointer->left;
        }
        else {
            p_pointer = p_pointer->right;
        }
    }

    if (p_pointer == NULL || p_pointer->phone != phone) {
        return NULL;
    }
    else {
        return p_pointer;
    }
}

/* Gibt den Unterbaum von node in "in-order" Reihenfolge aus */
void bst_in_order_walk_node(bst_node* node) {
    if (node == NULL) {
        return;
    }

    bst_in_order_walk_node(node->left);
    print_node(node);
    bst_in_order_walk_node(node->right);
}

/* 
 * Gibt den gesamten Baum bst in "in-order" Reihenfolge aus.  Die
 * Ausgabe dieser Funktion muss aufsteigend soriert sein.
 */
void bst_in_order_walk(bstree* bst) {
    if (bst != NULL) {
        bst_in_order_walk_node(bst->root);
    }
}

/*
 * Löscht den Teilbaum unterhalb des Knotens node rekursiv durch
 * "post-order" Traversierung, d.h. zurerst wird der linke und dann
 * der rechte Teilbaum gelöscht.  Anschließend wird der übergebene
 * Knoten gelöscht.
 */
void bst_free_subtree(bst_node* node) {
    if (node == NULL) {
        return;
    }

    bst_free_subtree(node->left);
    bst_free_subtree(node->right);
    free(node->name);
    free(node);
}

/* 
 * Löscht den gesamten Baum bst und gibt den entsprechenden
 * Speicher frei.
 */
void bst_free_tree(bstree* bst) {
    if(bst != NULL && bst->root != NULL) {
        bst_free_subtree(bst->root);
        bst->root = NULL;
    }
}

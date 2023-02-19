#include <stdlib.h>		
#include <stdio.h>	// Ein- / Ausgabe
#include <math.h>	// Für die Berechnungen der Ausgabe
#include "avl.h"

/* Gibt den gesamten AVL Baum in "in-order" Reihenfolge aus. */
void in_order_walk(AVLNode* node)
{
    if(node->left) {
        in_order_walk(node->left);
    }
    printf("%d ", node->value);
    if(node->right) {
        in_order_walk(node->right);
    }
}

void AVL_in_order_walk(AVLTree* avlt)
{
    if(avlt){
        in_order_walk(avlt->root);
    }
    printf("\n");
}


/* Diese Funktion führt eine Linksrotation auf dem angegebenen
 * Knoten aus.
 *
 * Beachtet: Die Höhen der entsprechenden Teilbäume müssen (lokal)
 * angepasst werden.  Falls dies nicht eingehalten wird
 * funktionieren die Unit-Tests ggf. nicht.
 */
int height(AVLNode *node) {
    if(node == NULL){
        return -1;
    } 
    return node->height;
}

int max(int a, int b){
    return (a > b)? a : b;
}

void AVL_rotate_left(AVLTree* avlt, AVLNode* x)
{
    // Hier Code implementieren!
    AVLNode* y = x->right;
    x->right = y->left;

    if(y->left)
       y->left->parent = x;

    y->parent = x->parent;

    if(x->parent == NULL){
        avlt->root = y;
    } else if(x == x->parent->left){
        x->parent->left = y;
    } else{
        x->parent->right = y;
    }

    y->left = x;
    x->parent = y;

    x->height = 1 + max(height(x->left), height(x->right));
    y->height = 1 + max(height(y->left), height(y->right));
}

/* Diese Funktion führt eine Rechtsrotation auf dem angegebenen
 * Knoten aus.
 *
 * Beachtet: Die Höhen der entsprechenden Teilbäume müssen (lokal)
 * angepasst werden.  Falls dies nicht eingehalten wird
 * funktionieren die Unit-Tests ggf. nicht.
 */
void AVL_rotate_right(AVLTree* avlt, AVLNode* y)
{
    AVLNode* x = y->left;
    y->left = x->right;

    if(x->right)
       x->right->parent = y;

    x->parent = y->parent;

    if(y->parent == NULL){
        avlt->root = x;
    } else if(y == y->parent->right){
        y->parent->right = x;
    } else{
        y->parent->left = x;
    }

    x->right = y;
    y->parent = x;

    y->height = 1 + max(height(y->left), height(y->right));
    x->height = 1 + max(height(x->left), height(x->right));
}

/* Balanciere den Teilbaum unterhalb von node.
 * 
 * Beachtet: Die Höhen der entsprechenden Teilbäume müssen _nicht_
 * angepasst werden, da dieses schon in den Rotationen geschieht.
 * Falls dies nicht eingehalten wird funktionieren die Unit-Tests
 * ggf. nicht.
 */

void AVL_balance(AVLTree *avlt, AVLNode *node) {
    if (node == NULL) {
        return;
    }

    int left_height = height(node->left);
    int right_height = height(node->right);

    if (left_height > right_height + 1) {
        int left_left_height, left_right_height;

        left_left_height = height(node->left->left);
        left_right_height = height(node->left->right);

        if (left_left_height < left_right_height) {
            AVL_rotate_left(avlt, node->left);
        }
        AVL_rotate_right(avlt, node);

    } else if (right_height > left_height + 1) {
        int right_right_height, right_left_height;
        right_right_height = height(node->right->right);
        right_left_height = height(node->right->left);

        if (right_right_height < right_left_height) {
            AVL_rotate_right(avlt, node->right);
        }
        AVL_rotate_left(avlt, node);
    }
}

/* Fügt der Wert value in den Baum ein.
 *
 * Die Implementierung muss sicherstellen, dass der Baum nach dem
 * Einfügen immer noch balanciert ist!
 */
void AVL_insert_value(AVLTree* avlt, int value)
{
    AVLNode* new_node = (AVLNode*)malloc(sizeof(AVLNode));

    new_node->value = value;
    new_node->parent = NULL;
    new_node->left = NULL;
    new_node->right = NULL;
    new_node->height = 0;

    if (avlt->root == NULL) {
        avlt->root = new_node;
        ++(avlt->numberOfNodes);
        return;
    }

    AVLNode* current = avlt->root;
    AVLNode* previous = NULL;

    while (current) {
        previous = current;
        if (value < current->value) {
            current = current->left;
        } else if (value >= current->value) {
            current = current->right;
        }
    }

    new_node->parent = previous;
    if (value < previous->value) {
        previous->left = new_node;
        ++(avlt->numberOfNodes);
    } else {
        previous->right = new_node;
        ++(avlt->numberOfNodes);
    }

    AVLNode* balanced_Node = previous;
    while (balanced_Node) {
        int left_height = height(balanced_Node->left);
        int right_height = height(balanced_Node->right);
        balanced_Node->height = 1 + max(left_height, right_height);

        AVL_balance(avlt, balanced_Node);
        balanced_Node = balanced_Node->parent;
    }
}

/* Löscht den gesamten AVL-Baum und gibt den Speicher aller Knoten
 * frei.
 */
void avl_free_subtree(AVLNode* root){
    if(root){
        avl_free_subtree(root->left);
        avl_free_subtree(root->right);
        free(root);
    }
}

void AVL_remove_all_elements(AVLTree* avlt)
{
    // Hier Code implementieren!
    if(avlt && avlt->root){
        avl_free_subtree(avlt->root);
        avlt->root = NULL;
    } else{
        free(avlt);
    }
}



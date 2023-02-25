#include <stdio.h>
#include <stdlib.h>

typedef struct _Node
{
	int value;
	struct _Node* left;
	struct _Node* right;
} Node;

void print_tree_rek(Node * node)
{
	printf("Besuche Node mit Wert %d\n", node->value);
	// will derference NULL value if node->left, node->right are NULL

	if (node != NULL)
	{
		print_tree_rek(node->left);
		printf("%d ", node->value);
		print_tree_rek(node->right);
	}
}

int main()
{
	printf("Node: ");
	Node* node = (Node*) malloc(sizeof(node));

	node->value = 2;
	node->left = NULL;
	node->right = NULL;

	print_tree_rek(node);
	return 0;
}
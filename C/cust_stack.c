#include <stdio.h>
#include <stdlib.h>
#include <stack.h>

// Item Variable which is initialized to (zero)
Item initial = { "" } ;

void Initialize(Stack * arg)
{
	arg->head = NULL ;
	arg->tail = NULL ;
	arg->size = 0 ;
}

void Push(Stack * arg1 , Item arg2)
{
//	allocating the new node.
	Node * nptr = (Node *) malloc(sizeof(Node));

//  initializing the node.
    nptr->prev = nptr->next = NULL ;
    nptr->data = initial ;

//	checking if this is the first node and if so setting the head to it.
	if (arg1->head == NULL)
		arg1->head = nptr ;

//	getting the node information.
	nptr->prev = arg1->tail ;
	nptr->data = arg2 ;

//	changing the previous node accordingly.
	if (arg1->size != 0)
		arg1->tail->next = nptr ;

//	changing the stack accordingly.
	++arg1->size ;
	arg1->tail = nptr ;
}

Item Unpush(Stack * arg)
{
//	allocating the needed variables.
	Item data = arg->tail->data ;
	Node * nptr = arg->tail ;

//	changing the stack accordingly.
	arg->tail = arg->tail->prev ;
	--arg->size ;
	if (arg->size == 0)
		arg->head = NULL ;

//	changing the previous node accordingly
	arg->tail->next = NULL ;

//	freeing the allocated memory.
	free(nptr);

//	returning the desiered data
	return data ;
}

void Traverse(Stack * arg , void (* func)(Item *))
{
//	allocating the needed variables.
	Node * nptr = arg->head ;

//	traversing the stack.
	while (nptr != NULL)
	{
		func(&nptr->data);
		nptr = nptr->next ;
	}
}

void Show(Stack * arg)
{
//	allocating the needed variables
	Node * nptr = arg->head ;

//	traversing the stack and displaying every node data.
	while (nptr != NULL)
	{
	//	showing the information.
		printf("%s", nptr->data.dir);
		putchar('/');

		nptr = nptr->next ;
	}
	putchar('\n');
}

void Destroy(Stack * arg)
{
//	allocating the needed variables
	Node * nptr1 = arg->head ;
	Node * nptr2 ;

//	traversing the stack and destroying every node.
	while (nptr1 != NULL)
	{
		nptr2 = nptr1 ;
		nptr1 = nptr1->next ;
		free(nptr2);
	}
}
#ifndef stack_h

#define stack_h

/*	note that the problem specific chunks of code are:
	1. SIZE
	2. struct item
	3. intial variable
	4. the Show function
*/

#define SIZE 201

typedef struct item {
	char dir[SIZE];
} Item ;

typedef struct node {
	struct node * prev ;
	struct node * next ;
	struct item data ;
} Node ;

typedef struct stack {
	struct node * head ;
	struct node * tail ;
	int size ;
} Stack ;

// The Stack ADT Function Prototypes:

void Initialize(Stack *);
/*	should be used immediatly after creating a stack
	it sets (resets) all pointers to NULL and
	size variable to zero.							 */

void Push(Stack *, Item);
/*	this function is used to populate the stack with data	*/

Item Unpush(Stack *);
/*	this is used to get data from the stack */

void Traverse(Stack *, void (*)(Item *));
/*	the purpos of this function is to manipulate the whole stack
	with some specific Function 								 */

void Show(Stack *);
/*	this function shows the contents of the whole stack arranged from head
	to tail and seperated throgh (/) symbole								*/

void Destroy(Stack *);
/*	this function serves as cleaner after the stack is not needed anymore	*/


#endif // stack_h

#include <stdio.h>
#include <string.h>

int eatline(void)
{
	int status = 0 ;
	char ch1 ;
	char ch2 = '\0' ;   // a dummy value no more for checking if the value of ch2 change during the loop or not.

	while ((ch1 = getchar()) != '\n')
	{
		ch2 = ch1 ;
	}

	if (ch2 != '\0')
		status = 1 ;

	return status ;
}

int earword(void)
{
    int status = 0 ;
    char ch1 ;
    char ch2 = '\0' ;   // a dummy value no more for checking if the value of ch2 change during the loop or not.

    while ((ch1 = getchar()) != ' ')
    {
        ch2 = ch1 ;
    }

    if (ch2 != '\0')
        status = 1 ;

    return status ;
}

char * getstr(char * st, int n)		// my own version of gets.
{
	char * ret_val;
	char * find;

	ret_val = fgets(st, n, stdin);
	if (ret_val)
	{
		find = strchr(st, '\n');   		// look for newline
		if (find)                  		// if the address is not NULL,
		    *find = '\0';          		// place a null character there
		else
		    while (getchar() != '\n')
		    	continue;          		// dispose of rest of line
	}

	return ret_val ;
}

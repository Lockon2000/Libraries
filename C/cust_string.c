#include <stdio.h>
#include <stdlib.h>
#include <string.h>


char * strlstr(const char haystack[] , const char needle[]) 	// returns a pointer to the first character of the last occurrence
{																// of the string needle int the string haystack.
    char * scout , * target ;

    target = scout = strstr(haystack , needle);
    if (scout != NULL)
    {
        while ((scout = strstr(scout + 1 , needle)) != NULL)
            target = scout ;
    }

    return target ;
}

void up_str(char * str)		// maps all characters of the string to upper case letters.
{
	while (*str)
	{
		*str = toupper(*str);
		str++;
	}
}
 
void down_str(char * str)	// maps all characters of the string to lower case letters.
{
	while (*str)
	{
		*str = tolower(*str);
		str++;
	}
}

#include <stdio.h>
#include <limits.h>

int char_comp(const void * fir , const void * sec)
{
    if (*((char *) fir) > *((char *) sec))
        return 1 ;
    else if (*((char *) fir) < *((char *) sec))
        return -1 ;
    else
        return 0 ;
}

int int_comp(const void * fir , const void * sec)
{
    if (*((int *) fir) > *((int *) sec))
        return 1 ;
    else if (*((int *) fir) < *((int *) sec))
        return -1 ;
    else
        return 0 ;
}

char * itobs(int n , char * ptr)
{
    int i;
    static const int size = CHAR_BIT * sizeof(int);

    for (i = size - 1; i >= 0; i--, n >>= 1)
        ptr[i] = (01 & n) + '0';  // assume ASCII or similar
    ptr[size] = '\0';

    return ptr;
}

void show_bstr(const char * str)
{
    int i = 0;

    while (str[i])  /* not the null character */
    {
        putchar(str[i]);
        if(++i % 4 == 0 && str[i])
            putchar(' ');
    }
}

#ifndef cust_io_h
#define cust_io_h

#ifdef mingw64
#define __USE_MINGW_ANSI_STDIO 1
#endif // mingw64

int eatline(void);
int eatword(void);      // discards the characters up to and including the next space, if the immediately following character is
                        // a space it returns 1. otherwise it returns 0.
char * getstr(char * st, int n);	// my own get string function.






#endif // cust_io_h

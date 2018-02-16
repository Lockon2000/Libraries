#ifndef cust_lib_h

#define cust_lib_h

int int_comp(const void * fir , const void * sec);		// a character comparison function to be mainly used with qsort() of the std lib.
int char_comp(const void * fir , const void * sec);		// an int comparison function to be mainly used with qsort() of the std lib.
char * itobs(int n , char * ptr);		// converts an (int) to a string in the binery system.
void show_bstr(const char * ptr);		// shows the contents of a binary string in groupes of four.


#endif // cust_lib_h
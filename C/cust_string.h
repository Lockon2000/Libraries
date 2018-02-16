#ifndef cust_string_h

#define cust_string_h

char * strlstr(const char haystack[] , const char needle[]);	// returns a pointer to the last occurence of the string needle
																// in the string haystack.
void up_str(char * str);		// maps every lower case character to upper case character.
void down_str(char * str);		// maps every upper case character to lower case character.

#endif // cust_string_h
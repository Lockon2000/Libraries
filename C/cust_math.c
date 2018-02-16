int gcd(int x , int y)
{
	int r ;

    r = x % y ;

    while (r > 0 )
    {
        x = y ;
        y = r ;
        r = x % y ;
    }

    return y ;
}
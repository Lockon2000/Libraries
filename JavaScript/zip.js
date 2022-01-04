// A zip function similar to that of python

zip = (...rows) => rows[0].map((_,i) => rows.map(row => row[i]))
// A zip function similar to that of python

zip = (...rows) => rows[0].map((_,c)=>rows.map(row=>row[c]))
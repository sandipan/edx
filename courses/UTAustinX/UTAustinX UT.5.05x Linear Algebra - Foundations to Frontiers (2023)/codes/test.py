import numpy as np
x = np.matrix( '1;2;3' )
print( x )
alpha = np.matrix( '-2' )
print( alpha )
print( x * alpha )
#print( alpha * x )

import laff
laff.scal( alpha, x )
print( x )
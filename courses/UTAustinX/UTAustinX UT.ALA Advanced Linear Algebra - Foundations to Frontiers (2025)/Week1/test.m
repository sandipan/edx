format long
		
rng( 0 );      
n = 3          
U = triu( rand( n,n ) )
x = rand( n,1 )

b = U * x;
xhat = U \ b;
xhat
xhat - x
b - U * xhat 

norm( xhat - x )
norm( b - U * xhat )

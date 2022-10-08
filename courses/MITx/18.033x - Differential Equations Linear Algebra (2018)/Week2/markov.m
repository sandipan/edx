%Enter the matrix A. (Hint it may be useful to look up the 
%matlab documentation on diagonal and tridiagonal matrices.)
n = 10;
A = full(gallery('tridiag',n,1/3,1/3,1/3));
%A(1,1) = 2/3;
%A(n,n) = 2/3;
A(1:2,1) = 0.5;
A(n-1:n,n) = 0.5;
A

%Enter column vector of the initial state in a vector called c0.
c0 = zeros(n,1);
c0(1) = 1000;
%c0

%Store the expected distribution of walkers after one time step in a vector called x1.
x1 = A * c0;

%Store the expected distribution of walkers after two time steps in a vector called x2.
x2 = A^2 * c0;

%Store the expected distribution of walkers after 9 time steps in a vector called x9.
x9 = A^9 * c0;


n = 10;
A = full(gallery('tridiag',n,1/3,1/3,1/3));
A(1:2,1) = 0.5;
A(n-1:n,n) = 0.5;
A
[S, D] = eig(A);
D
max(max(D))
S*D*inv(S)
D^1000
c0 = zeros(n,1);
c0(1) = 1000;
A^1000*c0
c0 = zeros(n,1);
c0(5) = 1000;
A^1000*c0
c0 = zeros(n,1);
c0(1) = 500;
c0(3) = 500;
A^1000*c0

n = 10;
A = full(gallery('tridiag',n,1/3,1/3,1/3));
A(1,1) = 2/3;
A(n,n) = 2/3;
A
[S, D] = eig(A);
D
max(max(D))
S*D*inv(S)
D^1000
c0 = zeros(n,1);
c0(1) = 1000;
A^1000*c0
c0 = zeros(n,1);
c0(5) = 1000;
A^1000*c0
c0 = zeros(n,1);
c0(1) = 500;
c0(3) = 500;
A^1000*c0
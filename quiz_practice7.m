%week 7 quiz
A = [5,2; 2,1]
b = [-3; -1]
x0 = [0;0]
g0 = A*x0 + b
u0 = -g0
lamda0 = (-g0' * u0) /(u0' * A * u0)
x1 = x0 + lamda0*u0
g1 = A*x1 + b
b0 = (g1'*A*u0)/(u0'*A*u0)
u1 = -g1 + b0*u0
lamda1 = (-g1' * u1)/(u1'*A*u1)

%conjugate gradient method
A = [2/5,0;0,2]
b = [0;0]
x0 = [5;1]
g0 = A*x0 + b
u0 = -g0
lamda0 = (-g0' * u0) /(u0' * A * u0)
x1 = x0 + lamda0*u0
lamda0 = (-g0' * u0) /(u0' * A * u0)
x1 = x0 + lamda0*u0
g1 = A*x1 + b
b0 = (g1'*A*u0)/(u0'*A*u0)
u1 = -g1 + b0*u0
lamda1 = (-g1' * u1)/(u1'*A*u1)

%conjugate vectors
A = [4,0,2; 0,3,1; 2,1,3]
u = [0;1;-3]
v1 = [0;2;0]
v2 = [4;0;-3]
v3 = [-4;2;3]
v4 = [-2;3;1]
a1 = u'*A*v1 
b1 = v1'*A*u
a2 = u'*A*v2 
b2 = v2'*A*u
a3 = u'*A*v3 
b3 = v3'*A*u
a4 = u'*A*v4
b4 = v1'*A*v4

u1 = [1;0;0]
e1 = [1;0;0]
e2 = [0;1;0]
e3 = [0;0;1]
u2 = e2 - ((e2'*A*u1)/(u1'*A*u1))*u1
u3 = e3 - ((e3'*A*u1)/(u1'*A*u1))*u1 - ((e3'*A*u2)/(u2'*A*u2))*u2

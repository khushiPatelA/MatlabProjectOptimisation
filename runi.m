%{ 
%gradratic gradient projection 
quadGradProj(eye(3),[1;-1;-1],[-1 0 0;0 -1 0; 0,0,0],zeros(3,1),[1;0;3])

%golden section search 
f = @(x) 1 - exp(-x/2)*log(x/5)
a0 = 2;
b0 = 10;
l = 0.5*2;
[xmin, fmin] = golden_section_search(f, a0, b0, l);
disp(['Minimum x: ', num2str(xmin)]);
disp(['Minimum f(x): ', num2str(fmin)]);

%geometric search
f = @(x) (x^2)*(6*(x^2)-16*x-15); 
x0 = 0;
h = 0.5; % Step size
%[a0, b0] = geometric_search(f, x0, h);
%disp(['Bracketing interval: [', num2str(a0), ', ', num2str(b0), ']']);

%Newtons Method
f = @(x) 1 - exp(-x/2); 
df = @(x)  exp(-x/2)*((1/2)*log(x)-(1/x)); 
ddf = @(x) exp(-x/2)*((-1/4)*log(x)+(1/x)+(1/(x^2))); 
x0 = 1; 
epsilon = 1e-14; 
max_iter = 100; 
[xk, x_array] = newtons_method(f, df, ddf, x0, epsilon, max_iter);
disp(['Estimated minimizer x: ', num2str(xk)]);
disp('Array of x values:');
disp(x_array);
%}

%conjugate gradient method 
A = [3,0,1;0,4,2;1,2,3];
b = [-3;0;-1]; 
x0 = [0; 0;0]; 
epsilon = 1e-5; 
[xk, x_array] = conjugate_gradient(A, b, x0, epsilon);
disp('Final estimate of the minimizer x:');
disp(xk);
disp('Array of x values:');
disp(x_array);


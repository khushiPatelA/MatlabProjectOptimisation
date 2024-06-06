%use steepest descent method
f = @(x) (x(1) - 1)^2 + (x(2) - x(1)^2)^2;

grad_f = @(x) [2 * (x(1) - 1) - 4 * x(1) * (x(2) - x(1)^2);
               2 * (x(2) - x(1)^2)];
x0 = [0; -1];

grad_f_x0 = grad_f(x0);

u0 = -grad_f_x0

gk = @(lambda) f(x0 + lambda * u0); 
lambda_star = fminsearch(gk, 0)

x1 = x0 + lambda_star*u0

% Display the results
disp('Initial point x0:');
disp(x0);
disp('Gradient at x0:');
disp(grad_f_x0);
disp('Next point x1:');
disp(x1);

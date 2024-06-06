function [x_min, num_iterations, norm_at_min] = steepestDescent12(A, b, x0, e)
    % Initialize variables
    k = 0;
    xk = x0;
    gradf = @(x) A * x + b;
    
    % Main loop
    while norm(gradf(xk)) > e
        % Compute descent direction
        Uk = -gradf(xk);
        
        % Line search to find optimal step size
        gk = @(lambda) 0.5*(xk + lambda * Uk)' * A * (xk + lambda * Uk) + b' * (xk + lambda * Uk);
        lambda_star = fminsearch(gk, 0);
        
        % Update xk
        xk = xk + lambda_star * Uk;
        
        % Increment iteration counter
        k = k + 1;
    end
    
    % Output final estimate
    x_min = xk;
    num_iterations = k;
    norm_at_min = norm(gradf(x_min));
end

A = [1,0,1,1; 0,2,0,0; 1,0,3,0; 1,0,0,4];
b = [1;3;1;2];
x0 = [2; 2;2;2];
e = 0.01;
[x_min, num_iterations, norm_at_min] = steepestDescent12(A, b, x0, e);

fprintf('Number of iterations: %d\n', num_iterations);
fprintf('Norm of the gradient at the minimizer: %f\n', norm_at_min);
fprintf('Final estimate of the minimized xk = [%s]\n', num2str(x_min'));
disp('The estimated minimum is');
disp( x_min);
disp('To check if the estimated minimum is the true minimiser:  A*x_min + b =');
disp( A*x_min + b);

disp(0.5* x0' *A *(x0) + x0' *b);
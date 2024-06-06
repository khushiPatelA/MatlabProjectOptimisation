function [xk, x_array] = conjugate_gradient(A, b, x0, epsilon)
    % Initialize variables
    k = 0;
    xk = x0;
    x_array = x0; % Store initial point
    gk = A*x0 + b;
    uk = -gk;

    while norm(gk) >= epsilon
        % Compute step size
        lambda_k = -(gk' * uk) / (uk' * A * uk);
        
        % Update estimate
        xk = xk + lambda_k * uk;
        x_array = [x_array, xk]; % Append the new x value
        
        % Compute new gradient
        gk_new = A*xk + b;
        
        % Compute beta
        beta_k = (gk_new' * A * uk) / (uk' * A * uk);
        
        % Update search direction
        uk = -gk_new + beta_k * uk;
        
        % Update gradient
        gk = gk_new;
        
        % Increment iteration counter
        k = k + 1;
    end
end

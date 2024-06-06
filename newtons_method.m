function [xk, x_array] = newtons_method(f, df, ddf, x0, epsilon, max_iter)
    % Initialize variables
    k = 0;
    xk = x0;
    x_array = x0; % Store initial point
    
    while true
        % Compute the first and second derivatives
        fd = df(xk);
        fdd = ddf(xk);
        
        % Check the second derivative is not zero
        if fdd ~= 0
            % Update the estimate
            xk = xk - fd / fdd;
            k = k + 1;
            x_array = [x_array, xk]; % Append the new x value
        else
            error('Second derivative is zero, try a different initial point x0.');
        end
        
        % Check the stopping criteria
        if abs(fd) < epsilon || k >= max_iter
            break;
        end
    end
end

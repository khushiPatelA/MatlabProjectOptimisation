%does not work



function [a0, b0, x_array] = geometric_search(f, x0, h)
    % Initialize variables
    k = 0;
    x1 = x0 + h;
    
    % Check the direction of the search
    if f(x0) < f(x1)
        h = -h;
        x1 = x0 + h;
    end
    
    % Initialize the points for the algorithm
    x_array = x0; % Store initial point
    xk = x0;
    xk_minus_1 = x0;
    
    % Perform the geometric search
    while true
        k = k + 1;
        xk_plus_1 = xk + 2 * (xk - xk_minus_1);
        x_array = [x_array, xk_plus_1]; % Append the new x value
        
        if f(xk_plus_1) > f(xk)
            break;
        end
        
        % Update points
        xk_minus_1 = xk;
        xk = xk_plus_1;
    end
    
    % Determine the bracketing interval
    if h > 0
        a0 = x_array(end-1);
        b0 = x_array(end);
    else
        a0 = x_array(end);
        b0 = x_array(end-1);
    end
end

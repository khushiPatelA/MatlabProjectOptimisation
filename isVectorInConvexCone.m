function isInCone = isVectorInConvexCone(A, b)
    % This function checks if vector b is in the convex cone spanned by the columns of A.
    % A is a matrix whose columns form the vectors a1, a2, ..., an.
    % b is the vector to check.
    
    % Get the number of columns in A
    [m, n] = size(A);
    
    % Set up the linear programming problem
    % We need to solve for x in A*x = b with x >= 0
    f = zeros(n, 1);         % We don't care about the objective function values
    Aeq = A;                 % Coefficients matrix for equality constraints
    beq = b;                 % Right-hand side for equality constraints
    lb = zeros(n, 1);        % Lower bounds for x (x >= 0)
    
    % Use linprog to solve the linear programming problem
    options = optimoptions('linprog','Display','none');
    [x, ~, exitflag] = linprog(f, [], [], Aeq, beq, lb, [], [], options);
    
    % Check if the solution is found
    if exitflag == 1
        isInCone = true;    % If linprog finds a solution, b is in the convex cone
    else
        isInCone = false;   % Otherwise, b is not in the convex cone
    end
end


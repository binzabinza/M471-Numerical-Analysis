%Newton's Divided Difference Method
function newtonDD(x, f)
    [row, col] = size(x);
    F(1:col, 1:col) = 0;
    %populate the first column
    for q = 1:col
        F(q, 1) = f(q);
    end
    
    %compute
    for i = 2:col
        for j = 2:i 
            F(i, j) = (F(i, j-1) - F(i-1, j-1))/(x(i) - x(i-j+1));
        end
    end
    F
    
    

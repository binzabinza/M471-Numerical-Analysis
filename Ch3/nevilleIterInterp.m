%John Binzer
%Neville's Iterated Interpolation

function nevilleIterInterp(x0, x, f)
    %point to approcimate x0; array carrying the x values; array carrying the f(x) values
    [row, col] = size(x);
    Q(1:col, 1:col) = 0;
    
    %populate the first column
    for q = 1:col
        Q(q, 1) = f(q);
    end
    
    %computes using the algorithm
    for i=2:col
        for j=2:i
            Q(i, j) = ((x0-x(i-j+1))*Q(i, j-1)-(x0-x(i))*Q(i-1, j-1))/(x(i)-x(i-j+1));
        end
    end
    Q
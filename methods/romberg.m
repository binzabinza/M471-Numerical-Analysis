%John Binzer
%Romberg Integration

function romberg(a, b, n, f)
    R(1:n, 1:n) = 0
    h = b-a
    %populate first column
    for k=1:n
        R(k,1) = compT(a, b, 2^(k-1), f)
    end
    for i=2:n
        for j=2:i
            R(i,j) = R(i,j-1) + (R(i, j-1)-R(i-1, j-1))/(4^(j-1)-1)
        end
    end
    
%% Nevilles Method
function neville(x0,x,f)
    n = length(x);
    Q = zeros(n,n);
    Q(:,1) = f;
    for j=2:n
        for i=j:n
            Q(i,j) = ( (x0-x(i))*Q(i-1,j-1) - (x0-x(i-j+1))*Q(i,j-1) )/(x(i-j+1)-x(i));
        end
    end
    Q
    p = Q(n,n);
end

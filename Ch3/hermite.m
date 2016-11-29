%Hermite Interpolation
function hermite(x,f, f2)
    %where x contains the nodes, f contains f(x), and f2 contains f'(x)
    [row, col] = size(x);
    z(1:col*2) = 0;
    Q(1:col*2, 1:col*2) = 0;
    for i=1:col
        z(2*i-1)=x(i);
        z(2*i)=x(i);
        Q(2*i-1, 1)=f(i);
        Q(2*i, 1)=f(i);
        Q(2*i, 2)=f2(i);
        if (i ~= 1)
            Q(2*i-1, 2)=(Q(2*i-1, 1)-Q(2*i-2,1))/(z(2*i-1)-z(2*i-2));
        end
    end
    for i=3:2*col
        for j=3:i
            Q(i, j) = (Q(i, j-1)-Q(i-1, j-1))/(z(i)-z(i-j+1));
        end
    end
    Q
        
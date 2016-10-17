%Natural Cubic Spline
function naturalCubicSpline(n, x, a)
    %where n is the number of subintervals, x is an array containing the
    %nodes and a is an array containing f(x)
    for i=1:n
        h(i)=x(i+1)-x(i);
    end
    for i=2:n
        alpha(i)=3/h(i)*(a(i+1)-a(i))-3/h(i-1)*(a(i)-a(i-1));
    end
    l(1)=1;
    u(1)=0;
    z(1)=0;
    for i=2:n
        l(i)=2*(x(i+1)-x(i-1))-h(i-1)*u(i-1);
        u(i)=h(i)/l(i);
        z(i)=(alpha(i)-h(i-1)*z(i-1))/l(i);
    end
    l(n+1)=1;
    z(n+1)=0;
    c(n+1)=0;
    for j=n:-1:1
        c(j)=z(j)-u(j)*c(j+1);
        b(j)=(a(j+1)-a(j))/h(j)-h(j)*(c(j+1)+2*c(j))/3;
        d(j)=(c(j+1)-c(j))/(3*h(j));
    end
    b(n+1)=0;
    d(n+1)=0;
    final = [a; b; c; d;]
    
    
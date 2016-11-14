%John Binzer
%Composite Trapezoid Rule for integration

function answer = compT(a, b, n, f)
    h = (b-a)/n;
    sum = 0;
    for j=1:n-1
        xj = a + j*h;
        sum = sum + f(xj);
    end
    answer = h/2*(f(a) + 2*sum +f(b));
%John Binzer
%Composite Simpson's Rule

function compSimpson(a, b, n, f)
    %endpoints a,b; even positive integer m; function f
    h = (b-a)/n;
    XI0 = f(a) + f(b);  
    XI1 = 0;            %Summation of f(x(2i-1))
    XI2 = 0;            %Summation of f(x(2i))
    
    for i=1:n-1
        X = a+i*h;
        if (mod(i, 2)==0)
            XI2 = XI2 + f(X);
        else
            XI1 = XI1 + f(X);
        end
    end
    
    XI = h*(XI0+2*XI2+4*XI1)/3

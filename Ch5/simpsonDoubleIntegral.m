%John Binzer
%Simpsons's Double Integral

function simpsonDoubleIntegral(a, b, c, d, m, n, f)
    %endpoints a, b; endpoint functions c, d; 
    %even positive integers m, n; function f
    h = (b-a)/n;
    J(1) = 0;       %end terms
    J(2) = 0;       %even terms
    J(3) = 0;       %odd terms
    
    for i=0:n
        x = a+ i*h;
        HX = (d(x) - c(x))/m;
        K(1) = f(x, c(x)) +f(x, d(x));  %end terms
        K(2) = 0;                       %even terms
        K(3) = 0;                       %odd terms
        
        for j=1:m-1
            y = c(x) + j*HX;
            Q = f(x, y);
            if (mod(j,2) == 0)
                K(2) = K(2) + Q;
            else
                K(3) = K(3) + Q;
            end
        end
        
        L = (K(1) + 2*K(2) + 4*K(3))*HX/3;
        
        if or((i==0), (i==n))
            J(1) = J(1) + L;
        elseif (mod(i, 2) == 0)
            J(2) = J(2) + L;
        else
            J(3) = J(3) + L;
        end
    end
    Jf = h*(J(1) + 2*J(2) + 4*J(3))/3
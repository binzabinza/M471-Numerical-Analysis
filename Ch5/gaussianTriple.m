%John Binzer
%Gaussian Triple Integral

function gaussianTriple(a, b, c, d, g, h, m, n, p, f)
    %endpoints a, b; functional endpoints c, d, g, h;
    %positive integers m, n, p; function f;
    
    %coefficient/root table
    r2 = [0.57733502692, 1;
          -0.57733502692, 1;];
    r3 = [0.7745966692, 0.5555555555;
          0, 0.888888888
          -0.7745966692, 0.5555555555;];
      
    %!!!CURRENTLY SET TO ACCOMODATE m=n=p=2 !!!!
    
    h1 = (b-a)/2;
    h2 = (b+a)/2;
    J = 0;
    
    for i = 1:m
        JX = 0;
        x = h1*r2(i) + h2;
        d1 = d(x);
        c1 = c(x);
        k1 = (d1-c1)/2;
        k2 = (d1+c1)/2;
        
        for j = 1:n
            JY=0;
            y = k1*r2(j) + k2;
           	beta = h(x, y);
            alpha = g(x, y);
            l1 = (beta-alpha)/2;
            l2 = (beta+alpha)/2;
            
            for k = 1:p
                z = l1*r2(k) +l2;
                Q = f(x, y, z);
                JY = JY + Q;
            end
            
            JX = JX + l1*JY;
        end
        
        J = J + k1*JX;
        
    end
    
    J = h1*J
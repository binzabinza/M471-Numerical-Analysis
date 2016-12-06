%John Binzer
%Adams Fourth-Order Predictor-Corrector

function adams4PC(a, b, N, alpha, f)
    %a, b are the endpoints, N determines step size, alpha is the initial
    %condition
    h = (b-a)/N;
    t(1) = a;
    w(1) = alpha;
    
    %sprintf('(%d, %d)', t(1), w(1))
    
    for i=2:4
        K(1) = h*f(t(i-1), w(i-1));
        K(2) = h*f(t(i-1)+h/2, w(i-1)+K(1)/2);
        K(3) = h*f(t(i-1)+h/2, w(i-1)+K(2)/2);
        K(4) = h*f(t(i-1)+h, w(i-1)+K(3));
        
        w(i) = w(i-1)+(K(1)+2*K(2)+2*K(3)+K(4))/6;
        t(i) = a +(i-1)*h;
        
        %sprintf('(%d, %d)', t(i), w(i))
    end
    
    for i= 5:N+1
        tf = a + (i-1)*h;
        wf = w(4)+h*(55*f(t(4), w(4))-59*f(t(3), w(3))+37*f(t(2), w(2))-9*f(t(1), w(1)))/24;
        wf = w(4)+h*(9*f(tf, wf)+19*f(t(4), w(4))-5*f(t(3), w(3))+f(t(2), w(2)))/24;
        
        %sprintf('(%d, %d)', tf, wf)
        
        for j=1:3
            t(j) = t(j+1);
            w(j) = w(j+1);
        end
        t(4) = tf;
        w(4) = wf;
    end
    sprintf('t = %d, w = %d', tf, wf)   
%John Binzer
%Euler's Method

function eulers(a, b, N, alpha, f)
    %endpoints a, b; even integer N; inital condition alpha; function f
    h = (b-a)/N;
    t = a;
    w = alpha;
    
    fprintf('t(%d) =', a)
    fprintf('%g', w)
    fprintf('\n')
    
    for i=1:N
        w = w + h*f(t, w);
        t = a+i*h;
        
        fprintf('t(%g) =', t)
        fprintf('%g', w)
        fprintf('\n')
    end
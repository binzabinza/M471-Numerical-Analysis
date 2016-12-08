%John Binzer
% Trapezoidal with Newton Iteration

function trapezoidalNewtonIteration(a, b, N, alpha, TOL, M, f, fy)
    %endpoints a, b; integer N; initial condition alpha; tolernace TOL;
    %maximum number of iterations at any step M; function f; partial
    %derivative of f wrt y fy;
    h = (b-a)/N;
    t = a;
    w = alpha;
    
    fprintf('t(%d) =', t)
    fprintf('%g', w)
    fprintf('\n')
    
    for i=1:N
        k1 = w + h/2*f(t,w);
        w0 = k1;
        j = 1;
        FLAG = 1;
        
        while (FLAG)
            w = w0 - (w0-h/2*f(t+h, w0)-k1)/(1-h/2*fy(t+h, w0));
            if (abs(w-w0) < TOL)
                FLAG = 0;
            else
                j = j+1;
                w0 = w;
                if (j>M)
                    disp('Maximum number of iterations exceeded')
                end
            end
        end
        
        t = a+i*h;
        fprintf('t(%d) =', t)
        fprintf('%g', w)
        fprintf('\n')
    end        
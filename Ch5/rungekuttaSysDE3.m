%John Binzer
%Runge-Kutta Method for Systems of Differential Equations

function rungekuttaSysDE3(a, b, m, N, alpha)
    %a, b are endpoints, m is an array containing the differntial equations,
    %N determines step size, alpha is an array containing the initial
    %conditions.
    
    %% !!!CURRENTY PROGRAMMED FOR SYSTEM OF THREE EQUATIONS!!!
    e = 2.7182818284590452353602874713527;
    
    h = (b-a)/N;
    t=a;
    for j=1:3
        w(j) = alpha(j);
    end
    
    fprintf('t(%d) =', a)
    fprintf(' %g', w)
    fprintf('\n')
    
    for i=1:N
        for j=1:3
            f = cell2mat(m(j));
            k(1, j) = h*f(t, w(1), w(2), w(3));
        end
        for j=1:3
            f = cell2mat(m(j));
            k(2,j) = h*f(t+h/2, w(1)+k(1,1)/2, w(2)+k(1,2)/2, w(3)+k(1,3)/2);
        end
        for j=1:3
            f = cell2mat(m(j));
            k(3,j) = h*f(t+h/2, w(1)+k(2,1)/2, w(2)+k(2,2)/2, w(3)+k(2,3)/2);
        end
        for j=1:3
            f = cell2mat(m(j));
            k(4,j) = h*f(t+h, w(1)+k(3,1), w(2)+k(3,2), w(3)+k(3,3));
        end
        for j=1:3
            w(j) = w(j) + (k(1,j)+2*k(2,j)+2*k(3,j)+k(4,j))/6;
        end
        
        t = a+i*h;
        fprintf('t(%g) =', t)
        fprintf(' %g', w)
        fprintf('\n')
    end
    
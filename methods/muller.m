%Muller's Method
function muller(p0, p1, p2, TOL, N0, f)
    fprintf('P(0) = %d\n', p0)
    fprintf('P(1) = %d\n', p1)
    fprintf('P(2) = %d\n', p2)
    h1 = p1 - p0;
    h2 = p2 - p1;
    delta1 = (f(p1) - f(p0))/h1;
    delta2 = (f(p2) - f(p1))/h2;
    d = (delta1 - delta2)/(h2 + h1);
    i = 3;
    while (i <= N0)
        b = delta2 + h2*d;
        D = (b.^2 - 4*f(p2)*d).^(1/2);
        if (abs(b-D) < abs(b+D))
            E = b + D;
        else
            E = b - D;
        end
        h = (-2)*f(p2)/E;
        p = p2+h;
        fprintf('P(%d) = %d\n', i, p)
        if (abs(h) < TOL)
            fprintf('\n')
            return
        end
        p0 = p1;
        p1 = p2;
        p2 = p;
        h1 = p1 - p0;
        h2 = p2 - p1;
        delta1 = (f(p1) - f(p0))/h1;
        delta2 = (f(p2) - f(p1))/h2;
        d = (delta2 - delta1)/(h2 + h1);
        i = i + 1;
    end
    fprintf('Method failed after %d iterations.', N0)
end
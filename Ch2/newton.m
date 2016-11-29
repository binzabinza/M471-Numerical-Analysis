%Newton's Method%
function newton(p0, TOL, N0, f, f1)
    i = 1;
    fprintf('P(0) = %d\n', p0)
    while i <= N0
        p = p0-f(p0)/f1(p0);
        fprintf('P(%d) = %d\n', i, p)
        if (abs(p-p0) < TOL)
            fprintf('\n')
            return
        end
        i = i+1;
        p0=p;
    end
    fprintf('Method failed after %d iterations\n\n', N0)
end
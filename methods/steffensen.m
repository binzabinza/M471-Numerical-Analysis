%Steffensen's Method%
function steffensen(p0, TOL, N0, f)
    i = 1;
    fprintf('P(0) = %d\n', p0)
    while (i < N0)
        p1 = f(p0);
        p2 = f(p1);
        p = p0-((p1-p0).^2)/(p2-2*p1+p0);
        fprintf('P(%d) = %d\n', i, p)
        if (abs(p-p0) < TOL)
            fprintf('\n');
            return
        end
        i = i + 1;
        p0 = p;
    end
    fprintf('Method failed after %d iterations', N0)
end
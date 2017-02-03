%John Binzer
%Fixed Point Iteration

function fixpoint(p0, f, TOL, N0)
    %initial approximation p0; function f; tolerance TOL; maximum number of
    %iterations N0
    i = 1;
    fprintf('0\t%d\n', p0)
    while (i <= N0)
        p = f(p0);
        fprintf('%d\t%d\n', i, p)
        if (abs(p-p0) < TOL)
            return
        end
        
        i = i + 1;
        p0 = p;
    end
    fprintf('Method failed after %d iterations.', N0)
end
%The Method of False Position%
function falsePosition(p0, p1, TOL, N0, f)
    i = 2;
    fprintf('P(0) = %d\n', p0)
    fprintf('P(1) = %d\n', p1)
    q0 = f(p0);
    q1 = f(p1);
    while i <= N0
        p = p1-q1*(p1-p0)/(q1-q0);
        fprintf('P(%d) = %d\n', i, p)
        if (abs(p-p1) < TOL)
            fprintf('\n')
            return
        end
        i = i+1;
        q = f(p);
        if (q*q1 <0)
            p0=p1;
            q0=q1;
        end
        p1=p;
        q1=q;
    end
    fprintf('Method failed after %d iterations\n\n', N0)
end
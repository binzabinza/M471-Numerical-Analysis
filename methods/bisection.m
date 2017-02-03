%John Binzer
%The Bisection Method
%Also called the binary search method

function bisection(a, b, f, TOL, N0)
    %endpoints a, b; tolerance TOL; maximum number of iterations N0;
    %function f
    i = 1;
    FA = f(a);
    while (i <= N0)
        p = a + (b-a)/2;
        FP = f(p);
        fprintf('%d\t%d\t%d\t%d\t%d\n', i, a, b, p, FP)
        if (FP == 0) | ((b-a)/2 < TOL)
            return
        end
        
        i = i +1;
        if (FA*FP > 0)
            a = p;
            FA = FP;
        else
            b = p;
        end 
    end
end
%%Horner's%%
function answer = horner(n, coeffecients, x0)
    coeffecients = flip(coeffecients);
    y = coeffecients(n+1);
    z = coeffecients(n+1);
    j = n;
    while (j > 1)
        y = x0*y + coeffecients(j);
        z = x0*z + y;
        j = j-1;
    end
    y = x0*y+coeffecients(1);
    answer = x0-y/z;
end 

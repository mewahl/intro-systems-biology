function [] = fsp_dimer()
    k1 = 2;
    k2 = 1;
    n = 8;
    t = 1000;
    
    % Begin by filling out the matrix A
    A = zeros(n,n);
    for i = 1:n
        A(i,i) = -k1;
        if i > 1
            A(i,i-1) = k1;
        end
        if i > 2
            A(i-2,i) = k2*(i-1)*(i-2);
            A(i,i) = A(i,i) - k2*(i-1)*(i-2);
        end
    end
    % Next calculate the probability distribution at the end
    P0 = zeros(n,1);
    P0(1) = 1;
    Pt_estimated = expm(A*t) * P0;
    disp(sprintf('The error at time %d is less than %0.4f when n=%d', t, ...
        1-sum(Pt_estimated), n));
end

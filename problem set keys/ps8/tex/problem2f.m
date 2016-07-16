function [] = problem2f()
    k1 = 0.2;
    k2 = 0.1;
    N = 1000;
    
    delta_t = 0.1;
    t = 0:delta_t:1000;
    x0= [100 500 900];
    for i=1:3
        x = zeros(1,length(t)); x(1) = x0(i);
        for j=2:length(t)
            x(j) = x(j-1) + ((k1/N)*x(j-1)*(N - x(j-1)) - k2*x(j-1))*delta_t + ...
                ((k1/N)*x(j-1)*(N - x(j-1)) + k2*x(j-1))^0.5 *(delta_t^0.5)*normrnd(0,1);
            if x(j) > N
                x(j) = N;
            elseif x(j) < 0
                x(j) = 0;
            end
        end
        plot(t,x,'LineWidth',2); hold on;
    end
    
    % Normalize the "pseudo-stationary probability distribution"
    lnp = zeros(1,N);
    for x=1:N
        lnp(x) = -1 * log(1/((k1/N)*x*(N - x) + k2*x)) + x + ...
            (2*k2*N/k1) * log(abs(k1*x - (k1+k2)*N));
    end
    lnp = lnp - min(lnp);
    p = exp(lnp);
    p = p ./ sum(p);
    p_mean = 0;
    p_variance = 0;
    for x=1:N
       p_mean = p_mean + x*p(x);
       p_variance = p_variance + (x^2)*p(x);
    end
    p_variance = p_variance - p_mean^2;
    p_std_dev = p_variance^0.5;
    plot([0, t(end)],[p_mean - 2 * p_std_dev, p_mean - 2 * p_std_dev],'k')
    plot([0, t(end)],[p_mean + 2 * p_std_dev, p_mean + 2 * p_std_dev],'k')
    xlabel('Time')
    ylabel('x')
    set(gca,'FontSize',16)
end
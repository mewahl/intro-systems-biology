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
 
    xlabel('Time')
    ylabel('x')
    set(gca,'FontSize',16)
    
end
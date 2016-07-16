function [] = nyquist_delay()
    tau = 0;
    F = @(w) exp(- i .* w .* tau)./((i.*w+1).*(i.*w+1));
    w = linspace(-100, 100, 100000);
    result = F(w);
    plot(real(result(:)), imag(result(:)), '-r'); hold on;
    
    tau = 1;
    F = @(w) exp(- i .* w .* tau)./((i.*w+1).*(i.*w+1));
    result = F(w);
    plot(real(result(:)), imag(result(:)), '-b');
    xlabel('Real')
    ylabel('Imaginary')
    legend('\tau=0','\tau=1','Location','NorthEast')
    set(gca, 'FontSize', 16)
end
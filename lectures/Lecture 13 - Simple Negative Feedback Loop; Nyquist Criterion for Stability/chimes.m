function [] = chimes(x)
    t = 1:16000; % about two seconds
    impulse_response = sin(0.5.*pi.*t).*exp(-0.001.*t);
    y = zeros(1,length(t)+length(x)-1);
    for i=1:length(x)
        y(i:i+15999) = y(i:i+15999) + x(i) .* impulse_response;
    end
    plot(y); hold on;
    x = [x zeros(1,length(y)-length(x))];
    plot(1:length(x),x,'-r','LineWidth', 2);
    ylabel('Output');
    xlabel('Time');
    set(gca, 'FontSize', 16)
    sound(y);
end
function [s, y1, z1] = generate_inhibitor_data()
    s = [3:0.5:30];
    vmax = 25;
    km = 14;
    y = vmax .* s ./ (km + s);
    z = (vmax/(1 + 1)) .* s ./ (km + s);
    y1 = y;
    z1 = z;
    figure
    plot(s, y1, 'or', 'MarkerFaceColor', [1 0 0], 'MarkerEdgeColor', [0 0 0], 'MarkerSize', 7); hold on;
    plot(s, z1, 'ob', 'MarkerFaceColor', [0 0 1], 'MarkerEdgeColor', [0 0 0], 'MarkerSize', 7);
    set(gca, 'FontSize', 24);
    xlabel('[S] (\muM)');
    ylabel('V (\muM/min)');
    axis([0 30 0 25])
    
    % Now do lineweaver burk
    sinv = 1./s;
    yinv = 1./y1;
    zinv = 1./z1;
    
    figure
    p = polyfit(sinv, yinv, 1);
    disp(sprintf('No inhibitor: slope %0.4f and intercept %0.4f', p(1), p(2)))
    plot(sinv, sinv.*p(1) + p(2), '-r', 'LineWidth', 2); hold on;
    plot(sinv, yinv, 'or', 'MarkerFaceColor', [1 0 0], 'MarkerEdgeColor', [0 0 0], 'MarkerSize', 7);
    p = polyfit(sinv, zinv, 1);
    disp(sprintf('Inhibitor: slope %0.4f and intercept %0.4f', p(1), p(2)))
    plot(sinv, sinv.*p(1) + p(2), '-b', 'LineWidth', 2);
    plot(sinv, zinv, 'ob', 'MarkerFaceColor', [0 0 1], 'MarkerEdgeColor', [0 0 0], 'MarkerSize', 7);
    set(gca, 'FontSize', 24);
    xlabel('1/[S] (\muM^{-1})');
    ylabel('1/V (min/\muM)');
    axis([0 1 0 1])
    
end
function [] = hill()
    s = [0:0.5:40];
    vmax = 5;
    km = 3;
    y = vmax .* s ./ (km + s);
    y1 = y + 0.7*rand(1,length(s));
    plot(s, y1, 'or', 'MarkerFaceColor', [1 0 0], 'MarkerEdgeColor', [0 0 0], 'MarkerSize', 7); hold on;
    set(gca, 'FontSize', 24);
    xlabel('[S] (\muM)');
    ylabel('V (\muM/min)');
    axis([0 40 0 7])
    
end
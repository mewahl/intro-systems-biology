function [] = regression(s,r1)
    x = 1 ./ s;
    y = 1./ r1;
    
    % Now we'll use polyfit() to get the slope and y-intercept. The "1"
    % indicates we want to fit a first-order polynomial (y = mx + b).
    p = polyfit(x, y, 1);
    slope = p(1);
    yintercept = p(2);
    disp(sprintf('Found: slope=%0.4f and y-intercept=%0.4f', slope, ...
        yintercept))
    
    % Determine the y value for the regression line at each data point x.
    fitted_points = x .* slope + yintercept;

    figure
    plot(x, fitted_points, '-r', 'LineWidth', 3); hold on;
    plot(x, y, 'or', 'MarkerFaceColor', [1 0 0], 'MarkerEdgeColor', [0 0 0], 'MarkerSize', 7);
    set(gca, 'FontSize', 24);
    xlabel('X');
    ylabel('Y');
    axis([1 10 0 25])
    h = legend('Regression line', 'Data points', 'Location', 'SouthEast');
    set(h, 'FontSize', 20);
    
end
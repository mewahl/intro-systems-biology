%Problem3
tdfread('rate_data.tsv')
%rename substrate concentration to s
%rename rate without inhibitor to r1
%rename rate with inhibitor to r2

for i=1:55
    x(i,1)=1/s(i,1)
    y1(i,1)=1/r1(i,1)
    y2(i,1)=1/r2(i,1)
end

p1 = polyfit(x, y1, 1);
    slope1 = p1(1);
    yintercept1 = p1(2);
    disp(sprintf('Found: slope=%0.4f and y-intercept=%0.4f', slope1, ...
        yintercept1))

p2 = polyfit(x, y2, 1);
    slope2 = p2(1);
    yintercept2 = p2(2);
    disp(sprintf('Found: slope=%0.4f and y-intercept=%0.4f', slope2, ...
        yintercept2))
   
    % Determine the y value for the regression line at each data point x.
fitted_points = x .* slope1 + yintercept1;
fitted_points2 = x .* slope2 + yintercept2;
    figure
    plot(x, fitted_points, '-r', 'LineWidth', 3); hold on;
    plot(x, fitted_points2, '-g', 'LineWidth', 3); hold on;
    plot(x, y1, 'or', 'MarkerFaceColor', [1 0 0], 'MarkerEdgeColor', [0 0 0], 'MarkerSize', 7); hold on;
    plot(x, y2, 'or', 'MarkerFaceColor', [0 1 0], 'MarkerEdgeColor', [0 0 0], 'MarkerSize', 7); hold on;
    set(gca, 'FontSize', 24);
    xlabel('X');
    ylabel('Y');
    axis([0 0.4 0 0.5])
    h = legend('Regression line', 'Data points', 'Location', 'SouthEast');
    set(h, 'FontSize', 20);

% The Vmax values are one over the y-intercepts, so 25 and 12.5, and the
% Kms should be 14 in each case. The solution is that the inhibitor is a non-competitive inhibitor since it lowers Vmax.
    
%Problem4
x=1:5:500;
k1=500;
k2=1000;
k3=2000;
for i=1:size(x,2)
    y1(1,i)=((k1/1000000+1)*x(1,i)^2+(1+k1/1000)*x(1,i))/(k1*(1+x(1,i)/1000)^2+(1+x(1,i))^2);
    y2(1,i)=((k2/1000000+1)*x(1,i)^2+(1+k2/1000)*x(1,i))/(k2*(1+x(1,i)/1000)^2+(1+x(1,i))^2);
    y3(1,i)=((k3/1000000+1)*x(1,i)^2+(1+k3/1000)*x(1,i))/(k3*(1+x(1,i)/1000)^2+(1+x(1,i))^2);
end
plot(x,y1(1,:),'r',x,y2(1,:),'g',x,y3(1,:),'b');
title('Solution of 4.a');
xlabel('[X]');
ylabel('Y');
legend('K=500','K=1000','K=2000')

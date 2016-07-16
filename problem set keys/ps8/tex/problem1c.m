function [] = problem1c()
    D = 1;
    a = 1;
    L = 5;
    x = -20:0.1:20;
    
    t = 0.01;
    y = (a/2) * (2 + erf((x-L)/(4*D*t)^0.5) - erf((x+L)/(4*D*t)^0.5));
    plot(x,y,'-k'); hold on;
    
    t = 1;
    y = (a/2) * (2 + erf((x-L)/(4*D*t)^0.5) - erf((x+L)/(4*D*t)^0.5));
    plot(x,y,'-r'); 
    
    t = 100;
    y = (a/2) * (2 + erf((x-L)/(4*D*t)^0.5) - erf((x+L)/(4*D*t)^0.5));
    plot(x,y,'-b');
    
    legend('t=0.01','t=1','t=100','Location','SouthEast')
    set(gca,'FontSize',16)
    xlabel('Position')
    ylabel('Concentration')
    
end
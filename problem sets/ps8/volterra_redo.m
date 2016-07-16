function [] = volterra_redo()
    global b d1 d2 p1 p2 N
    b = 2*0.1; d1 = 0.1; d2 = 0.0; p1 = 2*0.25; p2 = 2*0.05; N = 3200;    
    dt = 0.1;
    t= 4000;
    langevin = zeros(2,t); langevin(:,1) = [800; 800];
    for i=2:t
        langevin(:,i) = determine_changes_langevin(langevin(:,i-1),dt) + langevin(:,i-1);
    end
    figure
    subplot(1,2,1)
    ts = [1:t] * dt;
    plot(ts,langevin(1,:),'-r'); hold on;
    plot(ts,langevin(2,:),'-b');
    xlabel('Time')
    ylabel('Population')
    legend('Predator','Prey','Location','SouthWest')
     axis([0 400 400 900])
    
    [timepoints, results] = gillespie_simulation(t*dt, [800; 800]);
    subplot(1,2,2)
    plot(timepoints,results(1,:),'-r'); hold on;
    plot(timepoints,results(2,:),'-b');
    xlabel('Time')
    ylabel('Population')
    legend('Predator','Prey','Location','SouthWest')
     axis([0 400 400 900])
    
end

function changes = determine_changes_langevin(current,dt)
    global b d1 d2 p1 p2 N
    x = current(1); y = current(2);
    mu = [p1*x*y/N - d1*x; b*y*(N-x-y)/N - d2*y - (p1+p2)*x*y/N] .* dt;
    variance = [d1*x+p1*x*y/N, -p1*x*y/N; -p1*x*y/N, b*y*(N-x-y)/N + d2*y + (p1+p2)*x*y/N];
    sigma = sqrtm(variance);
    random_values = normrnd(0,1,2,1) * (dt^0.5);
    changes = mu + sigma*random_values;
end

function [timepoints, results] = gillespie_simulation(stop_time, initial_counts)
	x = [initial_counts(1)];
    y = [initial_counts(2)];

    timepoints = [0];
    global b d1 d2 p1 p2 N
    j = 1;
    while timepoints(j) < stop_time
        rates = [b*y(j)*(N-x(j)-y(j))/N, d1*x(j), d2*y(j), p1*x(j)*y(j)/N, p2*x(j)*y(j)/N];
        timepoints(j+1) = timepoints(j)+exprnd(1/sum(rates));
        % Pick which reaction will happen next
        event = randsample(5,1,true, rates ./ sum(rates));
        if event == 1
            x(j+1) = x(j); y(j+1)=y(j)+1;
        elseif event == 2
            x(j+1) = x(j) - 1; y(j+1)=y(j);
        elseif event == 3
            x(j+1) = x(j); y(j+1)=y(j)-1;
        elseif event == 4
            x(j+1) = x(j)+1; y(j+1)=y(j)-1;
        elseif event == 5
            x(j+1) = x(j); y(j+1)=y(j)-1;
        end
        j = j + 1;
    end

    results = [x;y];

end


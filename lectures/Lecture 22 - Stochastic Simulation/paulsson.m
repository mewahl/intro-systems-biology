function [] = paulsson()
    initial_counts = [0, 100, 0]; % I, P, S
    time_interval = [0, 15];
    
    global k ka kd kp
    k = 1E4;
    ka = 1000;
    kd = 100;
    kp = 100;
    
    % Run the simulation using Runge-Kutta method
    [timepoints, counts] = ode45(@chain1ddt, ...
        time_interval, initial_counts);
    
    % Plot the results
    hold on;
    plot(timepoints, counts(:,2), '-b', 'LineWidth', 3);
    
    % Run the Gillespie simulation with perfect signal
    [timepoints, counts] = gillespie_nosignalnoise(time_interval, initial_counts);
    plot(timepoints, counts, '-k', 'LineWidth', 3);
    
    % Run the Gillespie simulation with noisy signal
    [timepoints, counts] = gillespie(time_interval, initial_counts);
    plot(timepoints, counts, '-r', 'LineWidth', 3);
    
    xlabel('Time');
    ylabel('Protein molecule count');
    h = legend('Deterministic', 'Perfect signal', 'Noisy signal', 'Location', 'SouthEast');
    set(gca, 'FontSize', 24);
    set(h, 'FontSize', 24);
end

function changes_in_counts = chain1ddt(time, current_counts)
    % Use shorter variable names for convenience
    i = current_counts(1);
    p = current_counts(2);
    s = current_counts(3);

    global ka kp kd k
    if time > 5
        ks = 5*kd;
    else
        ks = 10*kd;
    end
    change_in_i = k + kp*i -ka*s*i;
    change_in_p = kp*i - p;
    change_in_s = ks - kd*s;
    changes_in_counts = [change_in_i; change_in_p; change_in_s];
end

function [timepoints, p] = gillespie(time_interval, initial_counts)
	i = initial_counts(1);
    p = [initial_counts(2), zeros(1,1000000)];
    s = initial_counts(3);

    timepoints = [time_interval(1), zeros(1,1000000)];
    global k ka kd kp
    j = 1;
    while timepoints(j) < time_interval(2)
       % Pick a time for the next reaction
        if timepoints(j) > 5
            ks = 5*kd;
        else
            ks = 10*kd;
        end
        rates = [k, ka*s*i, kp*i, p(j), ks, kd*s];
        timepoints(j+1) = timepoints(j)+exprnd(1/sum(rates));
        timepoints(j);
        % Pick which reaction will happen next
        event = randsample(6,1,true, rates ./ sum(rates));
        if event == 1
            i = i+1; p(j+1) = p(j);
        elseif event == 2
            i = i-1; p(j+1) = p(j);
        elseif event == 3
            i = i-1; p(j+1) = p(j)+1;
        elseif event == 4
            p(j+1) = p(j)-1;
        elseif event == 5
            p(j+1) = p(j); s = s+1;
        else
            p(j+1) = p(j); s = s-1;
        end
        j = j + 1;
    end

    p = p(1:j);
    timepoints = timepoints(1:j);

end

function [timepoints, p] = gillespie_nosignalnoise(time_interval, initial_counts)
	i = initial_counts(1);
    p = [initial_counts(2), zeros(1,1000000)];

    timepoints = [time_interval(1), zeros(1,1000000)];
    global k ka kp
    j = 1;
    while timepoints(j) < time_interval(2)
       % Pick a time for the next reaction
        if timepoints(j) > 5
            s = 5;
        else
            s = 10;
        end
        rates = [k, ka*s*i, kp*i, p(j)];
        timepoints(j+1) = timepoints(j)+exprnd(1/sum(rates));

        % Pick which reaction will happen next
        event = randsample(4,1,true, rates ./ sum(rates));
        if event == 1
            i = i+1; p(j+1) = p(j);
        elseif event == 2
            i = i-1; p(j+1) = p(j);
        elseif event == 3
            i = i-1; p(j+1) = p(j)+1;
        else
            p(j+1) = p(j)-1;
        end
        j = j + 1;
    end

    p = p(1:j);
    timepoints = timepoints(1:j);

end

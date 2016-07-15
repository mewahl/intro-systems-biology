function chain1
    initial_concentrations = [1, 0]; %    S_1(0) = 1   and   S_2(0) = 0
    time_interval = [0, 5];
    
    % Run the simulation using Runge-Kutta method
    [timepoints, concentrations] = ode45(@chain1ddt, ...
        time_interval, initial_concentrations);
    % the matrix "concentrations" has two rows: the first contains
    % the concentration at each timepoint for s_1, the second row, for s_2
    
    % Plot the results
    hold on;
    plot(timepoints, concentrations(:,1), '-r', 'LineWidth', 3);
    plot(timepoints, concentrations(:,2), '-b', 'LineWidth', 3);
    xlabel('Time');
    ylabel('Concentration');
    h = legend('s_1', 's_2');
    set(gca, 'FontSize', 24);
    set(h, 'FontSize', 24);
end

function changes_in_concentrations = chain1ddt(time, current_concentrations)
    % We ignore the time variable because the reaction rates don't depend
    % on time.
    
    % Use shorter variable names for convenience
    s1 = current_concentrations(1);
    s2 = current_concentrations(2);

    v0 = 5;
    k1 = 3;
    k2 = 2;
    change_in_s1 = v0 - k1 * s1;
    change_in_s2 = k1 * s1 - k2*s2;
    changes_in_concentrations = [change_in_s1; change_in_s2];
end

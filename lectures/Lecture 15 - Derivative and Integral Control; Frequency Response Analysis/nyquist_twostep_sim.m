function [] = nyquist_twostep_sim()
    initial_concentrations = [0, -10];
    time_interval = [0, 4];
    global k
    k = 0.01;
    [timepoints, concentrations] = ode45(@chain1ddt, ...
        time_interval, initial_concentrations);
    plot(timepoints, concentrations(:,2), '-r', 'LineWidth', 3); hold on;
    k=0.3;
    [timepoints, concentrations] = ode45(@chain1ddt, ...
        time_interval, initial_concentrations);
    plot(timepoints, concentrations(:,2), '-b', 'LineWidth', 3); hold on;
    k=4;
    [timepoints, concentrations] = ode45(@chain1ddt, ...
        time_interval, initial_concentrations);
    plot(timepoints, concentrations(:,2), '-k', 'LineWidth', 3); hold on;
    xlabel('Time');
    ylabel('Concentration');
    h = legend('k=0.01', 'k=0.2', 'k=4','Location','SouthEast');
    set(gca, 'FontSize', 24);
    set(h, 'FontSize', 24);
end

function changes_in_concentrations = chain1ddt(time, current_concentrations)
    m = current_concentrations(1);
    p = current_concentrations(2);
    cp = 1;
    cm = 1;
    gp = 1;
    gm = 1;
    global k
    change_in_m = - cm * k*p - gm*m;
    change_in_p = cp * m - gp * p;
    changes_in_concentrations = [change_in_m; change_in_p];
end
function [] = slime()
    global k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 k11 k12 k13 k14
    k1 = 2.0;
    k2 = 0.9;
    k3 = 2.5;
    k4 = 1.5;
    k5 = 0.6;
    k6 = 0.8;
    k7 = 1.0;
    k8 = 1.3;
    k9 = 0.3;
    k10 = 0.8;
    k11 = 0.7;
    k12 = 4.9;
    k13 = 23.0;
    k14 = 4.5;
    initial_phases = [1, 1, 1, 1, 1, 1, 1];
    time_interval = [0, 20];
    [timepoints, concentrations] = ode45(@chain1ddt, ...
        time_interval, initial_phases);
    plot(timepoints, concentrations(:,5), '-b', 'LineWidth', 3); hold on;
    title('Single cell')
    xlabel('Time');
    ylabel('cAMPint concentration');
    set(gca, 'FontSize', 24);
end

function changes_in_values = chain1ddt(time, current_concentrations)
    global k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 k11 k12 k13 k14

    ACA = current_concentrations(1);
    PKA = current_concentrations(2);
    ERK2 = current_concentrations(3);
    REGA = current_concentrations(4);
    cAMPint = current_concentrations(5);
    cAMPext = current_concentrations(6);
    CAR1 = current_concentrations(7);
   
    change_in_ACA = k1*CAR1 - k2*ACA*PKA;
    change_in_PKA = k3*cAMPint - k4*PKA;
    change_in_ERK2 = k5*CAR1 - k6*ERK2*PKA;
    change_in_REGA = k7 - k8*REGA*ERK2;
    change_in_cAMPint = k9*ACA - k10*REGA*cAMPint;
    change_in_cAMPext = k11*ACA - k12*cAMPext;
    change_in_CAR1 = k13*cAMPext - k14*CAR1;
    changes_in_values = [change_in_ACA; change_in_PKA; change_in_ERK2; ...
        change_in_REGA; change_in_cAMPint; change_in_cAMPext; change_in_CAR1];
end

function returned_value = H(phase_difference)
    global a b
    returned_value = a * sin(phase_difference) + b * sin(2*phase_difference);
end
function [] = slime_twocell()
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
    initial_phases = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4];
    time_interval = [0, 20];
    [timepoints, concentrations] = ode45(@chain1ddt, ...
        time_interval, initial_phases);
    plot(timepoints, concentrations(:,5), '-b', 'LineWidth', 3); hold on;
    plot(timepoints, concentrations(:,12), '-r', 'LineWidth', 3);
    
    xlabel('Time');
    ylabel('Concentration');
    h = legend('cAMPint #1','cAMPint #2');
    set(gca, 'FontSize', 24);
    set(h, 'FontSize', 24);
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
    ACA2 = current_concentrations(8);
    PKA2 = current_concentrations(9);
    ERK22 = current_concentrations(10);
    REGA2 = current_concentrations(11);
    cAMPint2 = current_concentrations(12);
    CAR12 = current_concentrations(13);
   
    change_in_ACA = k1*CAR1 - k2*ACA*PKA;
    change_in_PKA = k3*cAMPint - k4*PKA;
    change_in_ERK2 = k5*CAR1 - k6*ERK2*PKA;
    change_in_REGA = k7 - k8*REGA*ERK2;
    change_in_cAMPint = k9*ACA - k10*REGA*cAMPint;
    change_in_cAMPext = k11*ACA + k11*ACA2 - k12*cAMPext;
    change_in_CAR1 = k13*cAMPext - k14*CAR1;
    
    change_in_ACA2 = k1*CAR12 - k2*ACA2*PKA2;
    change_in_PKA2 = k3*cAMPint2 - k4*PKA2;
    change_in_ERK22 = k5*CAR12 - k6*ERK22*PKA2;
    change_in_REGA2 = k7 - k8*REGA2*ERK22;
    change_in_cAMPint2 = k9*ACA2 - k10*REGA2*cAMPint2;
    change_in_CAR12 = k13*cAMPext - k14*CAR12;
    
    changes_in_values = [change_in_ACA; change_in_PKA; change_in_ERK2; ...
        change_in_REGA; change_in_cAMPint; change_in_cAMPext; change_in_CAR1; ...
        change_in_ACA2; change_in_PKA2; change_in_ERK22; ...
        change_in_REGA2; change_in_cAMPint2; change_in_CAR12];
end

function returned_value = H(phase_difference)
    global a b
    returned_value = a * sin(phase_difference) + b * sin(2*phase_difference);
end
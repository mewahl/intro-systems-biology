function [] = chimescontroller()
    % One pulse
    %x = [1];
    
    % Two pulses far apart
    %x = [1 zeros(1,10999) 1];
    
    % Two pulses closer together
    %x = [1 zeros(1,999) 1];
    
    % Many pulses, all in phase
    %x = reshape([ones(1,2500); zeros(7,2500)],[1,20000]);
    
    % Many pulses, not in phase
    x = ones(1,5000);
    
    chimes(x);
end
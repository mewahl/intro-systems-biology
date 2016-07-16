function [timepoints, signal] = generate_weather()
    t = logspace(-3, 3, 1000); % units of 1 day
    %x = normpdf(t,1,0.1) + 10*normpdf(t,365,1) + 10*normpdf(t,1/10,1);
    x = normpdf(t,1,0.05) + 50*normpdf(t,1/100,1).* t.^0.2 + 500*normpdf(t,365,10);
    x = x ./ sum(x);
%     figure
%     plot(t,x); hold on;
%     set(gca,'XScale','log')
%     title('Frequency spectrum for solar illumination')
%     xlabel('Frequency (day^{-1})')
%     ylabel('Amplitude')
    
    timepoints = 0:1/(60*24):365*2;
    signal = zeros(size(timepoints));
    for i=1:length(t)
        signal = signal + x(i) * sin((2*pi/t(i)).* timepoints);
    end
    timepoints = timepoints(365*24*60:end) - 365;
    signal = signal(365*24*60:end);
    figure
    plot(timepoints,signal); hold on;
    title('Solar illumination collected once each minute for one year')
    xlabel('Time (days)')
    ylabel('Amplitude')
    
%     Fs = 24;
%     T = 1/Fs;
%     L = length(timepoints) / 24;
%     NFFT = 2^nextpow2(L); % Next power of 2 from length of y
%     Y = fft(signal,NFFT)/L;
%     f = Fs/2*linspace(0,1,NFFT/2+1);
% 
%     % Plot single-sided amplitude spectrum.
%     figure
%     plot(f,2*abs(Y(1:NFFT/2+1))) 
%     title('Single-Sided Amplitude Spectrum of y(t)')
%     xlabel('Frequency (Hz)')
%     ylabel('|Y(f)|')
    
    
    


end
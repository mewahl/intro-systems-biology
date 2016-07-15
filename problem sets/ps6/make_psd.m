function [] = make_psd()
    % Load the data in from the file
    a = tdfread('illumination.tsv');
    t = a.x0';
    x = a.x70x2E58942367627401';

    % Plot the timecourse
    Fs = 24; % Sampling rate (units of time are days)
    figure
    plot(t,x);
    title('Timecourse of relative illumination')
    axis([0 900 -20 20])
    xlabel('Time(days)')
    ylabel('Relative illumination')
    set(gca,'FontSize',16)

    % Plot the PSD
    nfft = 2^nextpow2(length(x));
    Pxx = abs(fft(x,nfft)).^2/length(x)/Fs;
    Hpsd = dspdata.psd(Pxx(1:length(Pxx)/2),'Fs',Fs);  
    figure
    plot(Hpsd)
    axis([1E-3 10 -50 50])
    set(gca,'XScale','log','FontSize',16)
    xlabel('\omega (days^{-1})')
    title('Power spectral density for relative illumination')
    % Note y-axis units of db/Hz are incorrect because the unit of time is not
    % seconds, but days. Has units of "dB-days"
end
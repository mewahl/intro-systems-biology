function [] = compare_nyquist_and_zeros()
    k = 1;
    G = tf([1 0],[1 6 18]);
    figure
    subplot(1, 2, 1); 
    pzmap(G)
    axis([-4 1 -4 4])
    title('Poles (x) and roots (o) of G(s)')
    subplot(1, 2, 2);
    pzmap(G - 1)
    axis([-4 1 -4 4])
    title('Poles (x) and roots (o) of 1 + kG(s)')

    figure
    subplot(1, 2, 1); 
    nyquist(G); hold on;
    axis([-1.3 1.3 -1.3 1.3])
    title('Nyquist diagram for G(s)')
    subplot(1, 2, 2);
    nyquist(-0.05 + G); hold on;
    axis([-1.3 1.3 -1.3 1.3])
    title('Nyquist diagram for 1 + kG(s)')
end
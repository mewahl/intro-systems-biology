function [] = bode2()
    % P: G = tf([3],[1]);
    % I: G = tf([3],[1 0]);
    % D: G = tf([3 0],[1]);
    % P-D: G = tf([3, 2],[1]);
    % P-I: G = tf([3, 2],[1, 0]);
    % PID: G = tf([1, 1, 1],[1, 0]);
    G = tf([3],[1 0]);
    bode(G,{1E-2,1E2})
    hold on;
end

function [] = volterra_trial()
    global b d1 d2 p1 p2
    pop = 3200;
    b = 0.1/pop; d1 = 0.03; d2 = 0.0; p1 = 2*0.25/pop; p2 = 2*0.05/pop;    
    dt = 0.1;
    n= 10000;
    saved = zeros(2,n); saved(:,1) = [800; 800];
    for i=2:n
        saved(:,i) = determine_changes(saved(:,i-1),dt) + saved(:,i-1);
    end
    plot([1:n] * dt,saved(1,:),'-r'); hold on;
    plot([1:n] * dt,saved(2,:),'-b');
    
end

function changes = determine_changes(current,dt)
    global b d1 d2 p1 p2
    x = current(1); y = current(2);
    mu = [p1*x*y - d1*x; (b-d2)*y - (p1+p2)*x*y] .* dt;
    variance = [d1*x+p1*x*y, -p1*x*y; -p1*x*y, (b+d2)*y + (p1+p2)*x*y];
    sigma = sqrtm(variance);
    random_values = normrnd(0,1,2,1) * (dt^0.5);
    changes = mu + sigma*random_values;

end


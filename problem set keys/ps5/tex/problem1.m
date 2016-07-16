function [] = problem1(a)
    % Get all unique protein ids and count the number of interactions for
    % each, avoiding double-counting self-interactions along the way. (Do
    % keep track of the number of self interactions, though, for later.)
    protein_ids = unique(a);
    interaction_counts = zeros(size(protein_ids));
    self_interactions = 0;
    
    for i=1:length(a(:,1))
        j = find(protein_ids == a(i,1));
        k = find(protein_ids == a(i,2));
        interaction_counts(j) = interaction_counts(j) + 1;
        if j == k
            self_interactions = self_interactions + 1;
        else
            interaction_counts(k) = interaction_counts(k) + 1;
        end
    end
    
    mu = mean(interaction_counts);
    disp(sprintf('mu=%0.4f',mu));
    disp(sprintf('Number of proteins:%d', length(protein_ids)));
    
    % Now we tally the number of proteins with each number of interactions,
    % again being careful about the position of the last histogram bin.
    maximum_number_of_counts = max(interaction_counts);
    x = 1:maximum_number_of_counts+1;
    y = histcounts(interaction_counts, x) ./ (length(protein_ids));
    x = x(1:length(x)-1);
    
    % Plot the distribution of edge counts for the real data.
    plot(x,y,'-k'); hold on;
    
    % Plot the fitted Poisson distribution (note that we could have
    % used poissfit() to get a slightly better estimate of the parameter
    % mu, but the results would not be qualitatively different).
    plot(x,poisspdf(x,mu),'-r');
    
    % Plot the fitted power law
    power_law_fit = fit(x',y','power1');
    plot(power_law_fit,'-b');
    
    axis([1 300 1e-6 1])
    legend('Data', 'Poisson', 'Power law','Location','NorthEast')
    set(gca,'XScale','log','YScale','log','FontSize',16)
    xlabel('Number of interactions')
    ylabel('Frequency')
    
    % Calculate the expected and observed number of self-interactions
    
    disp(sprintf('Detected %d self-interactions; expected %0.2f', ...
        self_interactions, length(a(:,1))/length(protein_ids)));
    
end
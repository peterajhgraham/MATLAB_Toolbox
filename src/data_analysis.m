function [cleanedData, stats, pcaResult] = data_analysis(data, normalize)
    % Clean data, compute statistics, and perform PCA
    
    % Remove NaN values
    cleanedData = data(~any(isnan(data), 2), :);
    
    % Compute statistics
    stats.mean = mean(cleanedData);
    stats.median = median(cleanedData);
    stats.std = std(cleanedData);
    stats.corrMatrix = corrcoef(cleanedData);
    
    % Normalize data if specified
    if normalize
        cleanedData = (cleanedData - stats.mean) ./ stats.std;
    end
    
    % Perform Principal Component Analysis (PCA)
    [coeff, score, latent] = pca(cleanedData);
    pcaResult.coeff = coeff;
    pcaResult.score = score;
    pcaResult.latent = latent;
    
    % Visualization
    figure;
    subplot(2, 2, 1);
    histogram(cleanedData(:, 1));
    title('Histogram of First Variable');
    
    subplot(2, 2, 2);
    plot(cleanedData(:, 1), cleanedData(:, 2), 'o');
    title('Scatter Plot of First Two Variables');
    
    subplot(2, 2, 3);
    plot(1:length(latent), cumsum(latent) / sum(latent), '-o');
    title('Cumulative Variance Explained by PCA');
    
    subplot(2, 2, 4);
    biplot(coeff(:, 1:2), 'Scores', score(:, 1:2), 'VarLabels', arrayfun(@(x) sprintf('Var%d', x), 1:size(cleanedData, 2), 'UniformOutput', false));
    title('PCA Biplot');
end

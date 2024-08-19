function model = algorithm_development(X, y, method)
    % Develop a predictive model using various algorithms
    
    switch lower(method)
        case 'linear'
            model = fitlm(X, y);
        case 'lasso'
            [B, FitInfo] = lasso(X, y, 'CV', 10);
            idxLambda1SE = FitInfo.Index1SE;
            model.B = B(:, idxLambda1SE);
            model.Intercept = FitInfo.Intercept(idxLambda1SE);
        case 'svm'
            model = fitrsvm(X, y, 'KernelFunction', 'gaussian', 'Standardize', true);
        case 'neural_net'
            hiddenLayerSize = 10;
            net = fitnet(hiddenLayerSize);
            net = train(net, X', y');
            model = net;
        otherwise
            error('Unknown method specified.');
    end
end

function [t, y, eigenvalues] = modeling(A, B, C, D, u, y0, tSpan)
    % Simulate a state-space model and compute system eigenvalues
    
    % State-space simulation
    sys = ss(A, B, C, D);
    [y, t] = lsim(sys, u, tSpan, y0);
    
    % Visualization
    figure;
    plot(t, y);
    title('State-Space Model Output');
    xlabel('Time');
    ylabel('Output');
end

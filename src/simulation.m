function [signal, noise, snr] = simulation(freq, t, noiseAmplitude)
    % Generate a noisy sine wave signal and compute SNR
    
    % Sine wave signal
    signal = sin(2*pi*freq*t);
    
    % Add Gaussian noise
    noise = noiseAmplitude * randn(size(t));
    noisySignal = signal + noise;
    
    % Compute Signal-to-Noise Ratio (SNR)
    snr = 20 * log10(norm(signal) / norm(noise));
    
    % Visualization
    figure;
    subplot(2, 1, 1);
    plot(t, noisySignal);
    title('Noisy Signal');
    xlabel('Time');
    ylabel('Amplitude');
    
    subplot(2, 1, 2);
    plot(t, signal);
    title('Original Signal');
    xlabel('Time');
    ylabel('Amplitude');
end

% Define two signals
signal1 = [1, 2, 3, 4, 5];
signal2 = [5, 4, 3, 2, 1];

% Compute the cross-correlation
cross_corr = xcorr(signal1, signal2);

% Compute the cross-spectral density
N = length(signal1);
cross_spectral_density = fft(cross_corr) / N;

% Define the frequency axis
sampling_frequency = 1; % Assuming unit sampling frequency for simplicity
frequencies = (0:N-1) * (sampling_frequency / N); % Frequency axis

% Plot the spectrogram
figure;
plot(frequencies(1:N), abs(cross_spectral_density));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Cross-spectral density (Spectrogram) of two signals');

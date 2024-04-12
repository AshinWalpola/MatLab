% Define the duration of the recording in seconds
recording_duration = 35;

% Create an audio recorder object
recorder = audiorecorder;

% Record audio from the microphone for the specified duration
disp('Recording...');
recordblocking(recorder, recording_duration);
disp('Recording stopped.');

% Get the recorded audio data
y = getaudiodata(recorder);

% Get the sample rate
Fs = recorder.SampleRate;

% Calculate the duration of the recorded audio
duration = length(y) / Fs;

% Perform FFT
N = length(y);  % Number of samples
Y = fft(y);
f = Fs*(0:(N/2))/N; % Frequency vector

% Plot the frequency spectrum
plot(f, abs(Y(1:N/2+1)));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum');

% Play the recorded audio
disp('Playing recorded audio...');
sound(y, Fs);

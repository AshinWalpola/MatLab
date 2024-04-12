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

% Plot the spectrogram
figure;
spectrogram(y, hamming(512), 256, 512, Fs, 'yaxis');
title('Spectrogram of Recorded Audio');
xlabel('Time (s)');
ylabel('Frequency (Hz)');

% Play the recorded audio
disp('Playing recorded audio...');
sound(y, Fs);

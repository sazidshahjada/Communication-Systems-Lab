% Clear The Workspace

clc;
clearvars;


% Load Signal Package For Octave (Not Neccessary For MATLAB)

pkg load signal;


% Define Time Vector

time = 0:0.00001:1;
time = time(1:end - 1); % Resizing For Avoiding Index Error


% Generating Message Signal

message_amplitude = 3;
message_frequency = 5;

message_signal = message_amplitude .* cos(2 * pi * message_frequency * time);


% Generating Carrier Pulse Signal

pulse_frequency = 50;
pulse_angle = 2 * pi * pulse_frequency * time;
duty_cycle = 50;

carrier_signal = square(pulse_angle, duty_cycle); % Generating Square Wave As Carrier
carrier_signal = (carrier_signal + 1) / 2; % For Making The Square Wave Unipolar


% Generating Pulse Amplitude Modulated Signal(Natural)

pam_signal_natural = carrier_signal .* message_signal;



% Generating Pulse Amplitude Modulated Signal(Flat-Top)

sample_period = length(time) / pulse_frequency;
num_sample_period = ceil(sample_period * duty_cycle / 100);

index = 1:sample_period:length(time);

pam_signal_flat = zeros(1, length(time));

for i = 1:length(index)
  pam_signal_flat(index(i):index(i) + num_sample_period) = message_signal(index(i));
end


% Plot All Signal

subplot(4, 1, 1);
plot(time, message_signal, 'b');
title('Message Signal');
xlabel('Time');
ylabel('Amplitude');
xlim([0, 1]);
grid on;

subplot(4, 1, 2);
plot(time, carrier_signal, 'g');
title('Carrier Pulse Signal');
xlabel('Time');
ylabel('Amplitude');
xlim([0, 1]);
grid on;

subplot(4, 1, 3);
plot(time, pam_signal_natural, 'r');
title('Pulse Amplitude Modulated Signal(Natural)');
xlabel('Time');
ylabel('Amplitude');
xlim([0, 1]);
grid on;

subplot(4, 1, 4);
plot(time, pam_signal_flat, 'r');
title('Pulse Amplitude Modulated Signal(Flat-Top)');
xlabel('Time');
ylabel('Amplitude');
xlim([0, 1]);
grid on;





% Clear the workspace
clc;
clearvars;


% Define Time Vector

time = 0:0.001:1;


% Genrrating Message Signal

message_amplitude = 2;
message_frequency = 3;

message_signal = message_amplitude .* cos(2 * pi * message_frequency * time);


% Generating Carrier Signal

carrier_amplitude = 1;
carrier_frequency = 50;

carrier_signal = carrier_amplitude .* cos(2 * pi * carrier_frequency * time);


% Generating Phase Modulated Signal

modulation_index = 10;

modulated_signal = carrier_amplitude .* cos(2 * pi * carrier_frequency * time + modulation_index .* cos(2 * pi * message_frequency * time))


% Plot All Signal

subplot(3, 1, 1);
plot(time, message_signal, 'b');
title('Message Signal');
xlabel('Time');
ylabel('Amplitude');
xlim([0, 1]);
grid on;

subplot(3, 1, 2);
plot(time, carrier_signal, 'g');
title('Carrier Signal');
xlabel('Time');
ylabel('Amplitude');
xlim([0, 1]);
grid on;

subplot(3, 1, 3);
plot(time, modulated_signal, 'r');
title('Phase Modulated Signal');
xlabel('Time');
ylabel('Amplitude');
xlim([0, 1]);
grid on;

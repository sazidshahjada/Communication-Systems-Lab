% Clear The Workspace

clc;
clearvars;


% Load Signal Package For Octave (Not Neccessary For MATLAB)

pkg load signal;


% Define Time Vector

time = 0:0.0001:1;



% Generating Message Signal

message_frequency = 5;

message_signal = square(2 * pi * message_frequency * time);
message_signal = (message_signal + 1) / 2; % For Avoiding Negative Values


% Generating Carrier Signal

carrier_amplitude = 2;
carrier_frequency = 50;

carrier_signal = carrier_amplitude .* sin(2 * pi * carrier_frequency * time);


% Generating Amplitude Shift Key Signal

ask_signal = message_signal .* carrier_signal;


% Ploting Signals

subplot(3, 1, 1);
plot(time, message_signal, 'b');
title('Message Signal');
xlabel('Time');
ylabel('Amplitude');
xlim([0, 1]);
ylim([-0.3, 1.3]);
grid on;

subplot(3, 1, 2);
plot(time, carrier_signal, 'g');
title('Carrier Pulse Signal');
xlabel('Time');
ylabel('Amplitude');
xlim([0, 1]);
grid on;

subplot(3, 1, 3);
plot(time, ask_signal, 'r');
title('Pulse Position Modulated Signal');
xlabel('Time');
ylabel('Amplitude');
xlim([0, 1]);
grid on;





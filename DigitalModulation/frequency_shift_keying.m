% Clear The Workspace

clc;
clearvars;


% Load Signal Package For Octave (Not Neccessary For MATLAB)

pkg load signal;


% Define Time Vector

time = 0:0.0001:1;



% Generating Message Signal

message_frequency = 10;

message_signal = square(2 * pi * message_frequency * time);
message_signal = (message_signal + 1) / 2; % For Avoiding Negative Values


% Generating Carrier Signal

carrier_amplitude = 2;
carrier_frequency = 50;

carrier_signal = carrier_amplitude .* sin(2 * pi * carrier_frequency * time);


% Generating Frequency Shift Key Signal

frequency_deviation = 20;

fsk_signal = zeros(1, length(time));

for i = 1:length(time)
  if message_signal(i) == 1
    fsk_signal(i) = carrier_amplitude .* sin(2 * pi * (carrier_frequency + frequency_deviation) * time(i));
  else
    fsk_signal(i) = carrier_amplitude .* sin(2 * pi * (carrier_frequency - frequency_deviation) * time(i));
    
  endif
endfor


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
plot(time, fsk_signal, 'r');
title('Frequency Shift Key Modulated Signal');
xlabel('Time');
ylabel('Amplitude');
xlim([0, 1]);
grid on;





% Clear The Workspace

clc;
clearvars;


% Load Signal Package For Octave (Not Neccessary For MATLAB)

pkg load signal;


% Define Time Vector

time = 0:0.00001:1; % Resizing For Avoiding Index Error


% Generating Message Signal

message_amplitude = 1;
message_frequency = 5;

message_signal = message_amplitude .* cos(2 * pi * message_frequency * time);


% Generating Carrier Sawtooth Signal

pulse_frequency = 25;
pulse_angle = 2 * pi * pulse_frequency * time;

carrier_signal = square(pulse_angle) % Generating Square Wave As Carrier


% Generating Pulse Width Modulation Signal

s_tooth = 1.01 * message_amplitude .* sawtooth(pulse_angle);

pwm_signal = zeros(1, length(time));

for i = 1:length(time)
  if (message_signal(i) >= s_tooth(i))
    pwm_signal(i) = 1;
  else
    pwm_signal(i) = 0;
  end
  
end

% Generating Pulse Width Modulation Signal

ppm_signal = zeros(1, length(time));

for i = 1:(length(s_tooth) - 1)
  if (pwm_signal(i) == 1 && pwm_signal(i + 1) == 0)
    ppm_signal(i) = 1;
  else
    ppm_signal(i) = 0;
  end
  
 end


% Ploting Signals

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
plot(time, pwm_signal, 'r');
title('Pulse Width Modulated Signal');
xlabel('Time');
ylabel('Amplitude');
axis([0 1 0 1.1]);
grid on;

subplot(4, 1, 4);
plot(time, ppm_signal, 'r');
title('Pulse Position Modulated Signal');
xlabel('Time');
ylabel('Amplitude');
axis([0 1 0 1.1]);
grid on;


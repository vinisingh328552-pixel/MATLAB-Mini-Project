[audio, Fs] = audioread('vinita_audio.wav(1).mp4');
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Recorded Audio Signal');
grid on;
t = (0:length(audio)-1)/Fs;

plot(t, audio);% Part A - 1: Separate signals T1 and T2
T1 = (t >= 1.2 & t <= 2.1);
T2 = (t >= 3.6 & t <= 4.4);
figure;

subplot(2,1,1);
plot(t(T1), audio(T1));
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Signal T1');
grid on;

subplot(2,1,2);
plot(t(T2), audio(T2));
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Signal T2');
grid on;
sound(audio, Fs);
% Part A - 2: Advance operation y(t) = x(t + 0.5)
shift = round(0.5 * Fs);
y_advance = [audio(shift+1:end,:); zeros(shift,size(audio,2))];
t_advance = (0:length(y_advance)-1)/Fs;
figure;
plot(t_advance, y_advance);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Advanced Signal y(t) = x(t + 0.5)');
grid on;

sound(y_advance, Fs);
% Part A - 3: Time scaling y(t) = x(t/10)
t_scaled = t * 10;
figure;
plot(t_scaled, audio);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Time Scaled Signal y(t) = x(t/10)');
grid on;
sound(audio, Fs/10);
% Part A - 4: Flip operation y(t) = x(-t)
y_flip = flipud(audio);
t_flip = -fliplr(t);
figure;
plot(t_flip, y_flip);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Flipped Signal y(t) = x(-t)');
grid on;

sound(y_flip, Fs);

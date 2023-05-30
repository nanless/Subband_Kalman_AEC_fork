clc;clear all;

% dir = './test_audio/AecSamples/real_linear';
% dir = './test_audio/aec_respeaker_6mic//zhoujielun';
% dir = './test_audio/AEC_Challenge/double_real/2';

dir = './test_audio/phone_record/double_talk';
echo_file = [dir, '/1_mic.wav'];
far_file = [dir , '/1_farend.wav'];

[echo, fs1] = audioread(echo_file);
[far, fs2] = audioread(far_file);
echo = double(echo);
far = double(far);
if ~(fs1==fs2)
    error('echo file sample rate must equal far file sample rate');
end

% mode :1->kalman; 2-> sr-kalman�� 3->icf-kalman
% mode = 1;

% % if mode==1
% out_file = [dir, '/kalman.wav'];
% frame_size = 128;
% out = saf_kalman(echo, far, frame_size, 0);
% audiowrite(out_file, out'/32678, fs1);
% out_file = [dir, '/kalman_nlp.wav'];
% frame_size = 128;
% out = saf_kalman(echo, far, frame_size, 1);
% audiowrite(out_file, out'/32678, fs1);
% % elseif mode==2
% out_file = [dir, '/sr-kalman.wav'];
% frame_size = 128;
% out = saf_sr_kalman(echo, far, frame_size, 0);
% audiowrite(out_file, out'/32678, fs1);
% out_file = [dir, '/sr-kalman_nlp.wav'];
% frame_size = 128;
% out = saf_sr_kalman(echo, far, frame_size, 1);
% audiowrite(out_file, out'/32678, fs1);
% % elseif mode==3
% out_file = [dir, '/if-kalman.wav'];
% frame_size = 128;
% out = saf_if(echo, far, frame_size, 0);
% audiowrite(out_file, out'/32678, fs1);
% out_file = [dir, '/if-kalman_nlp.wav'];
% frame_size = 128;
% out = saf_if(echo, far, frame_size, 1);
% audiowrite(out_file, out'/32678, fs1);
% % elseif mode==4
% out_file = [dir, '/sr-if-kalman.wav'];
% frame_size = 128;
% out = saf_sr_if(echo, far, frame_size, 0);
% audiowrite(out_file, out'/32678, fs1);
% out_file = [dir, '/sr-if-kalman_nlp.wav'];
% frame_size = 128;
% out = saf_sr_if(echo, far, frame_size, 1);
% audiowrite(out_file, out'/32678, fs1);
% end
out_file = [dir, '/kalman_stft.wav'];
frame_size = 256;
out = saf_kalman_stft(echo, far, frame_size, 0);
audiowrite(out_file, out, fs1);
% out_file = [dir, '/kalman_stft_nlp.wav'];
% frame_size = 256;
% out = saf_kalman_stft(echo, far, frame_size, 1);
% audiowrite(out_file, out'/32678, fs1);



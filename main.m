clc;clear all;

% dir = './test_audio/AecSamples/real_linear';
% dir = './test_audio/aec_respeaker_6mic//zhoujielun';
% dir = './test_audio/AEC_Challenge/double_real/2';

dir = './test_audio/phone_record/single_talk';
echo_file = [dir, '/2_mic.wav'];
far_file = [dir , '/2_farend.wav'];

[echo, fs1] = audioread(echo_file,'native');
[far, fs2] = audioread(far_file, 'native');
echo = double(echo);
far = double(far);
if ~(fs1==fs2)
    error('echo file sample rate must equal far file sample rate');
end

% mode :1->kalman; 2-> sr-kalman�� 3->icf-kalman
mode = 1;

if mode==1
    out_file = [dir, '/kalman.wav'];
    frame_size = 128;
    out = saf_kalman(echo, far, frame_size, 0);
    audiowrite(out_file, out'/32678, fs1);
    out_file = [dir, '/kalman_nlp.wav'];
    frame_size = 128;
    out = saf_kalman(echo, far, frame_size, 1);
    audiowrite(out_file, out'/32678, fs1);
elseif mode==2
    out_file = [dir, '/sr-kalman.wav'];
    frame_size = 128;
    out = saf_sr_kalman(echo, far, frame_size, 0);
    audiowrite(out_file, out'/32678, fs1);
    out_file = [dir, '/sr-kalman_nlp.wav'];
    frame_size = 128;
    out = saf_sr_kalman(echo, far, frame_size, 1);
    audiowrite(out_file, out'/32678, fs1);
elseif mode==3
    out_file = [dir, '/if_kalman.wav'];
    frame_size = 128;
    out = saf_if(echo, far, frame_size, 0);
    audiowrite(out_file, out'/32678, fs1);
    out_file = [dir, '/if_kalman_nlp.wav'];
    frame_size = 128;
    out = saf_if(echo, far, frame_size, 1);
    audiowrite(out_file, out'/32678, fs1);
end



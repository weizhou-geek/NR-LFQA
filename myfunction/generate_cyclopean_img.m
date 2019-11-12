function [cyclopean_img] = generate_cyclopean_img(imDL,imDR)

imDL = double(imDL);
imDR = double(imDR);
max_disp = 25;
% tic
[~, dmapD, ~, ~] = mj_stereo_SSIM(imDL,imDR, max_disp);
dmapgra=gradient(dmapD);
dmapgra=abs(dmapgra);
[cyclopean_img, ~] = single_by_Infor3DQA(imDL,imDR,dmapD);
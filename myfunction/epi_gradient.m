function [Gmap,Gdir] = epi_gradient(epimg,opertator_type)
epimg = double(epimg);
[epi_x,epi_y] = imgradientxy(epimg,opertator_type);
Gmap = hypot(epi_x,epi_y);
Gdir = atan2(-epi_y,epi_x)*180/pi;
end


% clear ; clc; close all;
% addpath('./myfunctions');

% opterator_type = 'sobel';
%   sobel operator
% if strcmp(opterator_type,'sobel')
%     dx = [-1 0 1; -2 0 2 ; -1 0 1];
%     dy = [-1 -2 -1; 0 0 0 ; 1 2 1];
% end
% %   prewitt operator
% if strcmp(opterator_type,'prewitt')
%     dx = 1/3*[1 0 -1; 1 0 -1;  1 0  -1];
%     dy = 1/3*[1 1  1; 0 0  0; -1 -1 -1];
% end
%   Lapacian operator
% if strcmp(opterator_type,'lapacian')
%     lo = [1 1 1 ; 1 -8 1 ; 1 1 1];
% end
% %   scharr operator
% if strcmp(opterator_type,'scharr')
%     dx = 1/16*[3 0 -3; 10 0 -10; 3 0 -3];
%     dy = 1/16*[3 10 3; 0 0 0 ; -3 -10 -3];
% end
% %   direction operator
% if strcmp(opterator_type,'direction')
%     v1 = [ 0 0 0 0 0; 1 3 8 3 1; 0 0 0 0 0; -1 -3 -8 -3 -1; 0 0 0 0 0];
%     h1 = [ 0 1 0 -1 0 ; 0 3 0 -3 0 ; 0 8 0 -8 0 ; 0 3 0 -3 0; 0 1 0 -1 0];
%     md1 = [0 0 1 0 0 ; 0 8 3 0 0; 1 3 0 -3 -1; 0 0 -3 -8 0; 0 0 -1 0 0];
%     md2 = [0 0 1 0 0 ; 0 0 3 8 0 ; -1 -3 0 3 1; 0 -8 -3 0 0 ; 0 0 -1 0 0 ];
% end

% ref_epi = rgb2gray(imread('.\EPI\Ref\EPFL\Bikes\Bikes_0_1_0_52_.bmp'));
% epicnn_epi = rgb2gray(imread('.\EPI\Dis\EPFL\EPICNN_Bikes\EPICNN_Bikes_0_1_0_52_.bmp'));
% uscd_epi = rgb2gray(imread('.\EPI\Dis\EPFL\USCD_Bikes\USCD_Bikes_0_1_0_52_.bmp'));
% hevc_epi(1,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\HEVC_Bikes_24\HEVC_Bikes_24_0_1_0_52_.bmp'));
% hevc_epi(2,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\HEVC_Bikes_29\HEVC_Bikes_29_0_1_0_52_.bmp'));
% hevc_epi(3,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\HEVC_Bikes_34\HEVC_Bikes_34_0_1_0_52_.bmp'));
% hevc_epi(4,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\HEVC_Bikes_39\HEVC_Bikes_39_0_1_0_52_.bmp'));
% hevc_epi(5,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\HEVC_Bikes_44\HEVC_Bikes_44_0_1_0_52_.bmp'));
% jp_epi(1,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\JPEG_Bikes_25\JPEG_Bikes_25_0_1_0_52_.bmp'));
% jp_epi(2,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\JPEG_Bikes_50\JPEG_Bikes_50_0_1_0_52_.bmp'));
% jp_epi(3,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\JPEG_Bikes_100\JPEG_Bikes_100_0_1_0_52_.bmp'));
% jp_epi(4,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\JPEG_Bikes_150\JPEG_Bikes_150_0_1_0_52_.bmp'));
% jp_epi(5,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\JPEG_Bikes_200\JPEG_Bikes_200_0_1_0_52_.bmp'));
% ln_epi(1,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\LN_Bikes_10\LN_Bikes_10_0_1_0_52_.bmp'));
% ln_epi(2,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\LN_Bikes_20\LN_Bikes_20_0_1_0_52_.bmp'));
% ln_epi(3,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\LN_Bikes_30\LN_Bikes_30_0_1_0_52_.bmp'));
% ln_epi(4,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\LN_Bikes_40\LN_Bikes_40_0_1_0_52_.bmp'));
% ln_epi(5,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\LN_Bikes_50\LN_Bikes_50_0_1_0_52_.bmp'));
% nn_epi(1,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\NN_Bikes_10\NN_Bikes_10_0_1_0_52_.bmp'));
% nn_epi(2,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\NN_Bikes_20\NN_Bikes_20_0_1_0_52_.bmp'));
% nn_epi(3,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\NN_Bikes_30\NN_Bikes_30_0_1_0_52_.bmp'));
% nn_epi(4,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\NN_Bikes_40\NN_Bikes_40_0_1_0_52_.bmp'));
% nn_epi(5,:,:,:) = rgb2gray(imread('.\EPI\Dis\EPFL\NN_Bikes_50\NN_Bikes_50_0_1_0_52_.bmp'));
% 
% % quality_index = [];
% % c = 6;
% 
% ref_epi = double(ref_epi);
% [ref_x,ref_y] = imgradientxy(ref_epi);
% % ref_gradientMap = hypot(ref_x,ref_y);
% figure;
% subplot(211); hist(ref_x(:),1000);
% subplot(212); hist(ref_y(:),1000);
% % histogram(ref_gradientMap)
% title('ref')
% % 
% epicnn_epi = double(epicnn_epi);
% [epicnn_x,epicnn_y] = imgradientxy(epicnn_epi);
% figure;
% subplot(211); hist(epicnn_x(:),1000);
% subplot(212); hist(epicnn_y(:),1000);
% % epicnn_gradientMap = hypot(epicnn_x,epicnn_y);
% % quality = structure_quality_index(ref_gradientMap,epicnn_gradientMap);
% % quality_index = [quality_index ;quality];
% % % figure;histogram(epicnn_gradientMap)
% title('epicnn')
% % 
% uscd_epi = double(uscd_epi);
% [uscd_x, uscd_y] = imgradientxy(uscd_epi);
% figure;
% subplot(211); hist(uscd_x(:),1000);
% subplot(212); hist(uscd_y(:),1000);
% % uscd_gradientMap = hypot(uscd_x, uscd_y);
% % quality = structure_quality_index(ref_gradientMap,uscd_gradientMap);
% % quality_index = [quality_index ;quality];
% % % figure; histogram(uscd_gradientMap)
% title('uscd')
% 
% hevc_epi = double(hevc_epi);
% for i = 1:size(hevc_epi,1)
%     hevc_tmp_epi = squeeze(hevc_epi(i,:,:,:));
%     [hevc_x, hevc_y] = imgradientxy(hevc_tmp_epi);
%     figure;
%     subplot(211); hist(hevc_x(:),1000);
%     subplot(212); hist(hevc_y(:),1000);
% %     hevc_gradientMap = hypot(hevc_x, hevc_y);
% %     quality = structure_quality_index(ref_gradientMap,hevc_gradientMap);
% %     quality_index = [quality_index ;quality];
% %     figure; histogram(hevc_gradientMap)
%     title_name = ['hevc-' num2str(i)];
%     title(title_name);
% end
% 
% jp_epi = double(jp_epi);
% for i = 1:size(jp_epi,1)
%     jp_tmp_epi = squeeze(jp_epi(i,:,:,:));
%     [jp_x, jp_y] = imgradientxy(jp_tmp_epi);
%     figure;
%     subplot(211); hist(jp_x(:),1000);
%     subplot(212); hist(jp_y(:),1000);
% %     hevc_gradientMap = hypot(hevc_x, hevc_y);
% %     quality = structure_quality_index(ref_gradientMap,hevc_gradientMap);
% %     quality_index = [quality_index ;quality];
% %     figure; histogram(hevc_gradientMap)
%     title_name = ['jp-' num2str(i)];
%     title(title_name);
% end
% 
% ln_epi = double(ln_epi);
% for i = 1:size(ln_epi,1)
%     ln_tmp_epi = squeeze(ln_epi(i,:,:,:));
%     [ln_x, ln_y] = imgradientxy(ln_tmp_epi);
%     figure;
%     subplot(211); hist(ln_x(:),1000);
%     subplot(212); hist(ln_y(:),1000);
% %     hevc_gradientMap = hypot(hevc_x, hevc_y);
% %     quality = structure_quality_index(ref_gradientMap,hevc_gradientMap);
% %     quality_index = [quality_index ;quality];
% %     figure; histogram(hevc_gradientMap)
%     title_name = ['ln-' num2str(i)];
%     title(title_name);
% end
% 
% nn_epi = double(nn_epi);
% for i = 1:size(nn_epi,1)
%     nn_tmp_epi = squeeze(nn_epi(i,:,:,:));
%     [nn_x, nn_y] = imgradientxy(nn_tmp_epi);
%     figure;
%     subplot(211); hist(nn_x(:),1000);
%     subplot(212); hist(nn_y(:),1000);
% %     hevc_gradientMap = hypot(hevc_x, hevc_y);
% %     quality = structure_quality_index(ref_gradientMap,hevc_gradientMap);
% %     quality_index = [quality_index ;quality];
% %     figure; histogram(hevc_gradientMap)
%     title_name = ['nn-' num2str(i)];
%     title(title_name);
% end

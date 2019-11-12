function main()

clear ; clc; close all;

addpath('./myfunction')

%   read lf
dis_img_path = './HEVC_Bikes_44.bmp';
dis_lf = imread(dis_img_path);
dis_lf = permute(reshape(dis_lf,[9, 434, 9, 625, 3]),[1,3,2,4,5]);


%   extract feats
[lcn] = get_lcn(dis_lf);
[gdd,wlbp] = get_gdd_wlbp(dis_lf);

final_feat = cat(2,lcn,gdd,wlbp'); 
%   prediction 
%   load model parameters
load('model.mat')
Pred_quality = libsvmpredict(1.27, final_feat, model)

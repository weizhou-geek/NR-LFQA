function feat = WithoutMSCN_NSS_feature(structdis)

%------------------------------------------
% Normalizing the image after MSCN operation
%------------------------------------------------
% Feature Computation
%-------------------------------------------------
scalenum = 2;
window = fspecial('gaussian',7,7/6);
window = window/sum(sum(window));

feat = [];
%tic
for itr_scale = 1:scalenum
    %   modified by lk in 0726
    [alpha leftstd rightstd] = estimateaggdparam(structdis(:));
    const                    =(sqrt(gamma(1/alpha))/sqrt(gamma(3/alpha)));
    meanparam                =(rightstd-leftstd)*(gamma(2/alpha)/gamma(1/alpha))*const;
    skew          = skewness(structdis(:));
    kur           = kurtosis(structdis(:));
    feat                     =[feat alpha meanparam leftstd^2 rightstd^2 skew kur];
    
    if ismatrix(structdis)
        structdis                   = imresize(structdis,0.5);
    end
    if ndims(structdis) == 3
        for i = 1:size(structdis,1)
            img = squeeze(structdis(i,:,:));
            resize_img(i,:,:) = imresize(img,0.5);
        end
        structdis = resize_img;
        clear resize_img;
    end
end
%toc
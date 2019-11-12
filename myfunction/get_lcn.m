function [lcn] = get_lcn(lf)

window = fspecial('gaussian',7,7/6);
window = window/sum(sum(window));

%   generate cyclopean image array
[Ax,Ay,Sx,Sy,Ch] = size(lf);
structdis   = zeros(Ax,Ay-1,Sx,Sy);
for u = 1:Ax
    for v = 1:Ay-1
        imDL        = double(rgb2gray(squeeze(lf(u,v,:,:,:))));
        imDR        = double(rgb2gray(squeeze(lf(u,v+1,:,:,:))));
        cyclopean   = generate_cyclopean_img(imDL,imDR);
        
        mu      = filter2(window, cyclopean, 'same');
        mu_sq   = mu.*mu;
        sigma   = sqrt(abs(filter2(window, cyclopean.*cyclopean, 'same') - mu_sq));
        
        structdis(u,v,:,:)     = (cyclopean-mu)./(sigma+1);        
    end
end

lcn = WithoutMSCN_NSS_feature(structdis);
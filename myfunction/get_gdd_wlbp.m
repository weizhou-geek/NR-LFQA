function [gdd,wlbp] = get_gdd_wlbp(lf)

[S, T, U, V, Ch] = size(lf);

R_P         = {[1,8],[2,16],[3,24]};
C           = 1e-06;
grad_type   = 'sobel';
Rlbp_feats  = [];    
Clbp_feats  = [];

for s = 1:length(R_P)
    radius      = R_P{s}(1); 
    Neighbors   = R_P{s}(2);
    mapping     = getmapping(Neighbors,'riu2');
    Rdata       = 0;
    
    for row = 1:S
        for width = 1:U
            dis_Slice_epi = rgb2gray(squeeze(lf(row, :, width, :, :)));
            
            if s ==  1
                
                [~,row_Gdir]    = epi_gradient(dis_Slice_epi,grad_type);
                Gdir            = row_Gdir(2:end-1,2:end-1);
                dis             = hist(Gdir(:),-180:179);
                norm_dis        = dis/sum(dis) + C;
                
                row_entropy(row,width)  = sum(-norm_dis.*log(norm_dis));
                row_mean(row,width)     = mean(Gdir(:));
                row_skewness(row,width) = skewness(dis);
                row_kurtosis(row,width) = kurtosis(dis);
            end
            
            [lbp_feat,~,~]      = multi_threshold_lbp(dis_Slice_epi,radius,Neighbors,mapping,'l2',radius/2);
            tmp_data            = lbp_feat + C;
            Rweight(row,width)  = -sum(tmp_data.*log(tmp_data));
            Rdata               = Rdata + Rweight(row,width)*tmp_data;
        end
    end
    Rlbp_feats = [Rlbp_feats; Rdata'/(sum(Rweight(:)))];
    
    Cdata = 0;
    for col = 1:T
        for height = 1:V
            dis_Slice_epi = rgb2gray(squeeze(lf(:, col, :, height, :)));
            
            if s == 1
                [~,col_Gdir]    = epi_gradient(dis_Slice_epi,grad_type);
                Gdir            = col_Gdir(2:end-1,2:end-1);
                dis             = hist(Gdir(:),-180:179);
                norm_dis        = dis/sum(dis) + C;
                
                col_entropy(col,height)     = sum(-norm_dis.*log(norm_dis));
                col_mean(col,height)        = mean(Gdir(:));
                col_skewness(col,height)    = skewness(dis);
                col_kurtosis(col,height)    = kurtosis(dis);
            end
            
            
            [lbp_feat,~,~]      = multi_threshold_lbp(dis_Slice_epi,radius,Neighbors,mapping,'l2',radius/2);
            tmp_data            = lbp_feat + C;
            Cweight(row,width)  = -sum(tmp_data.*log(tmp_data));
            Cdata               = Cdata + Cweight(row,width)*tmp_data;
        end
    end
    Clbp_feats = [Clbp_feats; Cdata'/(sum(Rweight(:)))];

end
wlbp = [Rlbp_feats; Clbp_feats];

gdd(1) = mean(row_entropy(:));
gdd(2) = mean(col_entropy(:));
gdd(3) = mean(row_skewness(:));
gdd(4) = mean(col_skewness(:));
gdd(5) = mean(row_kurtosis(:));
gdd(6) = mean(col_kurtosis(:));
gdd(7) = mean(row_mean(:));
gdd(8) = mean(col_mean(:));

%% Based on the 80% of blast size, removing objects from tiles' masks
% Cleaning masks and 
% save then with the suffix '_mask.tif' in the folder ./Cleaned
masks = dir(['C:/CCIPD_atEmory/AML/AMLcGAN_Output/SwissSamplesTiles_result/masks_alltogether/*.tif']);
for b = 1:length(masks)
    mask = imread([masks(b).folder filesep masks(b).name]);
    BW1 = bwareaopen(mask,3500);% removes all connected components (objects) that have fewer than 1002 pixels from the binary image mask
    BW2 = bwareaopen(mask,50000);% only objects bigger than 3950.4 remains in the binary image mask
    BW=BW1-BW2;
    Name=extractBefore( masks(b).name,".tif");
    imwrite(BW,[Name '_mask.tif']);
    
end


%% second round of cleaning (filling the wholes)
masks = dir(['C:/CCIPD_atEmory/AML/AMLcGAN_Output/SwissSamplesTiles_result/masks_alltogether/Cleaned/*.tif']);
for b = 1:length(masks)
    mask = imread([masks(b).folder filesep masks(b).name]);
    mask = im2bw(mask,0.5);
    BW = imfill(mask,'holes');%Fill holes in the binary image
    Name=extractBefore( masks(b).name,"_mask");
    imwrite(BW,[Name '_mask.tif']);
end


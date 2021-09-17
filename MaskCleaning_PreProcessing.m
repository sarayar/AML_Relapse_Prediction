%% Based on the 80% of blast size, removing objects from tiles' masks
masks = dir(['F:/AML_Data/AML5_outputs_validation/*.png']);
for b = 1:length(masks)
    mask = imread([masks(b).folder filesep masks(b).name]);
    BW1 = bwareaopen(mask,1050);% removes all connected components (objects) that have fewer than 1002 pixels from the binary image mask
    BW2 = bwareaopen(mask,50000);% only objects bigger than 3950.4 remains in the binary image mask
    BW=BW1-BW2;
    Name=extractBefore( masks(b).name,"_class");
    imwrite(BW,[Name '_mask.png']);
    
end

%% Based on the 80% of blast size, removing objects from tiles' masks
masks = dir(['F:/AML_Data/AML5_outputs_training/*.png']);
for b = 1:length(masks)
    mask = imread([masks(b).folder filesep masks(b).name]);
    BW1 = bwareaopen(mask,1050);% removes all connected components (objects) that have fewer than 1002 pixels from the binary image mask
    BW2 = bwareaopen(mask,50000);% only objects bigger than 3950.4 remains in the binary image mask
    BW=BW1-BW2;
    Name=extractBefore( masks(b).name,"_class");
    imwrite(BW,[Name '_mask.png']);
    
end
 

%% second round of cleaning (filling the wholes)
masks = dir(['F:/AML_Data/AML5_outputs_training/Cleaned/*.png']);
for b = 1:length(masks)
    mask = imread([masks(b).folder filesep masks(b).name]);
    mask = im2bw(mask,0.5);
    BW = imfill(mask,'holes');%Fill holes in the binary image
    Name=extractBefore( masks(b).name,"_mask");
    imwrite(BW,[Name '_mask.png']);
end

masks = dir(['F:/AML_Data/AML5_outputs_validation/Cleaned/*.png']);
for b = 1:length(masks)
    mask = imread([masks(b).folder filesep masks(b).name]);
    mask = im2bw(mask,0.5);
    BW = imfill(mask,'holes');%Fill holes in the binary image
    Name=extractBefore( masks(b).name,"_mask");
    imwrite(BW,[Name '_mask.png']);
end
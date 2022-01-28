%% Analyzing tiles- calculating shape and texture features
clc
clear all
clc
masks = dir(['F:/AML_Data/AML5_outputs_training/Cleaned/*.png']);
imgDir = 'F:/AML_Data/AML_training';


filename = 'feat_Sep1_text_training.xlsx';

mask = imread([masks(1).folder filesep masks(1).name]);
img = imread([imgDir filesep masks(1).name(1:end-length('_mask.png')) '.png']);

Num_level=8;

feats= haralick_img_blast_wise(img,mask,Num_level)%13 Texture Features
si=size(feats.img3,1);

s=sum(feats.img3,1);
M=median(feats.img3);
avg=s/si;
ST=std(feats.img3);
SK=skewness(feats.img3);
    
Name=extractBefore( masks(1).name,"_mask");

    x1=M(1,1);
    x2=M(1,2);
    x3=M(1,3);
    x4=M(1,4);
    x5=M(1,5);
    x6=M(1,6);
    x7=M(1,7);
    x8=M(1,8);
    x9=M(1,9);
    x10=M(1,10);
    x11=M(1,11);
    x12=M(1,12);
    x13=M(1,13);
    x14=avg(1,1);
    x15=avg(1,2);
    x16=avg(1,3);
    x17=avg(1,4);
    x18=avg(1,5);
    x19=avg(1,6);
    x20=avg(1,7);
    x21=avg(1,8);
    x22=avg(1,9);
    x23=avg(1,10);
    x24=avg(1,11);
    x25=avg(1,12);
    x26=avg(1,13);
    x27=ST(1,1);
    x28=ST(1,2);
    x29=ST(1,3);
    x30=ST(1,4);
    x31=ST(1,5);
    x32=ST(1,6);
    x33=ST(1,7);
    x34=ST(1,8);
    x35=ST(1,9);
    x36=ST(1,10);
    x37=ST(1,11);
    x38=ST(1,12);
    x39=ST(1,13);
    x40=SK(1,1);
    x41=SK(1,2);
    x42=SK(1,3);
    x43=SK(1,4);
    x44=SK(1,5);
    x45=SK(1,6);
    x46=SK(1,7);
    x47=SK(1,8);
    x48=SK(1,9);
    x49=SK(1,10);
    x50=SK(1,11);
    x51=SK(1,12);
    x52=SK(1,13);
    
    
    
S= struct('patch_name',Name,'x1',x1,'x2',x2,'x3',x3,'x4',x4,'x5',x5,'x6',x6,'x7',x7,'x8',x8,'x9',x9,'x10',x10,...
    'x11',x11,'x12',x12,'x13',x13,'x14',x14,'x15',x15,'x16',x16,'x17',x17,'x18',x18,'x19',x19,'x20',x20,'x21',...
    x21,'x22',x22,'x23',x23,'x24',x24,'x25',x25,'x26',x26,'x27',x27,'x28',x28,'x29',x29,'x30',x30,'x31',x31,...
    'x32',x32,'x33',x33,'x34',x34,'x35',x35,'x36',x36,'x37',x37,'x38',x38,'x39',x39,'x40',x40,'x41',x41,...
    'x42',x42,'x43',x43,'x44',x44,'x45',x45,'x46',x46,'x47',x47,'x48',x48,'x49',x49,'x50',x50,'x51',x51,'x52',x52);

for b = 2:length(masks)
    mask = imread([masks(b).folder filesep masks(b).name]);
    img = imread([imgDir filesep masks(b).name(1:end-length('_mask.png')) '.png']);
    
    numcom=bwconncomp(mask)
    if numcom.NumObjects~=0
        feats= haralick_img_blast_wise(img,mask,Num_level)%13 Texture Features

        Name=extractBefore( masks(b).name,"_mask");

        si=size(feats.img3,1);
        if si==1
                M=feats.img3;
                avg=feats.img3;
                ST=feats.img3;
                SK=feats.img3;
                S(1,b).patch_name=Name;
                S(1,b).x1=M(1,1);
                S(1,b).x2=M(1,2);
                S(1,b).x3=M(1,3);
                S(1,b).x4=M(1,4);
                S(1,b).x5=M(1,5);
                S(1,b).x6=M(1,6);
                S(1,b).x7=M(1,7);
                S(1,b).x8=M(1,8);
                S(1,b).x9=M(1,9);
                S(1,b).x10=M(1,10);
                S(1,b).x11=M(1,11);
                S(1,b).x12=M(1,12);
                S(1,b).x13=M(1,13);
                S(1,b).x14=avg(1,1);
                S(1,b).x15=avg(1,2);
                S(1,b).x16=avg(1,3);
                S(1,b).x17=avg(1,4);
                S(1,b).x18=avg(1,5);
                S(1,b).x19=avg(1,6);
                S(1,b).x20=avg(1,7);
                S(1,b).x21=avg(1,8);
                S(1,b).x22=avg(1,9);
                S(1,b).x23=avg(1,10);
                S(1,b).x24=avg(1,11);
                S(1,b).x25=avg(1,12);
                S(1,b).x26=avg(1,13);
                S(1,b).x27=ST(1,1);
                S(1,b).x28=ST(1,2);
                S(1,b).x29=ST(1,3);
                S(1,b).x30=ST(1,4);
                S(1,b).x31=ST(1,5);
                S(1,b).x32=ST(1,6);
                S(1,b).x33=ST(1,7);
                S(1,b).x34=ST(1,8);
                S(1,b).x35=ST(1,9);
                S(1,b).x36=ST(1,10);
                S(1,b).x37=ST(1,11);
                S(1,b).x38=ST(1,12);
                S(1,b).x39=ST(1,13);
                S(1,b).x40=SK(1,1);
                S(1,b).x41=SK(1,2);
                S(1,b).x42=SK(1,3);
                S(1,b).x43=SK(1,4);
                S(1,b).x44=SK(1,5);
                S(1,b).x45=SK(1,6);
                S(1,b).x46=SK(1,7);
                S(1,b).x47=SK(1,8);
                S(1,b).x48=SK(1,9);
                S(1,b).x49=SK(1,10);
                S(1,b).x50=SK(1,11);
                S(1,b).x51=SK(1,12);
                S(1,b).x52=SK(1,13);
        else
                M=median(feats.img3);
                SK=skewness(feats.img3);

                s=sum(feats.img3,1);
                avg=s/si;
                ST=std(feats.img3);

                S(1,b).patch_name=Name;
                S(1,b).x1=M(1,1);
                S(1,b).x2=M(1,2);
                S(1,b).x3=M(1,3);
                S(1,b).x4=M(1,4);
                S(1,b).x5=M(1,5);
                S(1,b).x6=M(1,6);
                S(1,b).x7=M(1,7);
                S(1,b).x8=M(1,8);
                S(1,b).x9=M(1,9);
                S(1,b).x10=M(1,10);
                S(1,b).x11=M(1,11);
                S(1,b).x12=M(1,12);
                S(1,b).x13=M(1,13);
                S(1,b).x14=avg(1,1);
                S(1,b).x15=avg(1,2);
                S(1,b).x16=avg(1,3);
                S(1,b).x17=avg(1,4);
                S(1,b).x18=avg(1,5);
                S(1,b).x19=avg(1,6);
                S(1,b).x20=avg(1,7);
                S(1,b).x21=avg(1,8);
                S(1,b).x22=avg(1,9);
                S(1,b).x23=avg(1,10);
                S(1,b).x24=avg(1,11);
                S(1,b).x25=avg(1,12);
                S(1,b).x26=avg(1,13);
                S(1,b).x27=ST(1,1);
                S(1,b).x28=ST(1,2);
                S(1,b).x29=ST(1,3);
                S(1,b).x30=ST(1,4);
                S(1,b).x31=ST(1,5);
                S(1,b).x32=ST(1,6);
                S(1,b).x33=ST(1,7);
                S(1,b).x34=ST(1,8);
                S(1,b).x35=ST(1,9);
                S(1,b).x36=ST(1,10);
                S(1,b).x37=ST(1,11);
                S(1,b).x38=ST(1,12);
                S(1,b).x39=ST(1,13);
                S(1,b).x40=SK(1,1);
                S(1,b).x41=SK(1,2);
                S(1,b).x42=SK(1,3);
                S(1,b).x43=SK(1,4);
                S(1,b).x44=SK(1,5);
                S(1,b).x45=SK(1,6);
                S(1,b).x46=SK(1,7);
                S(1,b).x47=SK(1,8);
                S(1,b).x48=SK(1,9);
                S(1,b).x49=SK(1,10);
                S(1,b).x50=SK(1,11);
                S(1,b).x51=SK(1,12);
                S(1,b).x52=SK(1,13);
        end
    end
 
end
T = struct2table(S);
writetable(T,filename);




%% Analyzing tiles- Calculating and saving no.blasts and area ratio in each patch


masks = dir(['F:/AML_Data/AML5_outputs_validation/Cleaned/*.png']);
images=dir(['F:/AML_Data/AML_Validation_Tiles/*.png']);
filename = 'validation_blast_stat.xlsx';
mask = imread([masks(1).folder filesep masks(1).name]);
img = imread([images(1).folder filesep images(1).name]);

bw = bwconncomp(mask);
blast_count=bw.NumObjects;

Name=extractBefore( masks(1).name,"_mask");

threshold_mask=im2uint8(rgb2gray(img)<195);%originally 200
total_area=bwarea(threshold_mask);
blast_area=bwarea(mask);
ratio=blast_area/total_area;

S= struct('patch_name',Name,'blast_count',blast_count,'blast_area_ratio',ratio);
    
for b =2:length(masks)
    mask = imread([masks(b).folder filesep masks(b).name]);
    img = imread([images(b).folder filesep images(b).name]);
    
    bw = bwconncomp(mask);
    blast_count=bw.NumObjects;
    
    Name=extractBefore( masks(b).name,"_mask");
    
    threshold_mask=im2uint8(rgb2gray(img)<195);
    total_area=bwarea(threshold_mask);
    blast_area=bwarea(mask);
    ratio=blast_area/total_area;
    
    S(1,b).patch_name=Name;
    S(1,b).blast_count=blast_count;
    S(1,b).blast_area_ratio=ratio;
    
end

T = struct2table(S);
writetable(T,filename);

%% Extracting Shape features including fractal


masks = dir(['F:/AML_Data/AML5_outputs_validation/Cleaned/*.png']);
imgDir = 'F:/AML_Data/AML_Validation_Tiles';

mask = imread([masks(1).folder filesep masks(1).name]);
img = imread([imgDir filesep masks(1).name(1:end-length('_mask.png')) '.png']);

r=rand(1);
alpha=0.4;

filename = 'feat_Sep2_morph_validation.xlsx';

[feats,description] = extract_all_features_V2(mask,img,alpha,r,2); %shape features =2 calling "extract_morph_feats"

Name=extractBefore( masks(1).name,"_mask");

    x1=feats{1,2}(1,1);
    x2=feats{1,2}(1,2);
    x3=feats{1,2}(1,3);
    x4=feats{1,2}(1,4);
    x5=feats{1,2}(1,5);
    x6=feats{1,2}(1,6);
    x7=feats{1,2}(1,7);
    x8=feats{1,2}(1,8);
    x9=feats{1,2}(1,9);
    x10=feats{1,2}(1,10);
    x11=feats{1,2}(1,11);
    x12=feats{1,2}(1,12);
    x13=feats{1,2}(1,13);
    x14=feats{1,2}(1,14);
    x15=feats{1,2}(1,15);
    x16=feats{1,2}(1,16);
    x17=feats{1,2}(1,17);
    x18=feats{1,2}(1,18);
    x19=feats{1,2}(1,19);
    x20=feats{1,2}(1,20);
    x21=feats{1,2}(1,21);
    x22=feats{1,2}(1,22);
    x23=feats{1,2}(1,23);
    x24=feats{1,2}(1,24);
    x25=feats{1,2}(1,25);
    x26=feats{1,2}(1,26);
    x27=feats{1,2}(1,27);
    x28=feats{1,2}(1,28);
    x29=feats{1,2}(1,29);
    x30=feats{1,2}(1,30);
    x31=feats{1,2}(1,31);
    x32=feats{1,2}(1,32);
    x33=feats{1,2}(1,33);
    x34=feats{1,2}(1,34);
    x35=feats{1,2}(1,35);
    x36=feats{1,2}(1,36);
    x37=feats{1,2}(1,37);
    x38=feats{1,2}(1,38);
    x39=feats{1,2}(1,39);
    x40=feats{1,2}(1,40);
    x41=feats{1,2}(1,41);
    x42=feats{1,2}(1,42);
    x43=feats{1,2}(1,43);
    x44=feats{1,2}(1,44);
    x45=feats{1,2}(1,45);
    x46=feats{1,2}(1,46);
    x47=feats{1,2}(1,47);
    x48=feats{1,2}(1,48);
    x49=feats{1,2}(1,49);
    x50=feats{1,2}(1,50);
    x51=feats{1,2}(1,51);
    x52=feats{1,2}(1,52);
    x53=feats{1,2}(1,53);
    x54=feats{1,2}(1,54);
    x55=feats{1,2}(1,55);
    x56=feats{1,2}(1,56);
    x57=feats{1,2}(1,57);
    x58=feats{1,2}(1,58);
    x59=feats{1,2}(1,59);
    x60=feats{1,2}(1,60);
    x61=feats{1,2}(1,61);
    x62=feats{1,2}(1,62);
    x63=feats{1,2}(1,63);
    x64=feats{1,2}(1,64);
    x65=feats{1,2}(1,65);
    x66=feats{1,2}(1,66);
    x67=feats{1,2}(1,67);
    x68=feats{1,2}(1,68);
    x69=feats{1,2}(1,69);
    x70=feats{1,2}(1,70);
    x71=feats{1,2}(1,71);
    x72=feats{1,2}(1,72);
    x73=feats{1,2}(1,73);
    x74=feats{1,2}(1,74);
    x75=feats{1,2}(1,75);
    x76=feats{1,2}(1,76);
    x77=feats{1,2}(1,77);
    x78=feats{1,2}(1,78);
    x79=feats{1,2}(1,79);
    x80=feats{1,2}(1,80);
    x81=feats{1,2}(1,81);
    x82=feats{1,2}(1,82);
    x83=feats{1,2}(1,83);
    x84=feats{1,2}(1,84);
    x85=feats{1,2}(1,85);
    x86=feats{1,2}(1,86);
    x87=feats{1,2}(1,37);
    x88=feats{1,2}(1,88);
    x89=feats{1,2}(1,89);
    x90=feats{1,2}(1,90);
    x91=feats{1,2}(1,91);
    x92=feats{1,2}(1,92);
    x93=feats{1,2}(1,93);
    x94=feats{1,2}(1,94);
    x95=feats{1,2}(1,95);
    x96=feats{1,2}(1,96);
    x97=feats{1,2}(1,97);
    x98=feats{1,2}(1,98);
    x99=feats{1,2}(1,99);
    x100=feats{1,2}(1,100);
    
    
S= struct('patch_name',Name,'x1',x1,'x2',x2,'x3',x3,'x4',x4,'x5',x5,'x6',x6,'x7',x7,'x8',x8,'x9',x9,'x10',x10,...
    'x11',x11,'x12',x12,'x13',x13,'x14',x14,'x15',x15,'x16',x16,'x17',x17,'x18',x18,'x19',x19,'x20',x20,'x21',...
    x21,'x22',x22,'x23',x23,'x24',x24,'x25',x25,'x26',x26,'x27',x27,'x28',x28,'x29',x29,'x30',x30,'x31',x31,...
    'x32',x32,'x33',x33,'x34',x34,'x35',x35,'x36',x36,'x37',x37,'x38',x38,'x39',x39,'x40',x40,'x41',x41,...
    'x42',x42,'x43',x43,'x44',x44,'x45',x45,'x46',x46,'x47',x47,'x48',x48,'x49',x49,'x50',x50,'x51',x51,'x52',x52,...
    'x53',x53,'x54',x54,'x55',x55,'x56',x56,'x57',x57,'x58',x58,'x59',x59,'x60',x60,...
    'x61',x61,'x62',x62,'x63',x63,'x64',x64,'x65',x65,'x66',x66,'x67',x67,'x68',x68,'x69',x69,'x70',x70,'x71',x71,...
    'x72',x72,'x73',x73,'x74',x74,'x75',x75,'x76',x76,'x77',x77,'x78',x78,'x79',x79,'x80',x80,'x81',x81,...
    'x82',x82,'x83',x83,'x84',x84,'x85',x85,'x86',x86,'x87',x87,'x88',x88,'x89',x89,'x90',x90,'x91',x91,...
    'x92',x92,'x93',x93,'x94',x94,'x95',x95,'x96',x96,'x97',x97,'x98',x98,'x99',x99,'x100',x100);

for b = 2:length(masks)
    mask = imread([masks(b).folder filesep masks(b).name]);
    img = imread([imgDir filesep masks(b).name(1:end-length('_mask.png')) '.png']);
    
    numcom=bwconncomp(mask)
    if numcom.NumObjects~=0
        [feats,description] = extract_all_features_V2(mask,img,alpha,r,2); %shape features =2 calling "extract_morph_feats"
        Name=extractBefore( masks(b).name,"_mask");

        S(1,b).patch_name=Name;
        S(1,b).x1=feats{1,2}(1,1);
        S(1,b).x2=feats{1,2}(1,2);
        S(1,b).x3=feats{1,2}(1,3);
        S(1,b).x4=feats{1,2}(1,4);
        S(1,b).x5=feats{1,2}(1,5);
        S(1,b).x6=feats{1,2}(1,6);
        S(1,b).x7=feats{1,2}(1,7);
        S(1,b).x8=feats{1,2}(1,8);
        S(1,b).x9=feats{1,2}(1,9);
        S(1,b).x10=feats{1,2}(1,10);
        S(1,b).x11=feats{1,2}(1,11);
        S(1,b).x12=feats{1,2}(1,12);
        S(1,b).x13=feats{1,2}(1,13);
        S(1,b).x14=feats{1,2}(1,14);
        S(1,b).x15=feats{1,2}(1,15);
        S(1,b).x16=feats{1,2}(1,16);
        S(1,b).x17=feats{1,2}(1,17);
        S(1,b).x18=feats{1,2}(1,18);
        S(1,b).x19=feats{1,2}(1,19);
        S(1,b).x20=feats{1,2}(1,20);
        S(1,b).x21=feats{1,2}(1,21);
        S(1,b).x22=feats{1,2}(1,22);
        S(1,b).x23=feats{1,2}(1,23);
        S(1,b).x24=feats{1,2}(1,24);
        S(1,b).x25=feats{1,2}(1,25);
        S(1,b).x26=feats{1,2}(1,26);
        S(1,b).x27=feats{1,2}(1,27);
        S(1,b).x28=feats{1,2}(1,28);
        S(1,b).x29=feats{1,2}(1,29);
        S(1,b).x30=feats{1,2}(1,30);
        S(1,b).x31=feats{1,2}(1,31);
        S(1,b).x32=feats{1,2}(1,32);
        S(1,b).x33=feats{1,2}(1,33);
        S(1,b).x34=feats{1,2}(1,34);
        S(1,b).x35=feats{1,2}(1,35);
        S(1,b).x36=feats{1,2}(1,36);
        S(1,b).x37=feats{1,2}(1,37);
        S(1,b).x38=feats{1,2}(1,38);
        S(1,b).x39=feats{1,2}(1,39);
        S(1,b).x40=feats{1,2}(1,40);
        S(1,b).x41=feats{1,2}(1,41);
        S(1,b).x42=feats{1,2}(1,42);
        S(1,b).x43=feats{1,2}(1,43);
        S(1,b).x44=feats{1,2}(1,44);
        S(1,b).x45=feats{1,2}(1,45);
        S(1,b).x46=feats{1,2}(1,46);
        S(1,b).x47=feats{1,2}(1,47);
        S(1,b).x48=feats{1,2}(1,48);
        S(1,b).x49=feats{1,2}(1,49);
        S(1,b).x50=feats{1,2}(1,50);
        S(1,b).x51=feats{1,2}(1,51);
        S(1,b).x52=feats{1,2}(1,52);
        S(1,b).x53=feats{1,2}(1,53);
        S(1,b).x54=feats{1,2}(1,54);
        S(1,b).x55=feats{1,2}(1,55);
        S(1,b).x56=feats{1,2}(1,56);
        S(1,b).x57=feats{1,2}(1,57);
        S(1,b).x58=feats{1,2}(1,58);
        S(1,b).x59=feats{1,2}(1,59);
        S(1,b).x60=feats{1,2}(1,60);
        S(1,b).x61=feats{1,2}(1,61);
        S(1,b).x62=feats{1,2}(1,62);
        S(1,b).x63=feats{1,2}(1,63);
        S(1,b).x64=feats{1,2}(1,64);
        S(1,b).x65=feats{1,2}(1,65);
        S(1,b).x66=feats{1,2}(1,66);
        S(1,b).x67=feats{1,2}(1,67);
        S(1,b).x68=feats{1,2}(1,68);
        S(1,b).x69=feats{1,2}(1,69);
        S(1,b).x70=feats{1,2}(1,70);
        S(1,b).x71=feats{1,2}(1,71);
        S(1,b).x72=feats{1,2}(1,72);
        S(1,b).x73=feats{1,2}(1,73);
        S(1,b).x74=feats{1,2}(1,74);
        S(1,b).x75=feats{1,2}(1,75);
        S(1,b).x76=feats{1,2}(1,76);
        S(1,b).x77=feats{1,2}(1,77);
        S(1,b).x78=feats{1,2}(1,78);
        S(1,b).x79=feats{1,2}(1,79);
        S(1,b).x80=feats{1,2}(1,80);
        S(1,b).x81=feats{1,2}(1,81);
        S(1,b).x82=feats{1,2}(1,82);
        S(1,b).x83=feats{1,2}(1,83);
        S(1,b).x84=feats{1,2}(1,84);
        S(1,b).x85=feats{1,2}(1,85);
        S(1,b).x86=feats{1,2}(1,86);
        S(1,b).x87=feats{1,2}(1,37);
        S(1,b).x88=feats{1,2}(1,88);
        S(1,b).x89=feats{1,2}(1,89);
        S(1,b).x90=feats{1,2}(1,90);
        S(1,b).x91=feats{1,2}(1,91);
        S(1,b).x92=feats{1,2}(1,92);
        S(1,b).x93=feats{1,2}(1,93);
        S(1,b).x94=feats{1,2}(1,94);
        S(1,b).x95=feats{1,2}(1,95);
        S(1,b).x96=feats{1,2}(1,96);
        S(1,b).x97=feats{1,2}(1,97);
        S(1,b).x98=feats{1,2}(1,98);
        S(1,b).x99=feats{1,2}(1,99);
        S(1,b).x100=feats{1,2}(1,100);
    
    end
 
end
T = struct2table(S);
writetable(T,filename);

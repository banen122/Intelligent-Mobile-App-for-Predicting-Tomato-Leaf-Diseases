function  state=getdiagoses(path,filename)
I = imread(path);
imageDim = 128;
I2 = imresize(I,[imageDim,imageDim]);
load('mynet.mat','net1');
YPred = classify(net1,I2);
state= char(YPred(1));

Recomandation=-1;
if isequal ('Tomato__Tomato_YellowLeaf__Curl_Virus',char(YPred(1)))==1
   state=1;
elseif  isequal ('Tomato__Target_Spot',char(YPred(1)))==1
    state=2;

elseif  isequal ('Tomato__Tomato_mosaic_virus',char(YPred(1)))==1
    state=3;

elseif  isequal ('Tomato_Spider_mites_Two_spotted_spider_mite',char(YPred(1)))==1
    Recomandation= 'Tomato_Spider_mites_Two_spotted_spider_mite: There are no chemical controls for viruses. Remove and destroy infected plants promptly , Eliminate weeds in and near the garden , Control insects';    
    state=4;


elseif  isequal ('Tomato_Septoria_leaf_spot',char(YPred(1)))==1
    Recomandation= 'Tomato_Septoria_leaf_spot: Repeated fungicide applications with chlorothalonil(very good)or copper fungicide,or mancozeb(good) will keep the disease in check.';    
    state=5;


elseif  isequal ('Tomato_Bacterial_spot',char(YPred(1)))==1
    Recomandation= 'Tomato_Bacterial_spot: Remove all diseased plant material. Prune plants to promote air circulation. Spraying with a copper fungicide';
    state=6;


    elseif  isequal ('Tomato_Early_blight',char(YPred(1)))==1
    Recomandation= 'Tomato_Early_blight: Use pathogen-free seed , Use crop rotation, eradicate weeds and volunteer tomato plants , don’t wet tomato plants with irrigation water , If disease is severe enough to warrant chemical control use fungicides .';
    state=7;

    
    elseif  isequal ('Tomato_Late_blight',char(YPred(1)))==1
    Recomandation= 'Tomato_Late_blight: Keep foliage dry , Allow extra room between the plants, and avoid overhead watering .';
    state=8;

    
     elseif  isequal ('Tomato_Leaf_Mold',char(YPred(1)))==1
    Recomandation= 'Tomato_Leaf_Mold: Crop residue should be removed from the field. Staking and pruning to increase air circulation helps to control the disease. Avoid wetting leaves when watering , Using a preventative fungicide program';
    state=9;

    
    elseif  isequal ('Tomato_healthy',char(YPred(1)))==1
    Recomandation= 'Tomato_healthy: its healthy there is no disease';
    state=10;

    
end
disp(filename);
fullfilename = [filename];
fid = fopen(fullfilename,'wt');
fprintf(fid,num2str(state));

fclose(fid);
pause(2);

delete(filename);



quit(0,"force");


end

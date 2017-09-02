clear 
clc
pkg load image
dirClassOne = './Saudaveis/' ;
dirClassZero = './fermentados/';

addpath('./libsvm-3.22/matlab');
filesClassOne = dir(strcat([dirClassOne, '*.jpg'])) ;
m1 = size(filesClassOne, 1);

filesClassZero = dir(strcat([dirClassZero, '*.png'])) ;
m0 = size(filesClassZero, 1);
X = zeros(m0+m1, 30000);
for i=1:m1,

        fprintf('%f\n',  100*i/m1);

        filename = char(filesClassOne(i).name);
        
        im = double(imread(strcat([dirClassOne filename])));
        %figure, imshow(im);
        im = im/255;
        %figure, imshow(im);
        im= imresize(im, [100 100]);
        %figure,imshow(im);
        X(i,:) = im(:);
        
end

for i=1:m0,

        fprintf('%f\n',  100*(i/m0));

        filename = char(filesClassZero(i).name);
        im = double(imread(strcat([dirClassZero filename])));
        %figure, imshow(im);
        im = im/255;
        im =  imresize(im, [100 100]);
        %figure, imshow(im);
        X(i+m1,:) = im(:);
        
end

y = zeros(m0+m1, 1);
y(1:m1) = 1;
y(m1+1:m1+m0) = 2;

features_sparse = sparse(X);

libsvmwrite('parkData.txt', y, features_sparse); 
save('parkSlotData1.mat', 'X', 'y');

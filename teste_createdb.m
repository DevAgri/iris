clear 
clc
pkg load image

dirClassOne = './fermentados/' ;

addpath('./libsvm-3.22/matlab');

filesClassOne = dir(strcat([dirClassOne, '*.png'])) ;
m1 = size(filesClassOne, 1);

for i=1:m1,
  filename = char(filesClassOne(i).name);
  im = double(imread(strcat([dirClassOne filename])));
  im = im/255; 
  %im= imresize(im, [1200 2200]);
  imshow(im)
end
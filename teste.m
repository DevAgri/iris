clc;
clear
pkg load image
a = imread(strcat('teste1.jpg'));
linhas = 10;
colunas = 11;
qtd_imagens = linhas * colunas;
tam_pix = int32(min(size(a,1)/linhas , size(a,2)/colunas) -1);  %define o tamanho do quadrado de acordo com
                                                             %as dimensoes da imagem                                                              
                                                              
X = zeros(qtd_imagens, 67500);
cont = 0;
for i=1:linhas
    for j=1:colunas
      m = croping(a, tam_pix, i,j);
      im = imresize(m, [150 150]);
      %im = im/255;
      %im= imresize(im, [250 250]);
      cont = cont + 1;
      X(cont,:) = im(:);
      
    end
end

%    for j=4:10
%      m = croping(a, tam_pix, 7,j);
%      im = imresize(m, [150 150]);
%      
%      cont = cont + 1;
%      X(cont,:) = im(:);
%      
%    end

y= zeros(qtd_imagens, 1);
y(1,:) = 2;

save('teste1.mat', 'X', 'y');

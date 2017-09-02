clc;
clear;
pkg load image;
a = double(imread('DSC_0011.jpg'));
a = a/255;
imshow(a);

linhas = 10;
colunas = 11;
qtd_imagens = linhas * colunas;
tam_pix = int32(min(size(a,1)/linhas , size(a,2)/colunas));  %define o tamanho do quadrado de acordo com
                                                              %as dimensoes da imagem

X = zeros(qtd_imagens, 30000);
for i=1:linhas
%    for j=1:colunas
      m = croping(a, tam_pix, i,i);
      im = imresize(m, [350 350]);
      %im = im/255;
      figure, imshow(im);
      im= imresize(im, [350 350]);
      
      X(i,:) = im(:);
%    end
end

y= zeros(qtd_imagens, 1);
y(1,:) = 1;


save('DSC_0003.mat', 'X', 'y');           %salva as matrizes 'recortadas' em 100x100 px associando com 1
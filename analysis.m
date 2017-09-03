
function [pred] = analysis(imgk)
  pkg load image
  a = double(imread(strcat(imgk)));
  a = a/255;
  linhas = 10;
  colunas = 11;
  qtd_imagens = linhas * colunas;
  tam_pix = int32(min(size(a,1)/linhas , size(a,2)/colunas) -1);  %define o tamanho do quadrado de acordo com

  input_layer_size  = 67500;  % imagens de 20x20
  hidden_layer_size = 1000;   % 25 unidades na camada intermediária
  num_labels = 2;

  load('P1.mat');

  pred = zeros(linhas, colunas);
  for i=1:linhas
    for j=1:colunas
      X = zeros(1, 67500);
      m = croping(a, tam_pix, i,j);
      im = imresize(m, [150 150]);
      X(1, :) = double(im(:));
      pred(i, j) = predict(Theta1, Theta2, X);
      fprintf('%d ', pred(i,j));
    end
    fprintf('\n');
  end
end

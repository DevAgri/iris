%pkg load image
%a = double(imread(strcat('teste1.jpg')))/255;
%linhas = 10;
%colunas = 11;
%qtd_imagens = linhas * colunas;
%tam_pix = int32(min(size(a,1)/linhas , size(a,2)/colunas) -1);  %define o tamanho do quadrado de acordo com
%
%input_layer_size  = 67500;  % imagens de 20x20 
%hidden_layer_size = 1000;   % 25 unidades na camada intermediária
%num_labels = 2;
%imshow(a)
%%load('P1.mat');
%y = zeros(linhas, colunas);
%pred = zeros(linhas, colunas);
%for i=1:linhas
%  for j=1:colunas
%    X = zeros(1, 67500);
%    m = croping(a, tam_pix, i,j);
%    im = imresize(m, [150 150]);
%    X(1, :) = double(im(:));
%    if(i==1) y(i, j)=1;
%    else y(i,j)=2;
%    end
%  end
%  fprintf('\n');
%end 
%W=X;
%y
% =================== Treinando a rede neural ===================
  
load('q9.mat');
W=X/255;
y(:, 1) = 2;
fprintf('\nTreinando a rede neural... \n')


options = optimset('MaxIter', 50);

%  should also try different values of lambda
lambda = 1;

initial_Theta1 = Theta1;
initial_Theta2 = Theta2;

% 
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

% 
costFunction = @(p) cost_function(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, W, y, lambda);

% Função de otimização
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
save('P1.mat', 'Theta1', 'Theta2');
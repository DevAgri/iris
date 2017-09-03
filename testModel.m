clear ; 
close all; 
clc
pkg load statistics
%% Parametros da rede
input_layer_size  = 67500;  % imagens de 20x20 
hidden_layer_size = 1000;   % 25 unidades na camada intermediária
num_labels = 2;          % 10 classe, de 1 a 10

k=3;

fprintf("Loading matrix!\n");
load('ps.mat');
fprintf("Matrix loaded!\n");

m = size(W, 1);
c = cvpartition(y,'KFold',k);
warning('off', 'Octave:possible-matlab-short-circuit-operator');
%% =================== Treinando a rede neural ===================
%  
%
accuracy=zeros(k);
for i=1:k,
fprintf('\nTreinando a rede neural... \n')


options = optimset('MaxIter', 30);

%  should also try different values of lambda
lambda = 1;

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% 
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

% 
costFunction = @(p) cost_function(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, W(training(c,i), :), y(training(c,i), :), lambda);

% Função de otimização
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
pred = predict(Theta1, Theta2, W(test(c,i), :));
 accuracy(i)= mean(double(pred == y(test(c,i), :))) * 100;
                
 end
 accuracy
mean(accuracy)
function [J,  grad] = cost_function(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%COST_FUNCTION implementa a função de custo da rede neural
%   [J grad] = COST_FUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) calcula a função de custo  e o gradiente da rede. 
%

% Não altere!!
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
size(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end))
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Variáveis úteis
m = size(X, 1);

% Você deve preencher as seguintes variáveis corretamente
J = 0;
Theta1_grad = zeros(size(Theta1)); % gradiente de Theta1
Theta2_grad = zeros(size(Theta2)); % gradiente de Theta2


% Mudança de representação de y para um vetor Y
I = eye(num_labels);
Y = zeros(m, num_labels);
for i=1:m
  Y(i, :)= I(y(i), :);
end
%==========FUNÇÃO DE CUSTO============
for i=1:m,
     a_1=X(i,:);
     a_1=[1,a_1];
     z_2=a_1*Theta1';
     a_2=sigmoid(z_2);
     a_2=[1,a_2];
     z_3=a_2*Theta2';
     a_3=sigmoid(z_3);
     J=J+(-1)*sum(Y(i,:).*log(a_3))-sum((1-Y(i, :)).*log(1-a_3));
     end
     J=J/m;
    J=J+lambda/(2*m)*(sum(sum(Theta1.*Theta1)')+sum(sum(Theta2.*Theta2)));
    % =============== Sua implementação deve ser vir aqui ==================
a_1=[ones(m, 1),X];
z_2=a_1*Theta1';
a_2=sigmoid(z_2);
a_2=[ones(m,1),a_2];
z_3=a_2*Theta2';
a_3=sigmoid(z_3);
r_3=a_3-Y;
r_2=(Theta2'*r_3').*[ones(m,1),sigmoidGradient(z_2)]';;
delta_1=r_2*a_1;
delta_2=r_3'*a_2;
Theta1_grad=(1/m)*delta_1(2:end, :)+(lambda/m)*Theta1;
Theta2_grad=(1/m)*delta_2+(lambda/m)*Theta2;
% Não altere esta linha!!
grad = [Theta1_grad(:) ; Theta2_grad(:)];
end

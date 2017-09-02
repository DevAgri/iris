function p = predict(Theta1, Theta2, X)
%PREDICT classica um conjunto de amostras utilizando os parâmetros da 
%rede (Theta1 e Theta2)
%   p = PREDICT(Theta1, Theta2, X) devolve um vetor com a classse de 
%   cada amostra do conjunto X.

% variaveis úteis
m = size(X, 1);
num_classes = size(Theta2, 1);

% Voce deve preencher o seguinte vetor corretamente com a classe de cada
% amostra
p = zeros(m, 1);
for i=1:m,
    a_1=X(i,:);
    a_1=[1,a_1];
    z_2=a_1*Theta1';
    a_2=sigmoid(z_2);
    a_2=[1,a_2];
    z_3=a_2*Theta2';
    a_3=sigmoid(z_3);
    [maior, posicao]=max(a_3);
    p(i)=posicao;
    end
end

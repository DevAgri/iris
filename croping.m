function [M] = croping( Matriz, tampixel, W, K)

%  [W,K] = ind2sub(Matriz', Celula)
  
  M = Matriz(((W-1)*tampixel+1:W*tampixel), ((K-1)*tampixel+1:K*tampixel),1:3);

end
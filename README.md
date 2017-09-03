#CropLysis

CropLysis é um software classificador de soja por meio de redes neurais (IA). Seu funcionamento baseia na quantidade e qualidade de uma base de imagens dos grãos da soja.

____________________________________________________________________________________________________
#REQUISITOS:
1. Octave ou MATLAB
2. Pacote "image" do Octave
____________________________________________________________________________________________________

#COMO TREINAR:
1. Deve-se possuir um grande conjunto de imagens .jpg, com os grãos cortados transversalmente e dispostos em matriz.
2. No octave, exercutar "training".
3. Ao final, pesos das sinapses serão salvas em um arquivo chamado "p1.mat"
____________________________________________________________________________________________________
#COMO USAR:
1. Deve-se possuir uma imagem no formato .jpg, com os grãos cortados transversalmente e dispostos em matriz.
2. No Octave, executar "analysis('image_name.jpg')". A imagem deve estar salva no mesmo diretório de analysis.m.
3. Ao final, o resultado será uma matriz composta por 1's e 2's. 1 significa grão avariado e 2 grão saudável.
____________________________________________________________________________________________________
#CARACTERÍSTICA
1. Algoritmo de redes neurais simples
2. Classifica imagens de grãos no padrão e fora do padrão

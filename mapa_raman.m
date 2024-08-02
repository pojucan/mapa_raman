% Carregar o pacote de imagem
pkg load image

% Carregar a imagem do mapa Raman
mapa_raman = imread('mapa_raman.png');

% Converter para escala de cinza se necessário
if ndims(mapa_raman) == 3
    mapa_raman = rgb2gray(mapa_raman);
end

% Exibir a imagem original
figure;
imshow(mapa_raman);
title('Imagem Original do Mapa Raman');

% Processamento de imagem para destacar os picos (D e G)
% Aqui, um exemplo simples de limiarização pode ser usado
threshold = graythresh(mapa_raman);
imagem_binaria = im2bw(mapa_raman, threshold);

% Exibir a imagem binarizada
figure;
imshow(imagem_binaria);
title('Imagem Binarizada');

% Análise da intensidade dos picos
% Supondo que os picos D e G foram isolados, calculamos suas intensidades
intensidade_d = mean(mapa_raman(imagem_binaria)); % Exemplo para o pico D
intensidade_g = mean(mapa_raman(~imagem_binaria)); % Exemplo para o pico G

% Calcular a razão ID/IG
razao_id_ig = intensidade_d / intensidade_g;

% Exibir a razão ID/IG no terminal
disp(['Intensidade Pico D: ', num2str(intensidade_d)]);
disp(['Intensidade Pico G: ', num2str(intensidade_g)]);
disp(['Razão ID/IG: ', num2str(razao_id_ig)]);

% Visualização das intensidades dos picos (Mapa de calor)
figure;
imagesc(mapa_raman);
colorbar;
title('Mapa de Calor das Intensidades dos Picos Raman');

% Adicionar as métricas calculadas ao gráfico de mapa de calor
text(10, 10, ['Pico D: ', num2str(intensidade_d)], 'Color', 'white', 'FontSize', 12, 'BackgroundColor', 'black');
text(10, 30, ['Pico G: ', num2str(intensidade_g)], 'Color', 'white', 'FontSize', 12, 'BackgroundColor', 'black');
text(10, 50, ['Razão ID/IG: ', num2str(razao_id_ig)], 'Color', 'white', 'FontSize', 12, 'BackgroundColor', 'black');


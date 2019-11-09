conjunto1 = [

]

conjunto2 = [

]

conjunto3 = [

]

% Unindo todos os conjuntos
mat_conjuntos = [conjunto1;conjunto2;conjunto3];

% Criando conjunto de saídas (D)
% Coloca-se 1 na coluna referente ao conjunto (Verificar para mais de 2 colunas)
[lin,col] = size(conjunto1);    % Para conjunto1
D = [ones(lin,1) zeros(lin,[1]) zeros(lin,[1])];

[lin,col] = size(conjunto2);    % Para conjunto2
D = [D; zeros(lin,1) ones(lin,1) zeros(lin,[1])];

[lin,col] = size(conjunto3);    % Para conjunto3
D = [D; zeros(lin,1) zeros(lin,1) ones(lin,[1])];

% Redistribuicao dos padroes
[lin,col] = size(mat_conjuntos);
ind = randperm(lin);    % Seleciona linhas aleatorias
mat_conjuntos = mat_conjuntos(ind,:);    % Cria novo conjunto com as linhas selecionadas
D = D(ind,:);    % Cria novo conjunto de saida com as linhas selecionadas

% Criando conjunto de teste e treinamento
pctr = 0.8;    % Porcentagem de treinamento
numtr = round(pctr*lin); % Escolhe um número baseado na porcentagem
Xtr = mat_conjuntos(1:numtr,:);  % Seleciona as linhas de 1 ate um numero e todas as colunas da linha
Dtr = D(1:numtr,:); % Analogo para o conjunto de saidas
Xt = mat_conjuntos(numtr+1:end,:);  % Seleciona o resto para o conjunto de teste
Dt = D(numtr+1:end;:); % Analogo para as saidas

save experimentoclass mat D Xtr Dtr Xt Dt
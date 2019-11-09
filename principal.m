clear;
conjuntos;
load experimentoclass;

[nl,nc] = size(Xtr);    % Para treinamento

% Fatore de Escala para a entrada
Xtremin = -0,7*ones(1,nc);  % Cria uma matriz escalonada para treinamento
Xtremax = 0,7*ones(1,nc);
Xtrmin = min(Xtr);  % Seleciona os menores valores da matriz
Xtrmax = max(Xtr);

% Arrumar este trecho
Xtre=(Xtr-repmat(Xtrmin,nl,1)).*repmat((Xtremax-Xtremin)./(Xtrmax-Xtrmin),nl,1)+repmat(Xtremin,nl,1);

[nl,nc] = size(Xt); % Para teste
Xte=(Xt-repmat(Xtrmin,nl,1)).*repmat((Xtremax-Xtremin)./(Xtrmax-Xtrmin),nl,1)+repmat(Xtremin,nl,1);
% 

% Alterando condicao inicial e neuronios na camada oculta
numhid = 10;    % Maximo de neuronios
numinic = 10;   % Maximo de condicao inicial
for h=1:numhid
    for i=1:numinic
        P=h;    % Muda a quantidade de neuronios
        [W,V,Ytre, EQtre, taxatr] = classtreino(Xtre, Dtr, P);
        Mrt(i,h) = taxatr;
        [Yte, Ete, EQte, taxat] = classtreino(Xte, Dt, W, V, P);
        Mt(i,h) = taxat;
    end
end
figure(1)
boxplot(Mtr)
title('Taxas acerto no treinamento')
xlabel('numero de unidades ocultas')
ylabel('taxa')
figure(2)
boxplot(Mt)
title('Taxas acerto no teste')
xlabel('n�mero de unidades ocultas')
ylabel('taxa')
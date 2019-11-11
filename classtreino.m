% Recebe Xtre, Dtr, P
% Retorna W, V, Ytre, EQtre, taxatr

function [W,V,Y,EQ,taxa] = classtreino(X,D,P)
    [N,m]=size(X);
    [N,c]=size(D);
    W=randn(P,m+1); % Inicializacao aleatoria
    Xa = [X ones(N,1)];
    S = Xa*W'; % Somas ponderadas para a camada oculta
    H = tanh(S);
    Ha = [H ones(N,1)];
    Vt = pinv(Ha)*D;    % Vt = inv(Ha'*Ha)*Ha'*D; Transposta de V
    V = Vt';
    Z = Ha*V';  % Somas ponderadas para a camada de saida
    Y=Z;        % Saida com funcoes de ativacao lineares, tipo identidade
    E=D-Y;
    EQ=1/2*E(:)'*E(:);

    % Indicacoes de classe
    [val,I]=max(Y');
    [val2,I2]=max(D');
    numacertos=sum(I==I2);
    taxa=numacertos/N;
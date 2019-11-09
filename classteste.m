% Recebe Xte, Dt, W, V, P
% Retorna Yte, Ete, EQte, taxat

function [Y, E, EQ, taxa] = classteste(X, D, W, V, P){
    [N,m]=size(X);
    [N,C]=size(D);
    Xa=[X ones(N,1)];
    S=Xa*W';    % Somas ponderadas para a camada oculta
    H=tanh(S);
    Ha=[H ones(N,1)];
    Z=Ha*V';    % Somas ponderadas para a camada de saida
    Y=Z;        % Saida com funcoes de ativacao lineares, tipo identidade
    E=D-Y;
    EQ=1/2*E(:)'*E(:);

    % Indicacoes de classe
    [val,I]=max(Y');
    [val2,I2]=max(D');
    numacertos=sum(I==I2);
    taxa=numacertos/N;
}
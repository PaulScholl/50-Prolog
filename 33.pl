% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Dos números son coprimos si su máximo común divisor es 1.
coprime(X, Y) :- gcd(X, Y, 1).

% Calcula la función totiente de Euler, que cuenta cuántos números menores que M son coprimos con M.
% https://es.wikipedia.org/wiki/Función_φ_de_Euler
totient(1, 1).
totient(M, Phi) :- M > 1, totient_acc(M, M, 0, Phi).

totient_acc(_, 0, Acc, Acc).
totient_acc(M, K, Acc, Phi) :- K > 0, coprime(M, K), Acc1 is Acc + 1, K1 is K - 1, totient_acc(M, K1, Acc1, Phi).
totient_acc(M, K, Acc, Phi) :- K > 0, \\+ coprime(M, K), K1 is K - 1, totient_acc(M, K1, Acc, Phi).
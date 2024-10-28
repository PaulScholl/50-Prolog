% Genera una tabla de verdad para una expresión lógica en dos variables.
% A y B son las variables lógicas y Expr es la expresión lógica que se evalúa.
table(A, B, Expr) :- write(A), write(' '), write(B), write(' '), call(Expr), nl, fail.
table(_, _, _).
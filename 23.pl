% -------------------------------------------------------------------
%  Programa: 23.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Extraer un número dado de elementos seleccionados aleatoriamente de una lista.
%   
% -------------------------------------------------------------------

% class Program
% {   
%     //Extraer  un numero dado de elementos seleccionados aleatorioamente de una lista;
%     static void Borrar( List<int> lista, int cantidad){
%         int contador = 1;
%         while(contador <= cantidad){
%             Random eliminado = new Random();
%             lista.RemoveAt(eliminado.Next(0,lista.Count));
%             contador++;
%         }
%     }
% 
%     static void Main(string[] args)
%     {
%         List<int> lista = new List<int> {1,2,3,4,5,6,7,8,9,10};
%         Program.Borrar(lista,5);
%     }
% }

% Extrae un número dado de elementos aleatorios de una lista.
% Caso base: seleccionar 0 elementos resulta en una lista vacía.
rnd_select(_, 0, []).

% Caso recursivo: selecciona un elemento aleatorio de la lista y llama recursivamente.
rnd_select(L, N, [X|R]) :- 
    length(L, Len), 
    Len > 0,                       % Asegúrate de que la lista no esté vacía.
    random(1, Len, I), 
    element_at(X, L, I),           % Obtiene el elemento en la posición I.
    delete(L, X, L1),              % Elimina el elemento seleccionado de la lista.
    N1 is N - 1,                   % Decrementa el contador de elementos restantes.
    rnd_select(L1, N1, R).          % Llama recursivamente con la lista reducida.

% Extrae el elemento en la posición I de la lista L.
element_at(X, [X|_], 1).                    % Caso base: el primer elemento es el que buscamos.
element_at(X, [_|T], I) :-                    % Caso recursivo: busca en la cola.
    I > 1, 
    I1 is I - 1, 
    element_at(X, T, I1).


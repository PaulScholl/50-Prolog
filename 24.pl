% -------------------------------------------------------------------
%  Programa: 24.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Lotería: Extraer N números aleatorios de un rango.
%   
% -------------------------------------------------------------------

% class Program
% {   
%     //Lotería: Extraer N números aleatorios de un rango.
% 
%     static void Lotto(int start, int finish,int cantidad){
%         
%         //Generamos la lista dentro del rango establecido
%         List<int> lista = new List<int>();
%         lista.AddRange(Enumerable.Range(start,finish+1-start));
%         
%         //Iniciamos el contador de numeros elimniados
%         int contador = 1;
% 
%         //El ciclo que se encargará de imprimir el numero a eliminar
%         // y pues eliminarlo
%         while(contador <= cantidad){
%             Random eliminado = new Random();
%             int seleccionado = eliminado.Next(0,lista.Count);
%             Console.WriteLine("Numero: {0}", lista[seleccionado].ToString());
%             lista.RemoveAt(seleccionado);
%             contador++;
%         }
%     }
% 
%     static void Main(string[] args)
%     {
%         Program.Lotto(10,50,5);
%     }
% }

% Genera una lista con todos los enteros dentro de un rango dado.
% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).
% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- I < K, I1 is I + 1, range(I1, K, R).

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

% Extrae N números aleatorios de un rango dado.
% Utiliza la función range para generar la lista de números y luego selecciona aleatoriamente.
lotto(N, M, L) :- 
    range(1, M, R),        % Genera una lista de números del 1 al M.
    rnd_select(R, N, L).   % Selecciona N números aleatorios de la lista generada.

% -------------------------------------------------------------------
%  Programa: 9.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Agrupar duplicados consecutivos de los elementos de una lista en sublistas
%   
% -------------------------------------------------------------------
% {
%     static void Main()
%     {
%         List<int> numeros = new List<int> { 1, 1, 2, 3, 3, 3, 4, 4, 5 };
%         List<List<int>> grupos = Duplicados(numeros);
% 
%         // Mostrar el resultado
%         foreach (var grupo in grupos)
%         {
%             Console.WriteLine("[" + string.Join(", ", grupo) + "]");
%         }
%     }
% 
%     static List<List<int>> Duplicados(List<int> lista)
%     {
%         List<List<int>> resultado = new List<List<int>>();
%         if (lista.Count == 0) return resultado;
% 
%         List<int> grupoActual = new List<int> { lista[0] };
% 
%         for (int i = 1; i < lista.Count; i++)
%         {
%             if (lista[i] == lista[i - 1])
%             {
%                 // Si el elemento es igual al anterior, añadir al grupo actual
%                 grupoActual.Add(lista[i]);
%             }
%             else
%             {
%                 // Si es diferente, guardar el grupo actual y empezar uno nuevo
%                 resultado.Add(grupoActual);
%                 grupoActual = new List<int> { lista[i] };
%             }
%         }
% 
%         // Añadir el último grupo
%         resultado.Add(grupoActual);
% 
%         return resultado;
%     }
% }

% Agrupa duplicados consecutivos de una lista en sublistas.
% Caso base: una lista vacía se agrupa como una lista vacía.
pack([], []).
% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista.
pack([X|Xs], [[X|Ys]|Zs]) :- transfer(X, Xs, Ys, Rest), pack(Rest, Zs).

% Transfiere los elementos duplicados consecutivos a una sublista.
transfer(X, [], [], []).
% Si el siguiente elemento es diferente, termina la transferencia.
transfer(X, [Y|Ys], [], [Y|Ys]) :- X \= Y.
% Si el siguiente elemento es igual, agrégalo a la sublista.
transfer(X, [X|Xs], [X|Ys], Rest) :- transfer(X, Xs, Ys, Rest).
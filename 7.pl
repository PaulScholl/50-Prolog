% -------------------------------------------------------------------
%  Programa: 7.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Aplanar una estructura de lista anidada
%   
% -------------------------------------------------------------------

% class Program{
% 
%     static void Palindromo(List<List<string>> lista){
%         
%         List<string> Plano = new List<string>();
%         foreach (var item in lista){
%             foreach(var item2 in item){
%                 Plano.Add(item2);
%             }
%         }
%     }
% 
%     static void Main(string[] args)
%     {
%         List<List<string>> myList = new List<List<string>>();
%         myList.Add(new List<string> { "Josue", "Paul" });
%         myList.Add(new List<string> { "Maximiliano", "Geras", "Jairo" });
%         myList.Add(new List<string> { "Yahir", "Oswaldo", "Franco" });
%         myList.Add(new List<string> { "Alfredo"});
%         
%         Program.Palindromo(myList);
%     }
% }

% Aplana una lista anidada en una lista simple.
% Caso base: la lista vacía se aplana a una lista vacía.
my_flatten([], []).
% Caso recursivo: si la cabeza es una lista, aplana la cabeza y la cola recursivamente.
my_flatten([H|T], Flat) :- my_flatten(H, FH), my_flatten(T, FT), append(FH, FT, Flat).
% Si la cabeza no es una lista, simplemente agrégala al resultado.
my_flatten(X, [X]) :- X \= [], \+ is_list(X).
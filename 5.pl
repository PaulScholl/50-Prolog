% -------------------------------------------------------------------
%  Programa: 5.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Invertir una lista
%   
% -------------------------------------------------------------------

% class Program
% {    
%     static void reversa(List<string> lista){
%         Console.WriteLine("Lista Normal");
%         for(int counter = 0; counter < lista.Count; counter++){
%             Console.Write(lista[counter].ToString() + " ");
%         } 
%         Console.WriteLine("\nLista Inversa");
%         lista.Reverse();
%         for(int counter = 0; counter < lista.Count; counter++){
%             Console.Write(lista[counter].ToString() + " ");
%         }     
%     }
% 
%     static void Main(string[] args)
%     {
%         Program.reversa(new List<string> {"Paul","Jairo","Oswaldo","Franco","Geras","Boro"});
%     }
% }


% Invierte una lista.
% Utiliza un acumulador para ir construyendo la lista invertida.
reverse_list(L, R) :- reverse_list(L, [], R).
% Caso base: cuando la lista original está vacía, el acumulador contiene la lista invertida.
reverse_list([], Acc, Acc).
% Caso recursivo: mueve el elemento de la cabeza al acumulador.
reverse_list([H|T], Acc, R) :- reverse_list(T, [H|Acc], R).
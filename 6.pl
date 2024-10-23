% -------------------------------------------------------------------
%  Programa: 6.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Determinar si una lista es palindromo
%   
% -------------------------------------------------------------------

% class Program
% {    
%     static void Palindromo(List<string> lista){
% 
%         List<string> lista2 = new List<string>(lista);
%         lista2.Reverse();
%         if(lista == lista2){
%             Console.Write("Es una lista palindromo");
%         }else
%         {
%             Console.Write("No es una lista palindromo");
%         }
%     }
% 
%     static void Main(string[] args)
%     {
%         Program.Palindromo(new List<string> {"Paul","Jairo","Oswaldo","Franco","Geras","Boro"});
%     }
% }

% Verifica si una lista es un palíndromo.
% Una lista es un palíndromo si es igual a su inversa.
palindrome(L) :- reverse_list(L, L).
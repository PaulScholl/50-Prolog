% -------------------------------------------------------------------
%  Programa: 45.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 27 de Octubre de 2024
%  Objetivo:Comprobar si un término dado representa un árbol binario.
%   
% -------------------------------------------------------------------

%using System;
%using System.Collections.Generic;
%
%class Program
%{
%    static void Main()
%    {
%        Console.WriteLine("Ingrese la representación del árbol binario:");
%        string input = Console.ReadLine();
%
%        bool isValid = IsValidBinaryTree(input);
%        Console.WriteLine(isValid ? "Es un árbol binario válido." : "No es un árbol binario válido.");
%    }
%
%    static bool IsValidBinaryTree(string input)
%    {
%        Stack<char> stack = new Stack<char>();
%        bool hasChild = false;
%
%        foreach (char c in input)
%        {
%            if (char.IsLetter(c)) // Verificar si es una letra (nodo)
%            {
%                if (hasChild) return false; // No puede haber otro nodo en el mismo nivel sin cerrar paréntesis
%                hasChild = true; // Se encontró un nodo
%            }
%            else if (c == '(')
%            {
%                stack.Push(c);
%                hasChild = false; // Reiniciar para permitir nuevos nodos
%            }
%            else if (c == ')')
%            {
%                if (stack.Count == 0) return false; // No hay paréntesis abierto
%                stack.Pop();
%                hasChild = true; // Cerrar un nodo permite nuevos hijos
%            }
%            else
%            {
%                return false; // Caracter no válido
%            }
%        }
%
%        return stack.Count == 0 && hasChild; // Debe estar vacío y debe haber al menos un nodo
%    }
%}

% Verifica si un término dado representa un árbol binario.
% Un árbol binario está compuesto por un nodo raíz y dos subárboles.
istree(nil).
istree(t(_, L, R)) :- istree(L), istree(R).

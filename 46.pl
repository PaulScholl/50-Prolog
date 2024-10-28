% -------------------------------------------------------------------
%  Programa: 46.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 27 de Octubre de 2024
%  Objetivo: Construir árboles binarios completamente equilibrados.
%   
% -------------------------------------------------------------------

%using System;
%
%class Nodo
%{
%    public int Valor;
%    public Nodo Izquierdo;
%    public Nodo Derecho;
%
%    public Nodo(int valor)
%    {
%        Valor = valor;
%        Izquierdo = null;
%        Derecho = null;
%    }
%}
%
%class Programa
%{
%    // Función para construir un árbol equilibrado
%    static Nodo ConstruirArbolEquilibrado(int n, ref int valorActual)
%    {
%        if (n <= 0)
%            return null;
%
%        // Crear el nodo raíz
%        Nodo raiz = new Nodo(valorActual++);
%        
%        // Calcular el número de nodos en el subárbol izquierdo
%        int izquierdaNodos = (n - 1) / 2;
%
%        // Construir subárbol izquierdo y derecho
%        raiz.Izquierdo = ConstruirArbolEquilibrado(izquierdaNodos, ref valorActual);
%        raiz.Derecho = ConstruirArbolEquilibrado(n - 1 - izquierdaNodos, ref valorActual);
%
%        return raiz;
%    }
%
%    // Función para imprimir el árbol en preorden
%    static void ImprimirArbol(Nodo raiz)
%    {
%        if (raiz == null)
%            return;
%
%        Console.Write(raiz.Valor + " ");
%        ImprimirArbol(raiz.Izquierdo);
%        ImprimirArbol(raiz.Derecho);
%    }
%
%    // Función principal
%    static void Main()
%    {
%        int n = 7; // Número total de nodos
%        int valorActual = 1; // Valor inicial
%        Nodo arbol = ConstruirArbolEquilibrado(n, ref valorActual);
%
%        Console.WriteLine("Árbol en preorden:");
%        ImprimirArbol(arbol);
%        Console.WriteLine();
%    }
%}

% Construye un árbol binario completamente equilibrado con N nodos.
cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :-
    N > 0,
    N1 is N - 1,
    divide(N1, N2, N3),       % Divide los nodos restantes en dos partes
    cbal_tree(N2, L),         % Construye el subárbol izquierdo
    cbal_tree(N3, R).         % Construye el subárbol derecho

% Divide el número de nodos entre los dos subárboles de manera equilibrada.
divide(N, N1, N2) :-
    N1 is N // 2,
    N2 is N - N1.

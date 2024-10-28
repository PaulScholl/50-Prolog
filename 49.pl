% -------------------------------------------------------------------
%  Programa: 49.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Aplicar el paradigma de generar y probar para construir todos los árboles binarios simétricos y completamente equilibrados con un número dado de nodos.
%   
% -------------------------------------------------------------------

%using System;
%using System.Collections.Generic;
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
%    // Genera todos los árboles binarios con un número dado de nodos
%    static List<Nodo> GenerarArboles(int n)
%    {
%        List<Nodo> arboles = new List<Nodo>();
%        
%        if (n == 0)
%        {
%            arboles.Add(null);
%            return arboles;
%        }
%        
%        for (int i = 0; i < n; i++)
%        {
%            List<Nodo> izquierdo = GenerarArboles(i);
%            List<Nodo> derecho = GenerarArboles(n - 1 - i);
%            
%            foreach (var izq in izquierdo)
%            {
%                foreach (var der in derecho)
%                {
%                    Nodo raiz = new Nodo(0); // Valor temporal
%                    raiz.Izquierdo = izq;
%                    raiz.Derecho = der;
%                    arboles.Add(raiz);
%                }
%            }
%        }
%        
%        return arboles;
%    }
%
%    // Verifica si un árbol es completamente equilibrado
%    static bool EsCompletamenteEquilibrado(Nodo raiz)
%    {
%        if (raiz == null) return true;
%
%        int alturaIzquierda = Altura(raiz.Izquierdo);
%        int alturaDerecha = Altura(raiz.Derecho);
%        
%        return Math.Abs(alturaIzquierda - alturaDerecha) <= 1 &&
%               EsCompletamenteEquilibrado(raiz.Izquierdo) &&
%               EsCompletamenteEquilibrado(raiz.Derecho);
%    }
%
%    // Calcula la altura de un árbol
%    static int Altura(Nodo nodo)
%    {
%        if (nodo == null) return 0;
%        return 1 + Math.Max(Altura(nodo.Izquierdo), Altura(nodo.Derecho));
%    }
%
%    // Verifica si un árbol es simétrico
%    static bool EsSimetrico(Nodo raiz)
%    {
%        return EsSimetrico(raiz, raiz);
%    }
%
%    private static bool EsSimetrico(Nodo nodo1, Nodo nodo2)
%    {
%        if (nodo1 == null && nodo2 == null) return true;
%        if (nodo1 == null || nodo2 == null) return false;
%
%        return (nodo1.Valor == nodo2.Valor) &&
%               EsSimetrico(nodo1.Izquierdo, nodo2.Derecho) &&
%               EsSimetrico(nodo1.Derecho, nodo2.Izquierdo);
%    }
%
%    static void Main()
%    {
%        int n = 3; // Número total de nodos
%        List<Nodo> arboles = GenerarArboles(n);
%        List<Nodo> arbolesSimetricosEquilibrados = new List<Nodo>();
%
%        foreach (var arbol in arboles)
%        {
%            if (EsCompletamenteEquilibrado(arbol) && EsSimetrico(arbol))
%            {
%                arbolesSimetricosEquilibrados.Add(arbol);
%            }
%        }
%
%        Console.WriteLine($"Número de árboles simétricos y completamente equilibrados con {n} nodos: {arbolesSimetricosEquilibrados.Count}");
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

% Comprueba si un árbol binario es simétrico.
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

% Genera todos los árboles binarios simétricos y completamente equilibrados con N nodos.
sym_cbal_trees(N, Ts) :- 
    findall(T, (cbal_tree(N, T), symmetric(T)), Ts).

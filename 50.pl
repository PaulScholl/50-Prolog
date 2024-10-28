% -------------------------------------------------------------------
%  Programa: 50.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 27 de Octubre de 2024
%  Objetivo: Construir árboles binarios equilibrados en altura.
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
%class ArbolBinario
%{
%    private Nodo raiz;
%
%    // Función para construir un árbol equilibrado en altura
%    public void ConstruirArbolEquilibrado(int[] valores)
%    {
%        Array.Sort(valores); // Aseguramos que los valores estén ordenados
%        raiz = ConstruirArbolRecursivo(valores, 0, valores.Length - 1);
%    }
%
%    private Nodo ConstruirArbolRecursivo(int[] valores, int inicio, int fin)
%    {
%        if (inicio > fin)
%            return null;
%
%        // Encuentra el punto medio para asegurar equilibrio
%        int medio = (inicio + fin) / 2;
%        Nodo nodo = new Nodo(valores[medio]);
%
%        nodo.Izquierdo = ConstruirArbolRecursivo(valores, inicio, medio - 1);
%        nodo.Derecho = ConstruirArbolRecursivo(valores, medio + 1, fin);
%
%        return nodo;
%    }
%
%    // Función para imprimir el árbol en orden
%    public void ImprimirEnOrden()
%    {
%        ImprimirEnOrdenRecursivo(raiz);
%        Console.WriteLine();
%    }
%
%    private void ImprimirEnOrdenRecursivo(Nodo nodo)
%    {
%        if (nodo != null)
%        {
%            ImprimirEnOrdenRecursivo(nodo.Izquierdo);
%            Console.Write(nodo.Valor + " ");
%            ImprimirEnOrdenRecursivo(nodo.Derecho);
%        }
%    }
%}
%
%class Programa
%{
%    static void Main()
%    {
%        int[] valores = { 1, 2, 3, 4, 5, 6, 7 }; // Ejemplo de valores
%        ArbolBinario arbol = new ArbolBinario();
%
%        arbol.ConstruirArbolEquilibrado(valores);
%
%        Console.WriteLine("Árbol en orden:");
%        arbol.ImprimirEnOrden();
%    }
%}

% Construye un árbol binario equilibrado en altura con una altura dada.
% Un árbol equilibrado en altura tiene subárboles cuya diferencia de altura es como máximo 1.
hbal_tree(0, nil).
hbal_tree(H, t('x', L, R)) :- H > 0, H1 is H - 1, H2 is H1 - 1, hbal_tree(H1, L), hbal_tree(H2, R).

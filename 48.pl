% -------------------------------------------------------------------
%  Programa: 48.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo:Árboles binarios de búsqueda.
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
%class ArbolBinarioBusqueda
%{
%    private Nodo raiz;
%
%    // Función para insertar un nuevo valor
%    public void Insertar(int valor)
%    {
%        raiz = InsertarRecursivo(raiz, valor);
%    }
%
%    private Nodo InsertarRecursivo(Nodo nodo, int valor)
%    {
%        if (nodo == null)
%        {
%            return new Nodo(valor);
%        }
%
%        if (valor < nodo.Valor)
%        {
%            nodo.Izquierdo = InsertarRecursivo(nodo.Izquierdo, valor);
%        }
%        else if (valor > nodo.Valor)
%        {
%            nodo.Derecho = InsertarRecursivo(nodo.Derecho, valor);
%        }
%
%        return nodo; // Retorna el nodo sin cambios si el valor ya existe
%    }
%
%    // Función para buscar un valor
%    public bool Buscar(int valor)
%    {
%        return BuscarRecursivo(raiz, valor);
%    }
%
%    private bool BuscarRecursivo(Nodo nodo, int valor)
%    {
%        if (nodo == null)
%        {
%            return false; // Valor no encontrado
%        }
%
%        if (valor == nodo.Valor)
%        {
%            return true; // Valor encontrado
%        }
%
%        return valor < nodo.Valor
%            ? BuscarRecursivo(nodo.Izquierdo, valor)
%            : BuscarRecursivo(nodo.Derecho, valor);
%    }
%
%    // Función para recorrer el árbol en orden
%    public void RecorrerEnOrden()
%    {
%        RecorrerEnOrdenRecursivo(raiz);
%        Console.WriteLine();
%    }
%
%    private void RecorrerEnOrdenRecursivo(Nodo nodo)
%    {
%        if (nodo != null)
%        {
%            RecorrerEnOrdenRecursivo(nodo.Izquierdo);
%            Console.Write(nodo.Valor + " ");
%            RecorrerEnOrdenRecursivo(nodo.Derecho);
%        }
%    }
%}
%
%class Programa
%{
%    static void Main()
%    {
%        ArbolBinarioBusqueda arbol = new ArbolBinarioBusqueda();
%
%        // Insertar valores
%        arbol.Insertar(5);
%        arbol.Insertar(3);
%        arbol.Insertar(7);
%        arbol.Insertar(2);
%        arbol.Insertar(4);
%        arbol.Insertar(6);
%        arbol.Insertar(8);
%
%        // Recorrer el árbol en orden
%        Console.WriteLine("Recorrido en orden:");
%        arbol.RecorrerEnOrden();
%
%        // Buscar valores
%        int valorABuscar = 4;
%        Console.WriteLine($"Buscar {valorABuscar}: {(arbol.Buscar(valorABuscar) ? "Encontrado" : "No encontrado")}");
%
%        valorABuscar = 10;
%        Console.WriteLine($"Buscar {valorABuscar}: {(arbol.Buscar(valorABuscar) ? "Encontrado" : "No encontrado")}");
%    }
%}

% Construye un árbol binario de búsqueda a partir de una lista de enteros.
% Un árbol binario de búsqueda es un árbol en el cual, para cada nodo, todos los elementos en el subárbol izquierdo son menores y en el subárbol derecho son mayores.
construct([], nil).
construct([X|Xs], T) :- construct(Xs, T1), add(X, T1, T).

% Añade un nodo a un árbol binario de búsqueda.
add(X, nil, t(X, nil, nil)).
add(X, t(Root, L, R), t(Root, NL, R)) :- X < Root, add(X, L, NL).
add(X, t(Root, L, R), t(Root, L, NR)) :- X >= Root, add(X, R, NR).

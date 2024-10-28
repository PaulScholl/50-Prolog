% -------------------------------------------------------------------
%  Programa: 47.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 27 de Octubre de 2024
%  Objetivo: Árboles binarios simétricos.
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
%    // Función para verificar si dos árboles son simétricos
%    static bool EsSimetrico(Nodo nodo1, Nodo nodo2)
%    {
%        if (nodo1 == null && nodo2 == null)
%            return true;
%
%        if (nodo1 == null || nodo2 == null)
%            return false;
%
%        return (nodo1.Valor == nodo2.Valor) &&
%               EsSimetrico(nodo1.Izquierdo, nodo2.Derecho) &&
%               EsSimetrico(nodo1.Derecho, nodo2.Izquierdo);
%    }
%
%    // Función para verificar si un árbol es simétrico
%    static bool EsArbolSimetrico(Nodo raiz)
%    {
%        return EsSimetrico(raiz, raiz);
%    }
%
%    // Función para construir un árbol de ejemplo
%    static Nodo ConstruirArbolEjemplo()
%    {
%        Nodo raiz = new Nodo(1);
%        raiz.Izquierdo = new Nodo(2);
%        raiz.Derecho = new Nodo(2);
%        raiz.Izquierdo.Izquierdo = new Nodo(3);
%        raiz.Izquierdo.Derecho = new Nodo(4);
%        raiz.Derecho.Izquierdo = new Nodo(4);
%        raiz.Derecho.Derecho = new Nodo(3);
%        return raiz;
%    }
%
%    // Función principal
%    static void Main()
%    {
%        Nodo arbol = ConstruirArbolEjemplo();
%
%        if (EsArbolSimetrico(arbol))
%        {
%            Console.WriteLine("El árbol es simétrico.");
%        }
%        else
%        {
%            Console.WriteLine("El árbol no es simétrico.");
%        }
%    }
%}

% Comprueba si un árbol binario es simétrico.
% Un árbol es simétrico si sus subárboles izquierdo y derecho son espejos entre sí.
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

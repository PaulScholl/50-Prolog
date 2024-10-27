% -------------------------------------------------------------------
%  Programa: 2.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 5 de Septiembre de 2024
%  Objetivo: Encontrar el penúltimo elemento de una lista.
%   
% -------------------------------------------------------------------
%
%
% class Program
%
%    public static void Regresar(List<int> Valores){
%
%        //Preguntar si el
%        if(Valores.Count < 2 || Valores == null){
%            Console.Write("Hubo un error.");
%        }else{
%            Console.Write("El valor guardado es: {0}" ,Valores[Valores.Count-2]);
%        }
%    }
%    static void Main(string[] args)
%    {
%        List<int> Lista = new List<int>() {1,2,3,4,10,11};
%        Regresar(Lista);
%    }
%

% Encuentra el penúltimo elemento de una lista.
% La lista debe tener al menos dos elementos.
penultimate(X, [X, _]).
penultimate(X, [_|T]) :- penultimate(X, T).

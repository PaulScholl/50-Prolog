% -------------------------------------------------------------------
%  Programa: 43.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 27 de Octubre de 2024
%  Objetivo: Código Gray
%   
% -------------------------------------------------------------------
%using System;
%using System.Collections.Generic;
%
%class Program
%{
%    static void Main()
%    {
%        Console.WriteLine("Ingrese el número de bits para generar el código Gray:");
%        int n = Convert.ToInt32(Console.ReadLine());
%
%        List<string> grayCode = GenerarCodigoGray(n);
%
%        Console.WriteLine("Código Gray:");
%        foreach (var code in grayCode)
%        {
%            Console.WriteLine(code);
%        }
%    }
%
%    static List<string> GenerarCodigoGray(int n)
%    {
%        List<string> result = new List<string>();
%        int totalCodes = 1 << n; // Total de códigos Gray es 2^n
%
%        for (int i = 0; i < totalCodes; i++)
%        {
%            // Conversión de i a Gray: i ^ (i >> 1)
%            int gray = i ^ (i >> 1);
%            result.Add(Convert.ToString(gray, 2).PadLeft(n, '0')); // Convertir a binario y rellenar
%        }
%
%        return result;
%    }
%}
% Genera el código Gray de N bits.
% https://es.wikipedia.org/wiki/Código_Gray
% La secuencia de código Gray es una secuencia binaria en la que dos valores consecutivos difieren en solo un bit.
gray(1, ['0', '1']).
gray(N, C) :- N > 1, N1 is N - 1, gray(N1, C1), maplist(atom_concat('0'), C1, C0), reverse(C1, C1R), maplist(atom_concat('1'), C1R, C1G), append(C0, C1G, C).

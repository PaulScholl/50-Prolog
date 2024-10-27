% -------------------------------------------------------------------
%  Programa: 27.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Agrupar los elementos de un conjunto en subconjuntos disjuntos.
%   
% -------------------------------------------------------------------
% 
% 
% 
% class Program
% {
%     static void Main()
%     {
%         List<int> conjunto = new List<int> { 1, 2, 3 };
%         List<List<List<int>>> particiones = GenerarParticiones(conjunto);
% 
%         // Mostrar el resultado
%         foreach (var particion in particiones)
%         {
%             Console.WriteLine("Partición:");
%             foreach (var subconjunto in particion)
%             {
%                 Console.WriteLine("[" + string.Join(", ", subconjunto) + "]");
%             }
%             Console.WriteLine();
%         }
%     }
% 
%     // Función para generar todas las particiones disjuntas del conjunto
%     static List<List<List<int>>> GenerarParticiones(List<int> conjunto)
%     {
%         List<List<List<int>>> resultado = new List<List<List<int>>>();
%         List<List<int>> particionActual = new List<List<int>>();
%         GenerarParticionesRecursivo(conjunto, 0, particionActual, resultado);
%         return resultado;
%     }
% 
%     // Función recursiva para generar particiones
%     static void GenerarParticionesRecursivo(List<int> conjunto, int index, List<List<int>> particionActual, List<List<List<int>>> resultado)
%     {
%         if (index == conjunto.Count)
%         {
%             // Añadir una copia de la partición actual al resultado
%             resultado.Add(new List<List<int>>(particionActual.ConvertAll(subconjunto => new List<int>(subconjunto))));
%             return;
%         }
% 
%         // Probar añadir el elemento actual a cada subconjunto existente
%         for (int i = 0; i < particionActual.Count; i++)
%         {
%             particionActual[i].Add(conjunto[index]);
%             GenerarParticionesRecursivo(conjunto, index + 1, particionActual, resultado);
%             particionActual[i].RemoveAt(particionActual[i].Count - 1);  // Backtrack
%         }
% 
%         // Crear un nuevo subconjunto con el elemento actual
%         List<int> nuevoSubconjunto = new List<int> { conjunto[index] };
%         particionActual.Add(nuevoSubconjunto);
%         GenerarParticionesRecursivo(conjunto, index + 1, particionActual, resultado);
%         particionActual.RemoveAt(particionActual.Count - 1);  // Backtrack
%     }
% }

% Genera combinaciones de K elementos de una lista.
combination(0, _, []).
combination(K, [H|T], [H|Comb]) :- K > 0, K1 is K - 1, combination(K1, T, Comb).
combination(K, [_|T], Comb) :- K > 0, combination(K, T, Comb).

% Agrupa los elementos de un conjunto en subconjuntos disjuntos dados los tamaños de los subgrupos.
group([], [], []).
group([N|Ns], Es, [G|Gs]) :- 
    combination(N, Es, G),            % Selecciona una combinación de tamaño N de Es.
    subtract(Es, G, Rest),            % Elimina la combinación seleccionada de Es.
    group(Ns, Rest, Gs).              % Llama recursivamente para los otros tamaños.

% Prueba de agrupamiento
% Ejemplo de uso:
% ?- group([2, 1], [a, b, c, d], Groups).

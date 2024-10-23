% -------------------------------------------------------------------
%  Programa: 24.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 23 de Octubre de 2024
%  Objetivo: Lotería: Extraer N números aleatorios de un rango.
%   
% -------------------------------------------------------------------

% class Program
% {   
%     //Lotería: Extraer N números aleatorios de un rango.
% 
%     static void Lotto(int start, int finish,int cantidad){
%         
%         //Generamos la lista dentro del rango establecido
%         List<int> lista = new List<int>();
%         lista.AddRange(Enumerable.Range(start,finish+1-start));
%         
%         //Iniciamos el contador de numeros elimniados
%         int contador = 1;
% 
%         //El ciclo que se encargará de imprimir el numero a eliminar
%         // y pues eliminarlo
%         while(contador <= cantidad){
%             Random eliminado = new Random();
%             int seleccionado = eliminado.Next(0,lista.Count);
%             Console.WriteLine("Numero: {0}", lista[seleccionado].ToString());
%             lista.RemoveAt(seleccionado);
%             contador++;
%         }
%     }
% 
%     static void Main(string[] args)
%     {
%         Program.Lotto(10,50,5);
%     }
% }

% Extrae N números aleatorios de un rango dado.
% Utiliza la función range para generar la lista de números y luego selecciona aleatoriamente.
lotto(N, M, L) :- range(1, M, R), rnd_select(R, N, L).
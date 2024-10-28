% -------------------------------------------------------------------
%  Programa: 44.pl
%  Autor: Alan Paul Rodriguez Gallardo
%  Fecha: 27 de Octubre de 2024
%  Objetivo: Código Huffman.
%   
% -------------------------------------------------------------------

%using System;
%using System.Collections.Generic;
%using System.Linq;
%
%class Program
%{
%    static void Main()
%    {
%        Console.WriteLine("Ingrese la cadena para codificar usando Huffman:");
%        string input = Console.ReadLine();
%        
%        var huffman = new HuffmanCoding();
%        var huffmanCodes = huffman.BuildHuffmanTree(input);
%
%        Console.WriteLine("Códigos Huffman:");
%        foreach (var code in huffmanCodes)
%        {
%            Console.WriteLine($"{code.Key}: {code.Value}");
%        }
%
%        string encoded = huffman.Encode(input, huffmanCodes);
%        Console.WriteLine($"Texto codificado: {encoded}");
%
%        string decoded = huffman.Decode(encoded);
%        Console.WriteLine($"Texto decodificado: {decoded}");
%    }
%}
%
%public class HuffmanCoding
%{
%    private class Node
%    {
%        public char Character { get; set; }
%        public int Frequency { get; set; }
%        public Node Left { get; set; }
%        public Node Right { get; set; }
%
%        public Node(char character, int frequency)
%        {
%            Character = character;
%            Frequency = frequency;
%        }
%    }
%
%    private List<Node> nodes = new List<Node>();
%
%    public Dictionary<char, string> BuildHuffmanTree(string input)
%    {
%        // Contar frecuencias de cada carácter
%        var frequencies = input.GroupBy(c => c)
%                               .Select(g => new Node(g.Key, g.Count()))
%                               .ToList();
%
%        nodes.AddRange(frequencies);
%
%        // Construir el árbol de Huffman
%        while (nodes.Count > 1)
%        {
%            // Ordenar los nodos por frecuencia
%            nodes = nodes.OrderBy(n => n.Frequency).ToList();
%
%            // Tomar los dos nodos con menor frecuencia
%            var left = nodes[0];
%            var right = nodes[1];
%
%            // Crear un nuevo nodo con estos dos nodos como hijos
%            var parent = new Node('\0', left.Frequency + right.Frequency)
%            {
%                Left = left,
%                Right = right
%            };
%
%            // Reemplazar los nodos en la lista
%            nodes.Remove(left);
%            nodes.Remove(right);
%            nodes.Add(parent);
%        }
%
%        // Obtener el nodo raíz
%        var root = nodes.First();
%        var codes = new Dictionary<char, string>();
%        GenerateCodes(root, "", codes);
%
%        return codes;
%    }
%
%    private void GenerateCodes(Node node, string code, Dictionary<char, string> codes)
%    {
%        if (node.Left == null && node.Right == null)
%        {
%            codes[node.Character] = code;
%            return;
%        }
%
%        if (node.Left != null)
%            GenerateCodes(node.Left, code + "0", codes);
%
%        if (node.Right != null)
%            GenerateCodes(node.Right, code + "1", codes);
%    }
%
%    public string Encode(string input, Dictionary<char, string> codes)
%    {
%        return string.Concat(input.Select(c => codes[c]));
%    }
%
%    public string Decode(string encoded)
%    {
%        var current = new Node();
%        var decoded = "";
%        var currentNode = current;
%
%        foreach (var bit in encoded)
%        {
%            currentNode = (bit == '0') ? currentNode.Left : currentNode.Right;
%
%            if (currentNode.Left == null && currentNode.Right == null) // Nodo hoja
%            {
%                decoded += currentNode.Character;
%                currentNode = current; // Regresar al nodo raíz
%            }
%        }
%
%        return decoded;
%    }
}

% Importante: representa cada símbolo y su frecuencia como fr(Simbolo, Frecuencia)
% por ejemplo, fr(a, 5).

% Genera el árbol de Huffman dado un conjunto de frecuencias (Fs).
huffman(Fs, Hs) :-
    length(Fs, Len), Len > 1,
    sort(2, @=<, Fs, Sorted),          % Ordena la lista de frecuencias por la frecuencia ascendente
    huffman_tree(Sorted, Hs).

% Caso base para construir el árbol de Huffman: un solo símbolo en la lista
huffman_tree([fr(X, _) | []], hc(X, '0')). % Si hay solo un elemento, asigna el código '0'

% Construcción recursiva del árbol de Huffman
huffman_tree([fr(X1, F1), fr(X2, F2) | Rest], Hs) :-
    F3 is F1 + F2,                       % Suma las frecuencias de los dos elementos más bajos
    NewNode = fr(hc(X1, X2), F3),        % Crea un nuevo nodo combinado
    insert_sorted(NewNode, Rest, NewList), % Inserta el nuevo nodo en la lista de forma ordenada
    huffman_tree(NewList, Hs).           % Llama recursivamente para construir el árbol completo

% Inserta un elemento en una lista ordenada por la segunda posición
insert_sorted(X, [], [X]).
insert_sorted(fr(X, F1), [fr(Y, F2) | Rest], [fr(X, F1), fr(Y, F2) | Rest]) :- F1 =< F2.
insert_sorted(fr(X, F1), [fr(Y, F2) | Rest], [fr(Y, F2) | SortedRest]) :-
    F1 > F2,
    insert_sorted(fr(X, F1), Rest, SortedRest).

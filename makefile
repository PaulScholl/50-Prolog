.PHONY: all run_all clean

all: run_all

run_all: run_1	run_2	run_3	run_4	run_5	run_6	run_7	run_8	run_9	run_10	run_11	run_12	run_13	run_14	run_15	run_16	run_17	run_18	run_19	run_20	run_21	run_22	run_23	run_24	run_25	run_26	run_27	run_28	run_29	run_30	run_31	run_32	run_33	run_34	run_35	run_36	run_37	run_38	run_39	run_40	run_41	run_42	run_43	run_44	run_45	run_46	run_47	run_48	run_49	run_50
	
run_1:
	@swipl -s ../50-Prolog/1.pl -g "my_last(X,[a, b, c, d]), write('Ultimo elemento: '), write(X), nl, halt."
run_2:
	@swipl -s ../50-Prolog/2.pl -g "penultimate(X,[a, b, c, d]), write('Penultimo elemento: '), write(X), nl, halt."
run_3:
	@swipl -s ../50-Prolog/3.pl -g "element_at(X,[a, b, c, d,e,f,g,h,j,k],6), write('Elemento buscado: '), write(X), nl, halt."
run_4:
	@swipl -s ../50-Prolog/4.pl -g "list_length([a, b, c, d,e,f,g,h,j,k],X), write(X), nl, halt."
run_5:
	@swipl -s ../50-Prolog/5.pl -g "reverse_list([1, 2, 3, 4], R), write(R), nl, halt."
run_6:
	@swipl -s ../50-Prolog/6.pl -g "palindrome([1, 2, 3, 2, 1]), nl, halt."
run_7:
	@swipl -s ../50-Prolog/7.pl -g "my_flatten([1, [2, [3, 4], 5], [6, 7]], Flat), write(Flat), nl, halt."
run_8:
	@swipl -s ../50-Prolog/8.pl -g "compress([a, a, b, c, c, c, a, a, d], Result), write(Result), nl, halt."
run_9:
	@swipl -s ../50-Prolog/9.pl -g "pack([a, a, b, c, c, c, a, a, d], Result), write(Result), nl, halt."
run_10:
	@swipl -s ../50-Prolog/10.pl -g "encode([a, a, b, c, c, c, a, a, d], Result), write(Result), nl, halt."
run_11:
	@swipl -s ../50-Prolog/11.pl -g "encode_modified([a, a, b, c, c, c, a, a, d], Result), write(Result), nl, halt."
run_12:
	@swipl -s ../50-Prolog/12.pl -g "decode([[3, a], [2, b], [1, c]], R), write(R), nl, halt."
run_13:
	@swipl -s ../50-Prolog/13.pl -g "encode_direct([a, a, a, b, b, c, c, c, c, d], R), write(R), nl, halt."
run_14:
	@swipl -s ../50-Prolog/14.pl -g "dupli([a, b, c], R), write(R), nl, halt."
run_15:
	@swipl -s ../50-Prolog/15.pl -g "dupli([a, b, c], 3, R), write(R), nl, halt."
run_16:
	@swipl -s ../50-Prolog/16.pl -g "drop([a, b, c, d, e, f, g, h], 3, R), write(R), nl, halt."
run_17:
	@swipl -s ../50-Prolog/17.pl -g "split([a, b, c, d, e, f], 3, L1, L2),write('Lista 1: '), write(L1),write(' Lista 2: '),write(L2), nl, halt."
run_18:
	@swipl -s ../50-Prolog/18.pl -g "slice([a, b, c, d, e, f], 2, 3, R), write(R), nl, halt."
run_19:
	@swipl -s ../50-Prolog/19.pl -g "rotate([a, b, c, d, e], 2, R), write(R), nl, halt."
run_20:
	@swipl -s ../50-Prolog/20.pl -g "remove_at(X, [a, b, c, d, e], 3, R), write(R), nl, halt."
run_21:
	@swipl -s ../50-Prolog/21.pl -g "insert_at(a, [b, c, d], 2, R), write(R), nl, halt."
run_22:
	@swipl -s ../50-Prolog/22.pl -g "range(3, 6, R), write(R), nl, halt."
run_23:
	@swipl -s ../50-Prolog/23.pl -g "rnd_select([a, b, c, d, e], 3, R), write(R), nl, halt."
run_24:
	@swipl -s ../50-Prolog/24.pl -g "lotto(5, 49, L), write(L), nl, halt."
run_25:
	@swipl -s ../50-Prolog/25.pl -g "rnd_permu([a, b, c, d], P), write(P), nl, halt."
run_26:
	@swipl -s ../50-Prolog/26.pl -g "combination(2, [a, b, c], Comb), write(Comb), nl, halt."
run_27:
	@swipl -s ../50-Prolog/27.pl -g "group([a, b, c, d, e], [2, 3], Groups), write(Groups), nl, halt."
run_28:
	@swipl -s ../50-Prolog/28.pl -g "lsort([[a, b, c], [d], [e, f, g, h], [i, j]], Sorted), write(Sorted), nl, halt."
run_29:
	@swipl -s ../50-Prolog/29.pl -g "length_frequency([[a, b], [c], [d, e, f], [g], [h, i]], F), write(F), nl, halt."
run_30:
	@swipl -s ../50-Prolog/30.pl -g "is_prime(7), nl, halt."
run_31:
	@swipl -s ../50-Prolog/31.pl -g "gcd(48, 18, G), write(G), nl, halt."
run_32:
	@swipl -s ../50-Prolog/32.pl -g "coprime(14, 15), nl, halt."
run_33:
	@swipl -s ../50-Prolog/33.pl -g "totient(12, Phi), write(Phi), nl, halt."
run_34:
	@swipl -s ../50-Prolog/34.pl -g "prime_factors(60, L), write(L), nl, halt."
run_35:
	@swipl -s ../50-Prolog/35.pl -g "prime_factors_mult(28, L), write(L), nl, halt."
run_36:
	@swipl -s ../50-Prolog/36.pl -g "totient_improved(10, Phi), write(Phi), nl, halt."
run_37:
	@swipl -s ../50-Prolog/37.pl -g "?- compare_totient(10), nl, halt."
run_38:
	@swipl -s ../50-Prolog/38.pl -g "?- prime_list(1, 20, Primes), write(Primes), nl, halt."
run_39:
	@swipl -s ../50-Prolog/39.pl -g "goldbach(28, [P1, P2]), nl, halt."
run_40:
	@swipl -s ../50-Prolog/40.pl -g "goldbach_list(4, 20, L), write(L), nl, halt."
run_41:
	@swipl -s ../50-Prolog/41.pl -g "table(A, B, (A, B)), nl, halt."
run_42:
	@swipl -s ../50-Prolog/42.pl -g "table(A, B, and(A, B)), nl, halt."
run_43:
	@swipl -s ../50-Prolog/43.pl -g "gray(3, C), write(C), nl, halt."
run_44:
	@swipl -s ../50-Prolog/44.pl -g "huffman([fr(a, 5), fr(b, 9), fr(c, 12), fr(d, 13), fr(e, 16), fr(f, 45)], Hs), nl, halt."
run_45:
	@swipl -s ../50-Prolog/45.pl -g "istree(t(1, t(2, nil, nil), t(3, nil, nil))), nl, halt."
run_46:
	@swipl -s ../50-Prolog/46.pl -g "cbal_tree(7, T), nl, halt."
run_47:
	@swipl -s ../50-Prolog/47.pl -g "symmetric(t('x', t('x', nil, nil), t('x', nil, nil))), nl, halt."
run_48:
	@swipl -s ../50-Prolog/48.pl -g "construct([3, 1, 4, 1, 5, 9, 2, 6, 5], T), nl, halt."
run_49:
	@swipl -s ../50-Prolog/49.pl -g "sym_cbal_trees(4, Trees), nl, halt."
run_50:
	@swipl -s ../50-Prolog/50.pl -g "hbal_tree(3, T), nl, halt."

# ... Repite para los demás programas hasta run_programa10

clean:
	@echo "Limpiando archivos generados..."
	@rm -f *.o

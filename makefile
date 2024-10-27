.PHONY: all run_all clean

all: run_all

run_all: run_1	run_2	run_3	run_4	run_5	run_6	run_7	run_8	run_9	run_10	run_11

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
	@swipl -s ../50-Prolog/8.pl -g "compress([a, a, b, c, c, c, a, a, d], Result), wirte(Result), nl, halt."
run_9:
	@swipl -s ../50-Prolog/9.pl -g "pack([a, a, b, c, c, c, a, a, d], Result), write(Result), nl, halt."
run_10:
	@swipl -s ../50-Prolog/10.pl -g "encode([a, a, b, c, c, c, a, a, d], Result), write(Result), nl, halt."
run_11:
	@swipl -s ../50-Prolog/10.pl -g "encode_modified([a, a, b, c, c, c, a, a, d], Result), write(Result), nl, halt."
run_12:
run_13:
run_14:
run_15:
run_16:
run_17:
run_18:
run_19:
run_20:
run_21:
run_22:
run_23:
run_24:
run_25:
run_26:
run_27:
run_28:
run_29:
run_30:
run_31:
run_32:
run_33:
run_34:
run_35:
run_36:
run_37:
run_38:
run_39:
run_40:
run_41:
run_42:
run_43:
run_44:
run_45:
run_46:
run_47:
run_48:
run_49:
run_50:

# ... Repite para los demás programas hasta run_programa10

clean:
	@echo "Limpiando archivos generados..."
	@rm -f *.o
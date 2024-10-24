.PHONY: all run_all clean

all: run_all

run_all: run_1	run_2

run_1:
	@swipl -s ../src/1.pl -g "my_last(X,[a, b, c, d]), write('Ultimo elemento: '), write(X), nl, halt."

run_2:
	@swipl -s ../src/2.pl -g "penultimate(X,[a, b, c, d]), write('Penultimo elemento: '), write(X), nl, halt."

# ... Repite para los demás programas hasta run_programa10

clean:
	@echo "Limpiando archivos generados..."
	@rm -f *.o
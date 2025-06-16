all: bin/jogo

bin/jogo: obj/main.o obj/funcoes.o
	gcc -m32 obj/main.o obj/funcoes.o -o bin/jogo

obj/main.o: src/main.asm src/biblioteca.asm
	mkdir -p obj
	nasm -f elf32 src/main.asm -o obj/main.o

obj/funcoes.o: src/funcoes.c
	mkdir -p obj
	gcc -m32 -Wall -c src/funcoes.c -o obj/funcoes.o

run: bin/jogo
	./bin/jogo

clean:
	rm -rf obj bin

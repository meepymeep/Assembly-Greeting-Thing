all:
	nasm -f elf64 -o main.o main.asm
	ld main.o -o main
	$(RM) main.o
clean:
	$(RM) main
build_stackex:
	@ echo "!====== Building Stack Example"
	nasm stack.asm -f bin -o stack.bin 
	@ echo "!====== Running Machine"
	qemu-system-x86_64 stack.bin

hexadecimal:
	od -t x1 -A n stack.bin

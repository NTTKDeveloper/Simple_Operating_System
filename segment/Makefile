build_bootsect: 
	@ echo "!====== Building Boot Sector"
	nasm ./segment.asm -f bin -o ./segment.bin
	@ echo "!====== Running Machine"
	qemu-system-x86_64 ./segment.bin

hexadecimal: build_bootsect
	od -t x1 -A n segment.bin

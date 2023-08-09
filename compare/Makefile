build_bootsect:
	@ echo "!====== Building Boot Sector"
	nasm compare.asm -f bin -o compare.bin
	@ echo "!====== Running Machine"
	qemu-system-x86_64 compare.bin

hexadecimal:
	od -t x1 -A n compare.bin

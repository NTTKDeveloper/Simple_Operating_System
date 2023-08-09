boot_sect.bin: 
	@ echo "!====== Building Boot Sector"
	nasm boot_sect.asm -f bin -o boot_sect.bin

hexadecimal: boot_sect.bin 
	od -t x1 -A n boot_sect.bin

kernel.bin: 
	gcc -ffreestanding -fshort-wchar -c ./kernel/kernel.c -o ./kernel/kernel.o
	@ echo "!====== Linking"
	ld -T ./kernel/kernel.ld ./kernel/kernel.o --oformat binary -static -Bsymbolic -nostdlib -o ./kernel/kernel.bin
# 	ld -o ./kernel/kernel.bin -Ttext 0x1000 ./kernel/kernel_entry.o ./kernel/kernel.o -melf_i386

os-image.bin: kernel.bin boot_sect.bin 
	cat ./boot_sect.bin ./kernel/kernel.bin > os-image.bin

run: os-image.bin
	@ echo "!====== Running Machine"
	qemu-system-x86_64 -boot a -fda ./os-image.bin #-boot a = floppy disk a

clean:
	rm *.bin ./kernel/*.o

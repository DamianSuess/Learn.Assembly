# Entering Long Mode - Simple Examples
by Tomasz Grysztar

While playing with the 64-bit machine I wrote some samples that may be the simplest available examples of entering the long mode. The file SIMPLE.ASM contains the smallest one, which enters long mode without re-enabling interrupts and thus saves on setting up the IDT. The BASECODE.ASM contains the extended version of this sample, which sets up the interrupts and alters two characters on the screen according to the clock and keyboard events, to show that everything's working (and reboots on the Esc key).

To run those samples it's enough to load them somehow at 0:1600h address and jump there (also some other zero-based address may be used, it's enough to alter the ORG directive in the beginning of sources). The PetroffHeroj's FAT12 boot loader is a simple option if you want to boot from floppy.

For examples to run correctly, the color text mode has to be enabled (you may just add "mov ax,3"/"int 10h" at the beginning of code to ensure this). The samples are also not caring about disabling NMI et caetera - they assume that such things should not interfere in normal environment.

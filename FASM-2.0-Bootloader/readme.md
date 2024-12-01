# Bootloader Example

## Requirements

* Flat Assembler
* [QEMU](https://www.qemu.org/download/)

## Building

1. `fasm boot.asm`
   * Outputs: `boot.bin`
2. Launch
  * `qemu-system-i386 -boot a -fda ./boot.bin`
  * `qemu-system-i386w -boot a -fda ./boot.bin`  (Windows mode)

## References

* [Building an x86 Bootloader with FASM](https://www.youtube.com/watch?v=KmYUjDkEeWA&list=PLS2yupFOUwOOPUJWsqP5sF-szi_P58ZKP&index=9)
* https://github.com/nikolaospanagopoulos/tutorialBootloader

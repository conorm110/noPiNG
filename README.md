![noPiNG readme logo](img/logo.PNG "(no)PiNG")
**Pong in assembly for running on real hardware or an emulator made for the Outernet Hackathon**
- VESA Graphics (480p 16C)
- Keyboard handled with DOS interrupts 
- Everything in NASM assembly
- Less than 1KB
- Just about as offline as it gets

## Downloads
[Bootable i386 Version]() *(compatible with x86_64, uses FreeDOS)*

[.COM executable]() *(Natively works on 16 bit MS DOS systems, compatible with DOSBOX)*

## Building from Source
```
C:\parentDir\> cd noPiNG
C:\parentDir\noPiNG> build
     C:\parentDir\noPiNG> cd src
     C:\parentDir\noPiNG\src> nasm main.asm -fbin -o ../bin/out.com
     C:\parentDir\noPiNG\src> pause
   Press any key to continue . . .
     C:\parentDir\noPiNG\src> cd ../bin
     C:\parentDir\noPiNG\src> dosbox out.com
```
* DOSBox Will Open in Separate Window, .COM is in noPiNG/bin
    * Use CTRL + F11/F12 to slow down/speed up game
* Use [rufus](https://rufus.ie/en/) to make bootable for most systems

![noPiNG gameplay image](img/gameplay.PNG)

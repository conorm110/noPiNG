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

## Gameplay
![noPiNG gameplay image](img/gameplay.PNG)
```
C:\parentDir\noPiNG\> run
```
* Its PONG, movement keys are W and S
* Because we are runing directly on hardware (no PS2 controller, interupts only) and in 1980 nobody cared to add a repeat delay speed on keyboards of 0ms so controlls can be funky
* If the controls are too diffictult/too easy, the .data section in main.asm contains some constants that can make gameplay easier/harder (ie left_paddle_size, right_paddle_size, game_speed, ball_velocity)
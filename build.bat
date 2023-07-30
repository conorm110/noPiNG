cd src
nasm main.asm -fbin -o ../bin/out.com
pause
cd ../bin
dosbox out.com
cd ..

all: compile exe

compile:
	gcc -o main.exe main.c

exe:
	@echo "Ejecutando all.bat..."
	call all.bat

clean:
	del main.exe *.bin*

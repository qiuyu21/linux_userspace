CC = gcc
CFLAGS  = -g -Wall -Wno-error=deprecated-declarations

program: main.o get_num.o error_functions.o 
	$(CC) $(CFLAGS) -o program main.o get_num.o error_functions.o 

main.o: main.c tlpi_hdr.h 
	$(CC) $(CFLAGS) -c main.c

get_num.o: get_num.c get_num.h
	$(CC) $(CFLAGS) -c get_num.c 

error_functions.o: error_functions.c error_functions.h tlpi_hdr.h ename.c.inc
	$(CC) $(CFLAGS) -c error_functions.c 

clean: 
	$(RM) *.o *~ program


# CC = gcc
# CFLAGS  = -g -Wall -Wno-error=deprecated-declarations

# objects = main.o get_num.o error_functions.o file_perms.o curr_time.o

# program: $(objects)
# 	$(CC) $(CFLAGS) -o main $(objects)

# main.o: main.c tlpi_hdr.h
# 	$(CC) $(CFLAGS) -c main.c

# get_num.o: get_num.c get_num.h
# 	$(CC) $(CFLAGS) -c get_num.c 

# error_functions.o: error_functions.c error_functions.h tlpi_hdr.h ename.c.inc
# 	$(CC) $(CFLAGS) -c error_functions.c 

# file_perms.o: file_perms.c file_perms.h
# 	$(CC) $(CFLAGS) -c file_perms.c

# curr_time.o: curr_time.c curr_time.h
# 	$(CC) $(CFLAGS) -c curr_time.c

# clean: 
# 	$(RM) *.o *~ 

CC = gcc
CFLAGS  = -g -Wall -Wno-error=deprecated-declarations
VPATH = src
CPPFLAGS = -I include

program: main.o get_num.o error_functions.o file_perms.o curr_time.o
	$(CC) $(CFLAGS) -o $@ $^

main.o: main.c include/tlpi_hdr.h 
	$(CC) $(CFLAGS) $(CPPFLAGS) -pthread -c $<

get_num.o: get_num.c include/get_num.h 
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $<

error_functions.o: error_functions.c ename.c.inc include/error_functions.h include/tlpi_hdr.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< 

file_perms.o: file_perms.c include/file_perms.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $<

curr_time.o: curr_time.c include/curr_time.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $<

.PHONY:clean
clean: 
	$(RM) *.o *~ 


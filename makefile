CC=gcc
CFLAGS=-I.

all: parallel_min_max zombie process_memory parallel_sum

parallel_sum : utils.o utils.h 
	$(CC) -g -pthread -o task5 utils.o parallel_sum.c $(CFLAGS)

task3 : process_memory.c
	$(CC) -o task3 process_memory.c $(CFLAGS)

task2 : zombieIns.c
	$(CC) -o task2zombie zombieIns.c $(CFLAGS)

parallel_min_max : utils.o find_min_max.o utils.h find_min_max.h
	$(CC) -o parallel_min_max utils.o find_min_max.o parallel_min_max.c $(CFLAGS)

utils.o : utils.h
	$(CC) -o utils.o -c utils.c $(CFLAGS)

find_min_max.o : utils.h find_min_max.h
	$(CC) -o find_min_max.o -c find_min_max.c $(CFLAGS)

clean :
	rm utils.o find_min_max.o parallel_min_max task3 task2zombie task5
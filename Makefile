OBJS = main.o student.o class.o
CPPFLAGS = -g -Wall -I ~/Documents/learn_makefile/headers
# LDFLAGS = 
CC = g++
VPATH = src : headers
# or use the following method
# vpath %.cpp src
# vpath %.h headers

register : $(OBJS)
	$(CC) -o register $(OBJS)

main.o : class.h student.h
	$(CC) $(CPPFLAGS) -c src/main.cpp 
student.o : student.h
	$(CC) $(CPPFLAGS) -c src/student.cpp
class.o : class.h
	$(CC) $(CPPFLAGS) -c src/class.cpp 

.PHONY : clean
clean :
	-rm register $(wildcard *.o)

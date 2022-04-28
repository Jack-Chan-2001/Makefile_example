This is my first Makefile.



[toc]

# reference

[CS193 g++ and make Guide](https://web.stanford.edu/class/cs193d/handouts/make.pdf)

[跟我一起写Makefile](https://seisman.github.io/how-to-write-makefile/overview.html)



# 通配符

一共有三个，分别是`*`, `?`, `~`

展开通配符`*`

```makefile
$(wildcard *.o)
```



# 文件搜寻

由特殊变量`VPATH`实现。





# Example

```
/home/jack/Documents/learn_makefile/
.
├── Makefile
├── headers
│   ├── class.h
│   └── student.h
└── src
    ├── class.cpp
    ├── main.cpp
    └── student.cpp
```

## 01 basic

```makefile
objects = main.o student.o class.o

VPATH = src : headers
# or use the following method
# vpath %.cpp src
# vpath %.h headers

register : $(objects)
	g++ -o register $(objects)

main.o : main.cpp class.h student.h
	g++ -c src/main.cpp -I ~/Documents/learn_makefile/headers
student.o : student.cpp student.h
	g++ -c src/student.cpp -I ~/Documents/learn_makefile/headers
class.o : class.cpp class.h
	g++ -c src/class.cpp -I ~/Documents/learn_makefile/headers

.PHONY : clean
clean :
	-rm register $(wildcard *.o)

```



## 02 Add CPPFLAGS (complier options) Omit the obvious (make knows .cpp -> .o)

```makefile
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

```


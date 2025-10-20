CC = gcc
CFLAGS = -I./include
OBJ = obj/mystrfunctions.o obj/main.o
TARGET = bin/client

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET)

obj/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f obj/*.o $(TARGET)
static:
	ar rcs lib/libmyutils.a obj/mystrfunctions.o
	$(CC) obj/main.o -L./lib -lmyutils -o bin/client_static
dynamic:
	$(CC) -fPIC -I./include -c src/mystrfunctions.c -o obj/mystrfunctions.o
	$(CC) -shared -o lib/libmyutils.so obj/mystrfunctions.o
	$(CC) -I./include src/main.c -L./lib -lmyutils -o bin/client_dynamic

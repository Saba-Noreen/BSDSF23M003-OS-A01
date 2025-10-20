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

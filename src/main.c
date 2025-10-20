#include <stdio.h>
#include "../include/mystrfunctions.h"

int main() {
    char src[] = "Operating System - Module 1";
    char dest[50];
    printf("String length: %d\n", mystrlen(src));
    mystrcpy(dest, src);
    printf("Copied string: %s\n", dest);
    return 0;
}

// main.c
#include "../utils/path_util.h"
#include <stdio.h>

int main() {
  /* FILE *fptr; */

  /* fptr = fopen("input.txt", "r"); */

  /* char myString[100]; */

  /* while (fgets(myString, 100, fptr)) { */
  /*   printf("%s", myString); */
  /* }; */

  /* fclose(fptr); */
  printf("Hello, world!");
  printf("%s", get_executable_path());
}

#include <stdlib.h>
#include <stdio.h>

int main() {
    int i;
    int n;
    short *my_arr;
    FILE *f;
    
    f = fopen("FluidR3_GM.sf2", "rb");
    if (!f) {
      printf("Fail.\n");
      return -1;
    }
    my_arr = (short *)malloc(74199153 * 2);
    printf("Open.\n");
    n = fread(my_arr, 2, 74199153, f);
    printf("%d\n", n);
    printf("%d\n", my_arr[0]);
    printf("%d\n", my_arr[4567]);
    free(my_arr);
    return 0;
}

#include <stdio.h>

int main(){
    int array1[20] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}; 
    int array2[20], tam = 20;

    for(int i = 0; i < tam; i++){
        array2[i] = array1[i];
    }

    printf("%s", "Array 2 apos a transferencia: ");
    printf("%s", "{");
    for(int i = 0; i < tam; i++){
        if(i != (tam-1))
            printf("%d%s", array2[i], ", ");
        else
            printf("%d", array2[i]);
    }
    printf("%s", "}");
} 
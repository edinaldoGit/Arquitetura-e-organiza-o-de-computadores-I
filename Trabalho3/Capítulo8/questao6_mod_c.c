#include <stdio.h>

void bubbleSort(int[], int);

int main() {
    int array[] = {4, 5, 9, 7, 1, 2, 6, 3, 10, 8};

    int n = 10;

    bubbleSort(array, n);
    printf("Array ordenado: \n");

    for (int i = 0; i < n; i++) {
        printf("%d ", array[i]);
    }

    return 0;
}

void bubbleSort(int array[], int n) {
    int i, j;
    int trocado;
    for (i = 0; i < n - 1; i++) {
        trocado = 0;
        for (j = 0; j < n - i - 1; j++) {
            if (array[j] > array[j + 1]) {
                int temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
                trocado = 1;
            }
        }

        if (trocado == 0) {
            break;
        }
    }
}

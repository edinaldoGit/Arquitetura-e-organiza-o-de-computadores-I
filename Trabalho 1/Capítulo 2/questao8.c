#include <stdio.h>

int main(){
    int num1, num2;

    printf("%s", "Enter a number: ");
    scanf("%d", &num1);

    printf("%s", "Enter a number: ");
    scanf("%d", &num2);

    printf("\n%s\n%d\n%d", "Numbers", num1, num2);
}
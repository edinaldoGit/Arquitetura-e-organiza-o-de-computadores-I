#include <stdio.h>
int main() {
    
    int x, y, z;
    
    printf("Enter a number: "); 
    scanf("%i", &x);
    
    printf("Enter a larger number: "); 
    scanf("%i", &y);
    
    printf("Enter an even larger\nnumber: "); 
    scanf("%i", &z);
    
    printf("\n");
    
   
    printf("%i", x);
    printf(" < ");
    printf("%i", y);
    printf(" < ");
    printf("%i", z);
 
    printf("\n\n%i", z);
    printf(" > ");
    printf("%i", y);
    printf(" > ");
    printf("%i", x);
    
    
}

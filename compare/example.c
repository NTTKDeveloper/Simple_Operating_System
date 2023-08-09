#include <stdio.h>

int main(){
    int ax = 4;
    int bx;
    // Logic cover in asembly 
    if(ax == 4){
        bx = 23;
    }else{
        bx = 45;
    }
    //
    printf("%d\n", ax);
    printf("%d\n", bx);
    return 0;
}

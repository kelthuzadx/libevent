#include <stdarg.h>
#include <stdio.h>

void printWrapper(char * fmt,...){
    va_list ap;

    va_start(ap, fmt);
    vfprintf(stdout,fmt , ap);
    va_end(ap);
}

long long summer(int num,...){
    int sum = 0;
    va_list ap;
    va_start(ap,num);
    for(int i =0;i<num;i++){
        sum += va_arg(ap,int);
    }
    va_end(ap);
    return sum;
}

int main(){
    long long res = summer(5,1,2,3,4,5);
    long long res2 = summer(3,1,2,3);
    printWrapper("%I64d %I64d\n",res,res2);

    return 0;
}



#include <event-internal.h>
#include <stdio.h>

int main(){
    printf("%d bytes", (int) sizeof(struct event_base));
    return 0;
}
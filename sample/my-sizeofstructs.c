#include <event-internal.h>
#include <stdio.h>
#pragma pack(1)

int main(){
    printf("aligned %d bytes\n", (int) sizeof(struct event_base));
	return 0;
}
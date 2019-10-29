#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

const int iterations = 10000000;

void itoa(int64_t i, char b[]) {
    char *p = b;

    if(i<0) {
        *p++ = '-';
        i *= -1;
    }

    int64_t shifter = i;

    do{ //Move to where representation ends
        ++p;
        shifter = shifter/10;
    } while(shifter);

    *p = '\0';

    do{ //Move back, inserting digits as u go
        *--p = i%10 + 0x30;
        i /= 10;
    } while(i);
}

int main() {
	int64_t value = 123456789123456789;
	char buffer[20];

	for(int i = 0; i < iterations; i++) {
		itoa(value, buffer);
	}

	printf("%s", buffer);
	return 0;
}

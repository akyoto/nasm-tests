#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

const int iterations = 100000000;

void itoa(int64_t value, char *p) {
	if(value < 0) {
		*p++ = '-';
		value *= -1;
	}

	int64_t shifter = value;

	do {
		++p;
		shifter = shifter / 10;
	} while(shifter);

	*p = '\0';

	do {
		*--p = value % 10 + 0x30;
		value /= 10;
	} while(value);
}

int main() {
	char buffer[20];

	for(int64_t i = 0; i < iterations; i++) {
		itoa(i, buffer);
	}

	printf("%s", buffer);
	return 0;
}

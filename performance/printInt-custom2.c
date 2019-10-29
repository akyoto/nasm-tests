#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

const int iterations = 10000000;

void itoa(int64_t value, char *p) {
	char *start = p;

	if(value < 0) {
		*p = '-';
		p++;
		start++;
		value *= -1;
	}

	do {
		*p = value % 10 + 0x30;
		value /= 10;
		p++;
	} while(value);

	*p = '\0';
	p--;

	do {
		char a = *start;
		char b = *p;
		*start = b;
		*p = a;
		start++;
		p--;
	} while(p > start);
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

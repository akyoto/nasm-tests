#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

const int iterations = 10000000;

int main() {
	int64_t value = 123456789123456789;
	char buffer[20];

	for(int i = 0; i < iterations; i++) {
		sprintf(buffer, "%ld", value);
	}

	printf("%s", buffer);
	return 0;
}
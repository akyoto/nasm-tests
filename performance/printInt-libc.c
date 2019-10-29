#include <stdio.h>
#include <stdlib.h>

const int iterations = 10000000;

int main() {
	int value = 1023;
	char buffer[33];

	for(int i = 0; i < iterations; i++) {
		sprintf(buffer, "%d", value);
	}

	printf("%s", buffer);
	return 0;
}
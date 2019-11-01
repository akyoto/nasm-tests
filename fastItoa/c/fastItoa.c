#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

const int maxDigits = 32;
const int64_t iterations = 100000000;

static const uint8_t guessLog10[65] = {
	19, 18, 18, 18, 18, 17, 17, 17, 16, 16,
	16, 15, 15, 15, 15, 14, 14, 14, 13, 13,
	13, 12, 12, 12, 12, 11, 11, 11, 10, 10,
	10, 9, 9, 9, 9, 8, 8, 8, 7, 7,
	7, 6, 6, 6, 6, 5, 5, 5, 4, 4,
	4, 3, 3, 3, 3, 2, 2, 2, 1, 1,
	1, 0, 0, 0, 0,
};

static const uint64_t powersOf10[20] = {
	1u,
	10u,
	100u,
	1000u,
	10000u,
	100000u,
	1000000u,
	10000000u,
	100000000u,
	1000000000u,
	10000000000u,
	100000000000u,
	1000000000000u,
	10000000000000u,
	100000000000000u,
	1000000000000000u,
	10000000000000000u,
	100000000000000000u,
	1000000000000000000u,
	10000000000000000000u,
};

int itoa(int64_t signedNum, char *p) {
	char *start = p;
	uint64_t num;

	if(signedNum < 0) {
		*p = '-';
		p++;
		num = -signedNum;
	} else {
		num = signedNum;
	}

	int leadingZeros = __builtin_clzll(num);
	uint8_t guess = guessLog10[leadingZeros];
	uint64_t powerOf10 = powersOf10[guess];

	if(num >= powerOf10) {
		guess++;
	}

	p += guess;
	int length = p - start;
	*p = '\0';
	p--;

	do {
		*p = (num % 10) + 0x30;
		num /= 10;
		p--;
	} while(num > 0);

	return length;
}

int main() {
	char buffer[maxDigits];

	for(int64_t i = iterations; i != 0; i--) {
		itoa(i, buffer);
	}

	printf("%s", buffer);
	return 0;
}

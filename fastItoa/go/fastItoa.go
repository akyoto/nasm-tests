package main

import (
	"fmt"
	"math/bits"
)

const (
	maxDigits  = 32
	iterations = int64(100000000)
)

var (
	guessLog10 = []byte{
		19, 18, 18, 18, 18, 17, 17, 17, 16, 16,
		16, 15, 15, 15, 15, 14, 14, 14, 13, 13,
		13, 12, 12, 12, 12, 11, 11, 11, 10, 10,
		10, 9, 9, 9, 9, 8, 8, 8, 7, 7,
		7, 6, 6, 6, 6, 5, 5, 5, 4, 4,
		4, 3, 3, 3, 3, 2, 2, 2, 1, 1,
		1, 0, 0, 0, 0,
	}

	powersOf10 = []uint64{
		1,
		10,
		100,
		1000,
		10000,
		100000,
		1000000,
		10000000,
		100000000,
		1000000000,
		10000000000,
		100000000000,
		1000000000000,
		10000000000000,
		100000000000000,
		1000000000000000,
		10000000000000000,
		100000000000000000,
		1000000000000000000,
		10000000000000000000,
	}
)

func main() {
	buffer := [maxDigits]byte{}
	n := 0

	for i := iterations; i != 0; i-- {
		n = itoa(i, buffer[:])
	}

	fmt.Println(string(buffer[:n]))
}

func itoa(signedNum int64, buffer []byte) int {
	var num uint64
	index := 0

	if signedNum < 0 {
		num = uint64(-signedNum)
		buffer[index] = '-'
		index++
	} else {
		num = uint64(signedNum)
	}

	leadingZeros := bits.LeadingZeros64(num)
	guess := guessLog10[leadingZeros]
	closestPowerOf10 := powersOf10[guess]

	if num >= closestPowerOf10 {
		guess++
	}

	index += int(guess)
	length := index
	index--

	for {
		buffer[index] = byte(num%10) + 0x30
		num /= 10
		index--

		if num == 0 {
			return length
		}
	}
}

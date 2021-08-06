#include <stdio.h>

int main(void) {
	int *z, t;

	t = 3;
	z = &t;
	t = 4;
	printf("%d", *z);
}

int main(){
	int i=0, max=10000;
	int i6 = 0;
	int i7;

	while (1) {
		if (isprime1(i)) {
			i7 = i;
			i6++;
		}
		i++;
		if (i==max){
			break;
		}
	}

	printf("N primes calculated to %d is %d\nlast is: %d\n",max,i6,i7);

}

int isprime1(int input)
{
	int n;

	if (input < 1) {
		return 0;
	}
	n = input - 1;

	while (n > 1){
		if (input%n == 0) return 0;
		n--;
	}
	return 1;
}


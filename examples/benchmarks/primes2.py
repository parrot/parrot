import os,sys
def isprime1(input):
    if input < 1:
	return 0

    n = input-1

    while n > 1:
	if input%n == 0:
	    return 0
	n = n - 1

    return 1

def main():
    i = 0
    l = 0
    i6 = 0
    i7 = 0
    max = 10000

    while 1:

	if isprime1(i):
	    i6 = i6 + 1
            i7 = i
	i = i + 1
	if i == max:
	    break

    print "N primes calculated to ",max, i6
    print "last is:", i7

if __name__ == "__main__":
    main()

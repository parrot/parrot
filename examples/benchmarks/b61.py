def main():
    L = [1]*1000000
    L[-1] = 42
    n = 0
    for i in L:
        n += i
    print n	

if __name__ == '__main__':
    main()

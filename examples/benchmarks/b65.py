def main():
    d = dict.fromkeys(xrange(1000000))
    n = 0
    for i in d:
        n += i
    print n

if __name__ == '__main__':
    main()

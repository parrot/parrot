#! ruby

i6 = 0
i7 = 0
max = 5000

def is_prime(n)
	if n < 1
		return false
	end

	(n-1).downto(2) { |i|
		if n % i == 0
			return false
		end
	}
	true
end

max.times { |i|
	if is_prime i
		i6 += 1
		i7 = i
	end
}
puts "# of primes calculated to #{max}: #{i6}"
puts "last is: #{i7}"


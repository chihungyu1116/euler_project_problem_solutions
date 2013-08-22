# problem 7
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10 001st prime number?

# 2 is the only even and prime number
# what is the faster way other than start from 1 and check if it's prime one at a time

include Math

def is_prime val
	bound = sqrt(val).to_i + 1

	return false if val%2 == 0

	for i in (3...bound).step(2)
		return false if val%i == 0
	end

	true
end

def get_nth_prime nth
	counter = 1
	val = 3
	while counter != nth
		counter += 1 if is_prime val
		val += 2
	end

	puts val-2
end


get_nth_prime 10001

puts is_prime 103
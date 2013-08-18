# problem 3
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?



include Math

def find_max_prime num
	primes = []
	bound_max = sqrt(num).to_i
	bound_min = 2
	check_list = (2...(bound_max+1)).to_a

	while check_list.size > 0
		val = counter = check_list[0]

		# if val can divid num fully
		if num%val == 0
			primes << val
			num /= val
			# divid num until it cannot be divid by val
			while num%val == 0
				num /= val
			end

			last = check_list[-1]

			# remove all multiples, optimizely by not incrementing 1 at a time
			while counter <= last
				check_list.delete counter
				counter += val
			end
		else # if not remove it since its not a factor of num
			check_list.delete val
		end

		primes << num if check_list.size == 0
	end

	puts primes
end


find_max_prime 600851475143
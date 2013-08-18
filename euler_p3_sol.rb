# problem 3
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

include Math

def remove_multiple_from_array num, arr
	bound = arr[-1]
	counter = num
	return [] if bound.nil?

	while counter < bound
		arr.delete counter
		counter += num
	end
	arr
end

def find_prime num
	result = []
	bound = sqrt(num).to_i
	# list of number to check, 2 is the smallest prime number
	check_list = (2...(bound+1)).to_a

	while check_list.size > 0
		counter = current = check_list[0]
		last = check_list[-1]
		
		# remove all multiples in the check_list
		while counter <= bound
			check_list.delete counter
			counter += current
		end

		result << current if num%current == 0
	end

	result = result.size == 0 ? [num] : result
	puts result.max
end

result = find_prime 600851475143

# problem 10
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.


include Math

def is_prime val_target
	return false if val_target%2 == 0 # if it's even number then it's not a prime number since we already include 2
	bound = sqrt(val_target).to_i
	range = (3...(bound+1))

	range.step(2).each do |val| # 3, 5, 7, 9, 11...
		return false if val_target%val == 0
	end

	true
end

def calculate_prime_sum_under bound
	total = 2
	checklist = {}
	range = (3...(bound+1))
	range.step(2).each do |val|
		if checklist[val].nil? # only run is prime if checklist is not set
			if is_prime val 
				total += val # add prime value
				checklist[val] = true
			else 
				checklist[val] = false
			end

			
			temp = val + val

			while temp <= bound # use to avoid val's multiple running is_prime
				checklist[temp] = false
				temp += val
			end
		end
	end
	total
end

puts calculate_prime_sum_under 2000000
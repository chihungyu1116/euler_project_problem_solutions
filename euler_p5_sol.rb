# problem 5
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?


# if n can be divid by x evenly then all the factors of x can divid n evenly
# [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
# find the largest common factors
include Math

def get_factors n
	bound_max = sqrt(n).to_i + 1
	bound_min = 2
	factors = {}
	raw_n = n
	for i in (bound_min...(bound_max+1))
		factors[i] = 0
		while n%i == 0
			n/=i
			factors[i]+=1
		end
	end

	factors[raw_n] = 1 if raw_n == n
	factors
end


def get_min_divisible_num n
	common_factors = {}
	bound_max = n
	bound_min = 2

	for i in (bound_min...(bound_max+1))
		common_factors[i] = 0
		factors = get_factors i

		factors.each do |key,val|
			common_factors[key] = val if val > common_factors[key]
		end
	end
	
	total = 1
	common_factors.each do |key,val|
		if val != 0
			product = key**val
			total *= product
		end
	end
	total
end

puts get_min_divisible_num 20
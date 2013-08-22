# problem 6
# The sum of the squares of the first ten natural numbers is,
# 1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.



def difference
	bound = 100
	sum_square = 0
	square_sum = 0
	(1...(bound+1)).each do |val|
		sum_square += val
		square_sum += val**2 
	end

	puts sum_square**2 - square_sum
end


difference


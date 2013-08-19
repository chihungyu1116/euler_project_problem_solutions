# problem 1
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

multiple_1 = 3
multiple_2 = 5
multiple_3 = multiple_1*multiple_2

def collect_multiples multiple
	result = []
	counter = multiple
	bound = 1000
	while counter < bound
		result << counter
		counter += multiple
	end
	result
end

result_1 = collect_multiples multiple_1
result_2 = collect_multiples multiple_2
result_3 = collect_multiples multiple_3

result_2 = result_2 - result_3
result = result_1 + result_2

sum = 0
result.each do |val|
	sum+=val
end

puts sum

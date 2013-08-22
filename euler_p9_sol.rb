# problem 9
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

# since a < b and a^2 + b^2 = c^2
# a + b + c = 1000
# a cannot be greater than 1000/3
# b cannot be greater than 1000/2

include Math

goal = 1000


def calculate goal
	range_a = goal/3
	range_b = goal/2
	range_c = goal*2/3
	a = 1

	while a < goal
		b = a + 1
		a_sq = a**2
		while b < goal
			a_b_sum = a + b
			break if a_b_sum > range_c # break once it's impossible for c
			b_sq = b**2
			c_sq = a_sq + b_sq
			c = 1000 - a_b_sum
			if c > b && c**2 == c_sq # optimized by checking if c > b first before execute square
				puts "#{a}, #{b}, #{c}"
				return a*b*c
			end
			b+=1
		end
		a+=1
	end
end

puts calculate goal
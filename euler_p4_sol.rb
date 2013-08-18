# problem 4
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

# since we want to find out the largest palidrome number using 2 3-digit numbers
# we would like to start from the largest 3-digit numbers 999 for optimization

include Math

# since the max product is 999*999 we can count down val from 999*999 to 1 and if we found palidrome on the way, we try to find out factors of that number


def is_palindrome val
	val = val.to_s
	index_start = 0
	index_end = val.size - 1
	
	while index_start < index_end
		return false if val[index_start] != val[index_end]
		index_start+=1
		index_end-=1
	end

	true
end

# find the biggest palindrome in between min and max interval
def find_biggest_padlindrome min,max
	index = max - 1

	while index >= min
		return index if is_palindrome index
		index-=1
	end

	return false
end

def find_smallest_palindrome min,max
	index = min

	while index <= max
		return index if is_palindrome index
		index+=1
	end
	return false
end

# find all factors of val
def find_factors_of_val val
	val_current = val
	bound_max = sqrt(val).to_i + 1
	bound_min = 2
	check_list = (bound_min...(bound_max+1)).to_a
	factors = []

	while check_list.size > 0
		val = val_counter = check_list[0]
		while val_current%val == 0 # if true val is a factor of val_current
			val_current = val_current/val
			factors << val
		end

		val_last = check_list[-1]
		
		# remove all multiples in the check_list
		while val_counter <= val_last
			check_list.delete val_counter
			val_counter += val
		end

		# if check_list is empty it means the val_current is either 1 or a prime number
		factors << val_current if check_list.size == 0
	end

	factors
end

def check_if_factors_can_form_2_3_digit_nums factors
	val1 = 1
	val2 = 1
	factors.sort!.reverse!
	
	return false,[] if factors[0] > 999
	# check if factors contains val greater than 999
	
	factors.each do |val|
		temp1 = val1*val
		temp2 = val2*val

		if temp1 < 1000 && val2 > 100
			val1 = temp1
		elsif temp2 < 1000
			val2 = temp2
		else
			return false,[]
		end
	end

	return true,[val1,val2]
end


def find_biggest_palindrome_of_2_3_digit_nums_helper min,max
	biggest_palindrome = find_biggest_padlindrome min, max
	smallest_palindrome = find_smallest_palindrome min, max
	return false,[] unless smallest_palindrome

	while true
		factors = find_factors_of_val biggest_palindrome
		result = check_if_factors_can_form_2_3_digit_nums factors

		return false,[] if biggest_palindrome == smallest_palindrome

		# if the biggest_palindrome can form 2 3-digit numbers return vals
		if result[0]
			return true,result[1]
		else
			biggest_palindrome = find_biggest_padlindrome min, biggest_palindrome-1
		end
	end
end

def find_biggest_palindrome_of_2_3_digit_nums min,max
	results = find_biggest_palindrome_of_2_3_digit_nums_helper min,max

	if results[0]
		val1 = results[1][0]
		val2 = results[1][1]
		total = val1*val2
		puts "first val: #{val1}, second val: #{val2}, the biggest palindrome is: #{total}"
	else
		puts 'failed'
	end
end


find_biggest_palindrome_of_2_3_digit_nums 100*100,999*999
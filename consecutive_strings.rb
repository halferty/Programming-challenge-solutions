# Problem:
#
# Given a space-separated list of words N, which are all the same length,
# and a string s, find the first ocurrence of all of the strings in N consecutively.
#
# Example:
# N = "aaaa bbbb cccc dddd"
# s = "sdkfbyabbbbccccddddaaaadsg"
#
# Result = 6
#

# Recursively determines if a given sequence is composed
# of an array of strings
def contains_permutation(needles, haystack)
    ind = 0
	n_l = needles[0].length
	check_words = haystack.scan(/.{#{n_l}}/)
	needles_copy = Array.new(needles)
	check_words.each do |w|
		if (needles_copy.include? w)
			needles_copy.delete(w)
		else
			return false
		end
	end
	return true
end

file = File.new("input00.txt", "r")
L = file.gets.split(' ')
s = file.gets

l_len = L[0].length
total_len = l_len * L.length


index = 0

while (index < s.length)
    if contains_permutation(L, s.slice(index, total_len))
		print index
		break
	end
	index += 1
end


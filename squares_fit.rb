# Problem:
#
# Given a histogram, find the least number of rectangles
# that can full the area.
#
# Example:
# input = 1,2,2,1,0,0,0,5,5,4,1,0,4
# 
# Graph:
# 
#               5 5
#               5 5 4     4
#               5 5 4     4
#   2 2         5 5 4     4
# 1 2 2 1 _ _ _ 5 5 4 1 _ 4
# 
# Example of boxes in result:
# 
#               F F
#               E E E     C
#               E E E     C
#   D D         E E E     C
# A A A A _ _ _ B B B B _ C
# 
# Result = 6
#

class Array
	def divide_on(match)
		out = []
		index = 0
		first = 0
		while (index <= self.length)
			if (self[index] == match || index == self.length)
				if (first != index - 1)
					sub_array = self.slice(first, (index - first))
					sub_array.delete(match)
					out.push(sub_array)
					first = index
				end
			end
			index += 1
		end
		return out	
	end
end

def iterate(values)
	sum = 0
	if (values.length > 0)
		sum = 0
		m = values.min
		if (m.to_i > 0)
			sum += 1
			values = values.map do |v|
				v = v.to_i - m.to_i
			end
		end
		sub_arrays = values.divide_on("0")
		sub_arrays.each do |s|
			s.delete(0)
			sum = sum + iterate(s)
		end
	end
	return sum
end

##################################

cols = File.open(ARGV[0]).read.split(",")

print iterate(cols)

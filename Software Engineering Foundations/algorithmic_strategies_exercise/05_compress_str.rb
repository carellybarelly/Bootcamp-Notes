# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
	compressed = ""
	num = 0

	str.each_char.with_index do |char, i|
		if str[i] == str[i + 1]
			num += 1
		else
			if num < 1
				compressed += char
				num = 0
			elsif num >= 1
				compressed += (num+1).to_s + char
				num = 0		
			end
		end
	end
	
	return compressed
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"

# problem steps 
# create a 
require 'benchmark'

def build_dictionary(stopping_point, directory)
	words = []
	definition = []
	i = 0
	File.open(directory, "r") do |f|
		f.each_line do |line|
			definition = line.split
			words << definition[0]
			i += 1
			if i == stopping_point
				return words
			end
		end
	end
end

wordlist = build_dictionary(150000, "dictionary.txt")
word_to_find = "RIDICULOUSLY"

#This is the first set of code I'm looking at with profiler
#and this one has array#each and nil in it
Benchmark.bm do |b|
	b.report("For Loop: ") do
		counter = 0
		word_index = 0
		for word in wordlist
			if word == word_to_find
				word_index = counter
			end
			counter += 1
		end
		puts "#{word_to_find} is found on line #{word_index}."
	end	
#This is the first set of code I'm looking at with profiler
#and this one has fixnum#+ and Array#[] in it
	b.report("Until Loop: ") do
		counter = 0
		word_index = 0
		until word_index > 0
			if wordlist[counter] == word_to_find
				word_index = counter
			end
			counter += 1
		end
		puts "#{word_to_find} is found on line #{word_index}."
	end
	#some more tests for fun
	b.report("Simple For Loop: ") do
		for number in (1..5)
			print number
		end
	end
	b.report("Simple Until Loop: ") do
		number = 5
		until number <= 0
  			print number
  			number -= 1
		end
	end
end


Testing Speed with the Ruby Benchmark Module
============================================

I built this to compare the processing times of a for each loop and an until loop with Ruby Benchmark. 

This code will look up the word "ridiculously" in a dictionary of 150,000 words and return it's spot in the dictionary, first with a for each loop and second with an until loop. 

Call 'ruby speedtest.rb' to use the Ruby Benchmark Module to see which methods take the most time. 

You'll quickly see that that for loop takes almost twice as long to process as the until loop.
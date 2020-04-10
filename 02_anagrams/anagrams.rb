# Anagrams
# Our goal today is to write a method that determines if two given words are anagrams. This means that the letters in one word can be rearranged to form the other word. For example:

# Assume that there is no whitespace or punctuation in the given strings.

# Learning Goals
# Be able to determine the time and space complexity of a method
# Be able to recognize when and how time or space complexity can be improved
# Be able to compare different methods and discuss how changing inputs affects each one's overall runtime
# Phase I:
# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. Check if the second string is one of these.

def anagram?(str1, str2) # n!
    a1 = str1.chars.permutation.to_a # n!
    a2 = str2.chars.permutation.to_a # n!
    
    a1.any? { |ele| a2.include?(ele) } # n^2

end

# p anagram?("gizmo", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true

# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?

# Phase II:
# Write a method #second_anagram? that iterates over the first string. For each letter in the first string, find the index of that letter in the second string (hint: use Array#find_index) and delete at that index. The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.

# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??


def anagram2?(str1, str2) # n^2
    str2 = str2.chars # 1
    str1.chars.each do |char| #n
        idx = str2.index(char) # n
        if idx
            str2.delete_at(idx) # 1
        end
    end
    str2.empty?
end

# p anagram2?("gizmo", "sally")    #=> false
# p anagram2?("elvis", "lives")    #=> true

# Phase III:
# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. The strings are then anagrams if and only if the sorted versions are the identical.

# What is the time complexity of this solution? Is it better or worse than #second_anagram??

def anagram3?(str1, str2) # nlogn
    alpha_sort = Proc.new { |a1, a2| a1.ord <=> a2.ord } # 1
    letters1 = merge_sort(str1.chars, &alpha_sort) # nlogn
    letters2 = merge_sort(str2.chars, &alpha_sort) # nlogn
    letters1 == letters2 # 1 ? (does Array#==() require n???????!!!???)
end

# def anagram3?(str1, str2)
#     letters1 = str1.chars.sort{ |a1, a2| a1.ord <=> a2.ord } # nlogn
#     letters2 = str2.chars.sort{ |a1, a2| a1.ord <=> a2.ord } # nlogn
#     letters1 == letters2
# end

def merge_sort(arr, &prc)
    return arr if arr.length < 2

    middle = arr.length / 2
    left = merge_sort(arr[0...middle], &prc)
    right = merge_sort(arr[middle..-1], &prc)

    merge(left, right, &prc)
end

def merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
        if prc.call(left.first, right.first) == -1
            merged << left.shift
        else
            merged << right.shift
        end
    end
    merged + left + right
end

# p anagram3?("gizmo", "sally")    #=> false
# p anagram3?("elvis", "lives")    #=> true

# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to store the number of times each letter appears in both words. Compare the resulting hashes.

def anagram4?(str1, str2)
    hash1 = Hash.new(0) # 1
    hash2 = Hash.new(0) # 1

    str1.each_char {|char| hash1[char] += 1} # n
    str2.each_char {|char| hash2[char] += 1} # n

    hash1 == hash2 # 1 or n?
end

# p anagram4?("gizmo", "sally")    #=> false
# p anagram4?("elvis", "lives")    #=> true

# What is the time complexity?

# Bonus: Do it with only one hash.

def anagram5?(str1, str2) #O(n)
    char_count = Hash.new(0) #1

    str1.each_char {|char| char_count[char] += 1} #n
    str2.each_char {|char| char_count[char] -= 1} #n

    char_count.values.all?{|v| v == 0} #n (is Hash#values 1 or n?)
end

p anagram5?("gizmo", "sally")    #=> false
p anagram5?("elvis", "lives")    #=> true

# Discuss the time complexity of your solutions together, then call over your TA to look at them.
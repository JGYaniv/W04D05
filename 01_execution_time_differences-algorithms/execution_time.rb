require 'byebug'
# Execution Time Difference
# Learning Goals
# Be able to determine the time and space complexity of a method
# Be able to compare the time complexity of one method to another
# Be able to recognize when time or space complexity can be improved
# my_min
# Given a list of integers find the smallest number in the list.

# Example:


# Phase I
# First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

def my_min(arr) #
    min = arr[0] #
    (0...arr.length).each do |i| #
        (0...arr.length).each do |j| #
            if arr[j] < min #
                min = arr[j] 
            end
        end
    end
    min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?

def my_min2(arr) #
    min = arr[0] #
    arr.each do |el| #
        if el < min #
            min = el #
        end #
    end #
    min #
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)  # =>  -5

# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.


def largest_contiguous_subsum(array) #
    #collect subarrays
    subarrays = []
    array.each_with_index do |el1, idx1| # n^2
        array.each_with_index do |el2, idx2| # n
            subarrays << array[idx1..idx2] if idx2 >= idx1 #
        end
    end
    #nested loop that adds subarrays ranging from from outer loop idx1 to inner loop idx2
    #check for array that returns largest sum & return that sum

    sums = subarrays.map(&:sum) # n^2
    sums.max # n
end

# Example:

# p list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7
# Example 2:

# p list =  [1,-5,0,7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# # Example 3:

# p list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])

def largest_contiguous_subsum2(list) #[-5, -1, -3] => -1
    # debugger
    max = 0 # 1
    current_sum = 0 # 1

    return list.max if list.all? { |ele| ele < 0 } #edge case if all negative

    list.each_with_index do |ele, idx|
        current_sum += ele
        if current_sum < 0
            current_sum = 0
        end
        if current_sum > max
            max = current_sum
        end
    end
    # i = 0 # 1
    # until list.empty? # (shift every loop, so we are at 0(n))
    #     current_sum += list[i] # 1
    #     if current_sum > max # 1
    #         max = current_sum # 1
    #     end

    #     i += 1 # 1
    #     if i == list.length # 1 < n?
    #         list.shift # 1
    #         i = 0 # 1
    #         current_sum = 0 # 1
    #     end
    # end 

    max
end
#if our current sum drops below zero
p list =  [1,-5,0,7, -6, 7]
p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])
# Example 3:

p list = [-5, -1, -3]
p largest_contiguous_subsum2(list) # => -1 (from [-1])

# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops. First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.

# Discuss the time complexity of this solution.

# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory. Keep a running tally of the largest sum. To accomplish this efficient space complexity, consider using two variables. One variable should track the largest sum so far and another to track the current sum. We'll leave the rest to you.

# Get your story straight, and then explain your solution's time complexity to your TA.
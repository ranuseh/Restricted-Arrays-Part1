require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n) - Linear  with n being the size of the array
# Space complexity: O(1) - Constant space complexity

array = RestrictedArray.new(20)
length = 20
val = 5

def length(array)
  i = 0
  while array[i] != nil
    i += 1
  end
  return i
end

puts length(array)

# # Prints each integer values in the array
# # Time complexity: O(n) - Linear  with n being the size of the array
# # Space complexity: O(1) - Constant space complexity
def print_array(array)
  i = 0
  while array[i] != nil
    print array[i]
    i += 1
  end
end

print_array(array)

# # For an unsorted array, searches for 'value_to_find'.
# # Returns true if found, false otherwise.
# # Time complexity: O(n) - Linear  with n being the size of the array
# # Space complexity: O(1) - Constant space complexity
def search(array, length, value_to_find)
  length.times do |i|
    if array[i] == value_to_find
      return true
    end
  end
  return false
end

puts search(array, length, val)


# # Finds and returns the largest integer value the array
# # Assumes that the array is not sorted.
# # Time complexity: O(n) - Linear  with n being the size of the array
# # Space complexity: O(1) - Constant space complexity

def find_largest(array, length)
  largest_int = nil
  i = 0
  while array[i] != nil
    if largest_int == nil || array[i] > largest_int
      largest_int = array[i]
    end
    i += 1
  end
  return largest_int
end

puts find_largest(array, length)


# # Finds and returns the smallest integer value in the array
# # Assumes that the array is not sorted.
# # Time complexity: O(n) - Linear  with n being the size of the array
# # Space complexity: O(1) - Constant space complexity

def find_smallest(array, length)
  smallest_int = nil
  i = 0
  while array[i] != nil
    if smallest_int == nil || array[i] < smallest_int
      smallest_int = array[i]
    end
    i += 1
  end
  return smallest_int
end

puts find_smallest(array, length)

# # Reverses the values in the integer array in place
# # Time complexity: O(n) - Linear  with n being the size of the array
# # Space complexity: O(1) - Constant space complexity

def reverse(array, length)
  (length / 2).round.times do |i|
    temp = array[i]
    array[i] = array[length - i - 1]
    array[length - i - 1] = temp
  end
  return array
end

puts reverse(array, length)

# # For an array sorted in ascending order, searches for 'value_to_find'.
# # Returns true if found, false otherwise.
# # Time complexity: O(logn) - Linear  with n being the size of the array
# # Space complexity: O(1) - Constant space complexity

def binary_search(array, length, value_to_find)
  start_i = 0
  end_i = length

  while start_i < end_i
    middle = ((end_i + start_i) / 2).round

    if value_to_find == array[middle]
      return true
    elsif value_to_find < array[middle]
      end_i = middle - 1
    elsif value_to_find > array[middle]
      start_i = middle + 1
    end
  end
  return false
end

puts binary_search(array, length, val)


# # Helper method provided to sort the array in ascending order
# # Implements selection sort
# # Time complexity = O(n^2), where n is the number of elements in the array.
# # To find the correct value for index 0, a total of (n-1) comparisons are needed.
# # To find the correct value for index 1, a total of (n-2) comparisons are needed.
# # To find the correct value for index 2, a total of (n-3) comparisons are needed.
# # and so on ...
# # To find the correct value for index (n-2), a total of 1 comparisons is needed.
# # To find the correct value for the last index, a total of 0 comparisons are needed.
# # Total number of comparisons = (n-1) + (n-2) + ... 3 + 2 + 1
# #                             = (n * (n-1))/2
# # This is O(n^2) in Big O terms.
# # Space complexity = constant or O(1) since the additional storage needed,
# # does not depend on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
# ## --- END OF METHODS ---

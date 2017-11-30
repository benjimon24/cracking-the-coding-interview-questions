# 1.1: Is Unique: Implement an algorithm to determine if a string has all unique characters. WHat if you cannot use additional data structures?
def is_Unique(string)
  #check each character with every other character in the string
  i = 0
  while i < string.length
    j = i + 1
    while j < string.length
      return false if string[i] == string[j]
      j += 1
    end
    i += 1
  end
  true

  #sort the string and compare each character with its neighbor
  # string = string.chars.sort.join
  # i = 0
  # while i < string.length - 1
  #   return false if string[i] == string[i + 1]
  #   i += 1
  # end
  # true
end

# puts is_Unique("asdfasdf") == false
# puts is_Unique("ff") == false
# puts is_Unique("asdfghjk") == true
# puts is_Unique("asdfghjkryqomv") == true

# 1.2: Given two strings, write a method to check if one string is a permutation of the other.
def is_Permutation(string, string2)
  firstString = string.chars.sort.join
  secondString = string2.chars.sort.join
  if firstString == secondString
    return true
  else
    return false
  end
end
#
# puts is_Permutation("hello", "asdff") == false
# puts is_Permutation("adsfa", "fdasf") == false
# puts is_Permutation("hello", "elloh") == true
# puts is_Permutation("asdf", "fdsa") == true

# 1.3: Replace all spaces in a string with %20, (excluding leading and trailing whitespace?)
def URLify(string)
  result = string.strip
  result.gsub(" ", "%20")
end
#
# puts URLify("You are cool!") == "You%20are%20cool!"
# puts URLify("hello there    ") == "hello%20there"
# puts URLify("   wassup dawg") == "wassup%20dawg"

# 1.4: Check if the string is a permutation of a palindrome - if it can be rearranged to be a palindrome
def palindrome_permutation(string)
  array = string.gsub(" ", "").downcase.split("")
  letters = array.uniq
  odd_count = 0
  letters.each do |letter|
    odd_count += 1 if array.count(letter).odd?
  end
  if odd_count > 1
    return false
  else
    return true
  end
end

# puts palindrome_permutation("Tact Coa") == true
# puts palindrome_permutation("asdfFdsa") == true
# puts palindrome_permutation("zxcvzxcvz") == true
# puts palindrome_permutation("zxcvzxcvzxcv") == false

# 1.5 There are three types of edits that can be performed on strings - insert, remove, or replace a character. Given two strings, write a function to check if they are one edit or less away
def one_away(string, string2)
  string = string.split("")
  string2 = string2.split("")

  i = 0
  while i < string.length
    j = 0
    while j < string2.length
      if string[i] == string2[j]
        string[i] = ""
        string2[j] = ""
        break
      end
      j += 1
    end
    i += 1
  end

  if string.join.length > 1 || string2.join.length > 1
    return false
  else
    return true
  end
end

# puts one_away("pale", "ple") == true
# puts one_away("pales", "pale") == true
# puts one_away("pale", "bale") == true
# puts one_away("pale", "bake") == false

# 1.6 compresses a string using the counts of each letter. ie. aabcccccaaa -> a2b1c5a3
def compress_string(string)
  compressed_string = ""
  i = 0

  while i < string.length
    current_letter = string[i]
    count = 0
    while string[i] == current_letter
      count += 1
      i += 1
    end
    compressed_string += current_letter + count.to_s
  end

  compressed_string
end

# puts compress_string("aaaabbbbcccccccccaa") == "a4b4c9a2"
# puts compress_string("abbbccdddaaddddddddd") == "a1b3c2d3a2d9"

# 1.7 given an image represented by an NxN matrix, write a method to rotate the image by 90 degrees

# 1.8 write an algorithm such that if an element in an MxN matrix is 0, its row and column is set to 0
def zero_matrix(matrix)
  zeroes = find_zeroes(matrix)

  zeroes.each do |coordinates|
    # set row to zero
    i = 0
    while i < matrix.length
      matrix[coordinates[0]][i] = 0
      i += 1
    end

    # set column to zero
    j = 0
    while j < matrix[0].length
      matrix[j][coordinates[1]] = 0
      j += 1
    end

  end
  matrix
end

def find_zeroes(matrix)
  result = []
  x = 0
  while x < matrix.length
    y = 0
    while y < matrix[x].length
      if matrix[x][y] == 0
        result << [x, y]
      end
      y += 1
    end
    x += 1
  end
  result
end

p zero_matrix([[1, 2, 3],
              [4, 0, 6],
              [7, 8, 9]])

p zero_matrix([[1, 2, 0],
              [4, 5, 6],
              [7, 8, 9]])

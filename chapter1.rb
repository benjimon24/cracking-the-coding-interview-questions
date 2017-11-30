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

puts one_away("pale", "ple") == true
puts one_away("pales", "pale") == true
puts one_away("pale", "bale") == true
puts one_away("pale", "bake") == false

# Week 1 Quiz
# What is the value of a after the below code is executed?
# a = 1
# b = a
# b = 3
a = 1
# What's the difference between an Array and a Hash?
With an array, you select the value from the order in the array.
In a Hash you select the value from the key
# Every Ruby expression returns a value. Say what value is returned in the below expressions:
# arr = [1, 2, 3, 3]
# [1, 2, 3, 3].uniq
arr = [1, 2, 3, 3]
# [1, 2, 3, 3].uniq!
arr = [1, 2, 3]
# What's the difference between the map and select methods for the Array class? Give an example of when you'd use one versus the other.
map adds data to a array where as select allows you to select certain parts of an array
therefore if you want to add data to all the values of a array, you would choose the map method.
However if you only want to get certain values in an array, you would choose the select method.

# Say you wanted to create a Hash. How would you do so if you wanted the hash keys to be String objects instead of symbols?
hash = {"string" => 1}

# What is returned?
# x = 1
# x.odd? ? "no way!" : "yes, sir!"
"no way!"

# What is x?
# x = 1
# 3.times do
#   x += 1
# end
# puts x
4

# What is x?
# 3.times do
#   x += 1
# end
# puts x
3
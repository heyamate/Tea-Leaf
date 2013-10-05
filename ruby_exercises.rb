puts "Which question do you want answered?"
puts "1) Use the 'each' method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value."
puts "2) Same as above, but only print out values greater than 5."
puts "3) Now, using the same array from #2, use the 'select' method to extract all odd numbers into a new array."
puts "4) Append '11' to the end of the array. Prepend '0' to the beginning."
puts "5) Get rid of '11'. And append a '3'."
puts "6) Get rid of duplicates without specifically removing any one value."
puts "7) What's the major difference between an Array and a Hash?"
puts "8) Create a Hash using both Ruby 1.8 and 1.9 syntax."
puts "9) Get the value of key 'b'"
puts "10) Add to this hash the key:value pair {e:5}"
puts "11) Remove all key:value pairs whose value is less than 3.5"
puts "12) Can hash values be arrays? Can you have an array of hashes? (give examples)"
puts "13) Look at several Rails/Ruby online API sources and say which one your like best and why."

arr = [1,2,3,4,5,6,7,8,9,10]
condition = false
while condition = true
  input = gets.chomp
  puts "You chose to answer question #{input}"
  if !['1','2','3','4','5','6','7','8','9','10','11','12','13'].include?(input) 
    puts "Sorry but I can't accept #{input}. You can only put in 1 to 13."
    next
  end
  break
  
end

case input
  when "1"
    #1. Use the "each" method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.

    arr.each do |e|
      puts e
    end
    exit

  when "2"
    #2. Same as above, but only print out values greater than 5.

    arr.each { |element| puts element if element > 5}
    exit

  when "3"
    #3. Now, using the same array from #2, use the "select" method to extract all odd numbers into a new array.

    arr.select! do |element|
      element % 2 != 0
    end
    arr.each do |e|
      puts e
    end
    exit
  
  when "4"
    #4. Append "11" to the end of the array. Prepend "0" to the beginning.
    arr << 11
    arr.unshift(0)
    puts "#{arr}"
    exit

  when "5"
    #5. Get rid of "11". And append a "3".
    arr << 11
    arr.unshift(0)
    puts "original array - #{arr}"
    arr.pop
    arr.push(3)
    puts "updated array - #{arr}"
    exit

  when "6"
    #6. Get rid of duplicates without specifically removing any one value.
    arr << 11
    arr.unshift(0)
    arr.pop
    arr.push(3)
    puts "original array - #{arr}"
    arr.uniq!
    puts "updated array - #{arr}"
    exit

  when "7"
    #7. What's the major difference between an Array and a Hash?
    puts 'Arrays are selected by the order in the array. A hash is selected by the value of key.'
    exit

  when "8"
    #8. Create a Hash using both Ruby 1.8 and 1.9 syntax.
    puts "Suppose you have a h = {a:1, b:2, c:3, d:4}"
    puts "Ruby 1.8 - hash = {a:1, b:2}"
    puts "Ruby 1.8 - hash2 = {:a ==> 1, :b => 2}"
    exit

  when "9"
    #9. Get the value of key "b".
    hash = {a:1, b:2}
    puts "#{hash}"
    puts "#{hash[:b]}"
    exit

  when "10"
    #10. Add to this hash the key:value pair {e:5}
    hash = {a:1, b:2}
    hash[:e] = 5
    puts "#{hash}"
    exit

  when "11"
    #11. Remove all key:value pairs whose value is less than 3.5
    hash = {a:1, b:2}
    hash[:e] = 5
    puts "Starting hash - #{hash}"
    hash.each do|k,v|
     hash.delete(k) if v < 3.5
    end
    puts "Ending hash - #{hash}"
    exit

  when "12"
    #12. Can hash values be arrays? Can you have an array of hashes? (give examples)
    puts "Hash values can be Arrays. An array of hashes for example are:"
    arr2 = [{a:1},{a:2, b:3}]
    puts "#{arr2}"

  when "13"
    #13. Look at several Rails/Ruby online API sources and say which one your like best and why.
    puts "http://ruby-doc.org/"
    puts "The search function works the best from all the api docs I have looked at"
end













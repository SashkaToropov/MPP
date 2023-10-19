  print "Enter a list of numbers separated by spaces: "
  num_list = gets.chomp.split.map(&:to_i)

  print "Do you want to sort in ascending (>) or descending (<) order? "
  sort_order = gets.chomp.downcase

  case sort_order
  when '>'
    sorted_list = num_list.sort
  when '<'
    sorted_list = num_list.sort.reverse
  else
    puts "Invalid choice. Please enter '>' for ascending or '<' for descending."
    return
  end

  puts "Sorted list: #{sorted_list.join(' ')}"

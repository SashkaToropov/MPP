    print "Enter the length of the password: "
    password_length = gets.chomp.to_i
    if password_length <= 0
      puts "Password length must be a positive integer."
      return
    end

    characters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a + ['!', '@', '#', '$', '%', '^', '&', '*']
    password = (0...password_length).map { characters.sample }.join
    puts "Generated password: #{password}"
